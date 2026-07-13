# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights Reserved.
## Hand-written Godot port of Unity LocalStateMachineKit's in-process GSL runtime.
class_name Gs2StateMachineLocalActiveStateMachine
extends RefCounted


const LuaInterpreter = preload("res://addons/gs2/state_machine/local/lua_interpreter.gd")

signal emitted(event_name, parameters)
signal changed_state(task_name, hash_string)
signal issued_transaction(consume_actions, acquire_actions)

const INITIALIZED = "Initialized"
const RUNNING = "Running"
const WAIT = "Wait"
const PASS = "Pass"
const ERROR = "Error"

var state_machines: Array = []
var stacks: Array = []
var variables := {}
var status := INITIALIZED
var last_error = null
var transition_count := 0
var user_id := ""


static func setup(user_id_: String, gsl: String, entry_state_machine_name: String):
    var runtime = new()
    runtime.user_id = user_id_
    runtime.state_machines = runtime._parse(gsl)
    var entry = runtime._state_machine(entry_state_machine_name)
    if entry == null:
        runtime.last_error = "state machine not found: " + entry_state_machine_name
        runtime.status = ERROR
        return runtime
    runtime.stacks = [{
        "state_machine_name": entry.name,
        "task_name": entry.entry_point,
    }]
    for state_machine in runtime.state_machines:
        runtime.variables[state_machine.name] = {}
    return runtime


func start(parameters := {}) -> void:
    _invoke(parameters)


func emit(event_name: String, parameters := {}) -> void:
    emitted.emit(event_name, parameters.duplicate(true))
    _inner_emit(event_name, parameters)


func current_variables() -> Dictionary:
    if stacks.is_empty():
        return {}
    return variables.get(stacks[-1].state_machine_name, {})


func variables_for(state_machine_name: String) -> Dictionary:
    return variables.get(state_machine_name, {})


func _state_machine(state_machine_name: String):
    for state_machine in state_machines:
        if state_machine.name == state_machine_name:
            return state_machine
    return null


func _current_state_machine():
    return null if stacks.is_empty() else _state_machine(stacks[-1].state_machine_name)


func _current_task():
    var state_machine = _current_state_machine()
    if state_machine == null:
        return null
    for task in state_machine.tasks:
        if task.name == stacks[-1].task_name:
            return task
    return null


func _invoke(parameters: Dictionary) -> void:
    var task = _current_task()
    if task == null or task.type != "Script":
        return
    var consume_actions := []
    var acquire_actions := []
    var result = _execute_script(task, parameters, consume_actions, acquire_actions)
    issued_transaction.emit(consume_actions, acquire_actions)
    changed_state.emit(task.name, _compute_hash(consume_actions, acquire_actions))
    _inner_emit(result.event, result.parameters)


func _execute_script(task, parameters: Dictionary, consume: Array, acquire: Array) -> Dictionary:
    var state_machine_name = stacks[-1].state_machine_name
    var current = variables[state_machine_name]
    var result = LuaInterpreter.new().execute(
        task.payload,
        {"variables": current, "params": parameters, "userId": user_id},
        consume,
        acquire,
        Callable(self, "_encode_request")
    )
    if result == null:
        return {"event": "Error", "parameters": {"reason": "result not defined"}}
    variables[state_machine_name] = result.get("updatedVariables", {})
    var result_parameters = result.get("params", {})
    if result_parameters is Array and result_parameters.is_empty():
        result_parameters = {}
    return {
        "event": result.get("event", "Error"),
        "parameters": result_parameters,
    }


func _inner_emit(event_name: String, parameters: Dictionary) -> void:
    transition_count += 1
    if transition_count > 1000:
        last_error = "The maximum number of state transitions has been reached"
        status = ERROR
        return
    var state_machine = _current_state_machine()
    var task = _current_task()
    if state_machine == null or task == null:
        return
    var transition = null
    for candidate in state_machine.transitions:
        if candidate.name == task.name and candidate.handling == event_name:
            transition = candidate
            break
    if transition == null:
        return
    var next = null
    for candidate in state_machine.tasks:
        if candidate.name == transition.destination:
            next = candidate
            break
    if next == null:
        return
    var current_stack = stacks[-1]
    if next.type == "SubStateMachine":
        stacks[-1] = {
            "state_machine_name": current_stack.state_machine_name,
            "task_name": next.name,
        }
        var sub = _state_machine(next.using)
        stacks.append({"state_machine_name": sub.name, "task_name": sub.entry_point})
        var sub_parameters := {}
        for mapping in next.in_parameters:
            sub_parameters[mapping.to] = variables[current_stack.state_machine_name].get(mapping.from)
        status = RUNNING
        _invoke(sub_parameters)
        return

    stacks.pop_back()
    if next.type == "Pass" and not stacks.is_empty():
        var return_stack = stacks[-1]
        var sub_task = _current_task()
        if sub_task != null and sub_task.type == "SubStateMachine":
            for mapping in sub_task.out_parameters:
                variables[return_stack.state_machine_name][mapping.to] = variables[
                    current_stack.state_machine_name
                ].get(mapping.from)
            variables.erase(current_stack.state_machine_name)
            _inner_emit("Pass", parameters)
        return
    if next.type == "Error" and not stacks.is_empty():
        last_error = parameters.get("reason", current_stack.state_machine_name + "." + current_stack.task_name)
        _inner_emit("Error", parameters)
        return

    stacks.append({
        "state_machine_name": current_stack.state_machine_name,
        "task_name": next.name,
    })
    if next.type == "Pass":
        status = PASS
    elif next.type == "Wait":
        status = WAIT
    elif next.type == "Error":
        last_error = parameters.get("reason", current_stack.state_machine_name + "." + current_stack.task_name)
        status = ERROR
    elif next.type == "Script":
        status = RUNNING
        _invoke(parameters)


func _encode_request(request: Dictionary) -> String:
    return _canonical_json(_normalize_numbers(request))


func _compute_hash(consume: Array, acquire: Array) -> String:
    var normalized_variables := {}
    for state_machine_name in variables:
        normalized_variables[state_machine_name] = _normalize_numbers(variables[state_machine_name])
    var data = {
        "variables": normalized_variables,
        "consumeActions": consume.map(func(v): return {"action": v.action, "request": v.request}),
        "acquireActions": acquire.map(func(v): return {"action": v.action, "request": v.request}),
        "transitionCount": transition_count,
    }
    var context = HashingContext.new()
    context.start(HashingContext.HASH_SHA256)
    context.update(_canonical_json(data).to_utf8_buffer())
    return context.finish().hex_encode().to_upper()


func _normalize_numbers(value):
    if value is int or value is float:
        return "%.8f" % float(value)
    if value is Array:
        return value.map(func(v): return _normalize_numbers(v))
    if value is Dictionary:
        var result := {}
        for key in value:
            result[str(key)] = _normalize_numbers(value[key])
        return result
    return value


func _canonical_json(value) -> String:
    if value == null:
        return "null"
    if value is bool:
        return "true" if value else "false"
    if value is String:
        return JSON.stringify(value)
    if value is int or value is float:
        return str(value)
    if value is Array:
        return "[" + ",".join(value.map(func(v): return _canonical_json(v))) + "]"
    if value is Dictionary:
        var keys = value.keys()
        keys.sort()
        var entries := []
        for key in keys:
            entries.append(JSON.stringify(str(key)) + ":" + _canonical_json(value[key]))
        return "{" + ",".join(entries) + "}"
    return JSON.stringify(str(value))


func _parse(gsl: String) -> Array:
    var result := []
    var regex = RegEx.new()
    regex.compile("StateMachine\\s+([A-Za-z_][A-Za-z0-9_]*)\\s*\\{")
    var offset := 0
    while true:
        var match = regex.search(gsl, offset)
        if match == null:
            break
        var open = gsl.find("{", match.get_start())
        var close = _matching_brace(gsl, open)
        result.append(_parse_state_machine(match.get_string(1), gsl.substr(open + 1, close - open - 1)))
        offset = close + 1
    return result


func _parse_state_machine(name: String, body: String):
    var state_machine = {
        "name": name, "variables": [], "tasks": [], "transitions": [], "entry_point": "",
    }
    var variables_regex = RegEx.new()
    variables_regex.compile("Variables\\s*\\{([^}]*)\\}")
    var variables_match = variables_regex.search(body)
    if variables_match != null:
        var declaration_regex = RegEx.new()
        declaration_regex.compile("(int|float|string|bool|array|map)\\s+([A-Za-z_][A-Za-z0-9_]*)\\s*;")
        for declaration in declaration_regex.search_all(variables_match.get_string(1)):
            state_machine.variables.append({
                "type": declaration.get_string(1), "name": declaration.get_string(2),
            })
    var entry_regex = RegEx.new()
    entry_regex.compile("EntryPoint\\s+([A-Za-z_][A-Za-z0-9_]*)\\s*;")
    var entry_match = entry_regex.search(body)
    if entry_match != null:
        state_machine.entry_point = entry_match.get_string(1)
    _parse_tasks_and_transitions(body, state_machine)
    return state_machine


func _parse_tasks_and_transitions(body: String, state_machine: Dictionary) -> void:
    var token_regex = RegEx.new()
    token_regex.compile("(SubStateMachineTask|WaitTask|PassTask|ErrorTask|Task|Transition)\\s+([A-Za-z_][A-Za-z0-9_]*)")
    for match in token_regex.search_all(body):
        if _brace_depth(body, match.get_start()) != 0:
            continue
        var kind = match.get_string(1)
        var name = match.get_string(2)
        if kind == "Transition":
            var end = body.find(";", match.get_end())
            var transition_regex = RegEx.new()
            transition_regex.compile("Transition\\s+\\w+\\s+handling\\s+(\\w+)\\s*->\\s*(\\w+)")
            var transition = transition_regex.search(body.substr(match.get_start(), end - match.get_start()))
            state_machine.transitions.append({
                "name": name,
                "handling": transition.get_string(1),
                "destination": transition.get_string(2),
            })
            continue
        var task = {
            "type": {"Task": "Script", "SubStateMachineTask": "SubStateMachine", "WaitTask": "Wait", "PassTask": "Pass", "ErrorTask": "Error"}[kind],
            "name": name, "parameters": [], "events": [], "payload": "",
            "using": "", "in_parameters": [], "out_parameters": [],
        }
        if kind in ["PassTask", "ErrorTask"]:
            _parse_parameters(body.substr(match.get_end(), body.find(";", match.get_end()) - match.get_end()), task.parameters)
        else:
            var open = body.find("{", match.get_end())
            var close = _matching_brace(body, open)
            var task_body = body.substr(open + 1, close - open - 1)
            _parse_parameters(body.substr(match.get_end(), open - match.get_end()), task.parameters)
            _parse_task_body(task_body, task)
        state_machine.tasks.append(task)


func _parse_task_body(body: String, task: Dictionary) -> void:
    var event_regex = RegEx.new()
    event_regex.compile("Event\\s+(\\w+)\\s*\\(([^)]*)\\)\\s*;")
    for event_match in event_regex.search_all(body):
        var event = {"name": event_match.get_string(1), "parameters": []}
        _parse_parameters("(" + event_match.get_string(2) + ")", event.parameters)
        task.events.append(event)
    var payload_start = body.find("Payload")
    if payload_start >= 0:
        var open = body.find("{", payload_start)
        var close = _matching_brace(body, open)
        task.payload = body.substr(open + 1, close - open - 1)
    var using_regex = RegEx.new()
    using_regex.compile("using\\s+(\\w+)\\s*;")
    var using_match = using_regex.search(body)
    if using_match != null:
        task.using = using_match.get_string(1)
    _parse_mappings(body, "in", "<-", task.in_parameters)
    _parse_mappings(body, "out", "->", task.out_parameters)


func _parse_parameters(text: String, target: Array) -> void:
    var parameter_regex = RegEx.new()
    parameter_regex.compile("(int|float|string|bool|array|map)\\s+([A-Za-z_][A-Za-z0-9_]*)")
    for parameter in parameter_regex.search_all(text):
        target.append({"type": parameter.get_string(1), "name": parameter.get_string(2)})


func _parse_mappings(body: String, keyword: String, arrow: String, target: Array) -> void:
    var section_regex = RegEx.new()
    section_regex.compile(keyword + "\\s*\\(([^)]*)\\)")
    var section = section_regex.search(body)
    if section == null:
        return
    for element in section.get_string(1).split(","):
        var sides = element.split(arrow)
        if sides.size() == 2:
            if arrow == "<-":
                target.append({"from": sides[1].strip_edges(), "to": sides[0].strip_edges()})
            else:
                target.append({"from": sides[0].strip_edges(), "to": sides[1].strip_edges()})


func _matching_brace(text: String, open: int) -> int:
    var depth := 0
    for index in range(open, text.length()):
        if text[index] == "{":
            depth += 1
        elif text[index] == "}":
            depth -= 1
            if depth == 0:
                return index
    return text.length() - 1


func _brace_depth(text: String, end: int) -> int:
    var depth := 0
    for index in end:
        if text[index] == "{":
            depth += 1
        elif text[index] == "}":
            depth -= 1
    return depth
