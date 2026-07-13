# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights Reserved.
## Small, deterministic Lua interpreter for the statement/expression subset used by GSL Payload blocks.
class_name Gs2StateMachineLocalLuaInterpreter
extends RefCounted


var _tokens: Array = []
var _position := 0
var _consume_actions: Array = []
var _acquire_actions: Array = []
var _request_encoder: Callable


func execute(
    source: String,
    args: Dictionary,
    consume_actions: Array,
    acquire_actions: Array,
    request_encoder: Callable
):
    _tokens = _tokenize(source)
    _position = 0
    _consume_actions = consume_actions
    _acquire_actions = acquire_actions
    _request_encoder = request_encoder
    var statements = _parse_block([])
    var environment = {
        "args": args,
        "result": null,
        "transaction": {
            "execute": Callable(self, "_transaction_execute"),
            "service": Callable(self, "_transaction_service"),
        },
        "table": {"insert": Callable(self, "_table_insert")},
        "print": func(_value): return null,
    }
    _execute_block(statements, environment)
    var result = environment.result
    environment.clear()
    _tokens.clear()
    _request_encoder = Callable()
    return result


func _tokenize(source: String) -> Array:
    var tokens := []
    var index := 0
    while index < source.length():
        var character = source[index]
        if character in [" ", "\t", "\r", "\n"]:
            index += 1
            continue
        if character == "-" and index + 1 < source.length() and source[index + 1] == "-":
            index += 2
            while index < source.length() and source[index] != "\n":
                index += 1
            continue
        if character in ["\"", "'"]:
            var quote = character
            var value := ""
            index += 1
            while index < source.length() and source[index] != quote:
                if source[index] == "\\" and index + 1 < source.length():
                    index += 1
                    value += source[index]
                else:
                    value += source[index]
                index += 1
            index += 1
            tokens.append({"type": "string", "value": value})
            continue
        if character >= "0" and character <= "9":
            var start = index
            while index < source.length() and (
                (source[index] >= "0" and source[index] <= "9") or source[index] == "."
            ):
                index += 1
            var number = source.substr(start, index - start)
            tokens.append({
                "type": "number", "value": float(number) if number.contains(".") else int(number),
            })
            continue
        if (character >= "A" and character <= "Z") or (character >= "a" and character <= "z") or character == "_":
            var start = index
            while index < source.length():
                var candidate = source[index]
                if not ((candidate >= "A" and candidate <= "Z") or (candidate >= "a" and candidate <= "z") or (candidate >= "0" and candidate <= "9") or candidate == "_"):
                    break
                index += 1
            tokens.append({"type": "identifier", "value": source.substr(start, index - start)})
            continue
        var operation = source.substr(index, 2)
        if operation in ["==", "~=", "<=", ">="]:
            tokens.append({"type": "symbol", "value": operation})
            index += 2
        else:
            tokens.append({"type": "symbol", "value": character})
            index += 1
    tokens.append({"type": "eof", "value": "eof"})
    return tokens


func _parse_block(stops: Array) -> Array:
    var statements := []
    while _peek_value() != "eof" and not stops.has(_peek_value()):
        statements.append(_parse_statement())
    return statements


func _parse_statement():
    if _match("local"):
        var target = _parse_expression(0)
        _expect("=")
        return {"kind": "assign", "target": target, "value": _parse_expression(0)}
    if _match("function"):
        var name = _advance().value
        _expect("(")
        var parameters := []
        if not _check(")"):
            while true:
                parameters.append(_advance().value)
                if not _match(","):
                    break
        _expect(")")
        var body = _parse_block(["end"])
        _expect("end")
        return {"kind": "function", "name": name, "parameters": parameters, "body": body}
    if _match("if"):
        var branches := []
        var condition = _parse_expression(0)
        _expect("then")
        branches.append({"condition": condition, "body": _parse_block(["elseif", "else", "end"])})
        while _match("elseif"):
            condition = _parse_expression(0)
            _expect("then")
            branches.append({"condition": condition, "body": _parse_block(["elseif", "else", "end"])})
        var else_body := []
        if _match("else"):
            else_body = _parse_block(["end"])
        _expect("end")
        return {"kind": "if", "branches": branches, "else": else_body}
    if _match("for"):
        var name = _advance().value
        _expect("=")
        var start = _parse_expression(0)
        _expect(",")
        var finish = _parse_expression(0)
        _expect("do")
        var body = _parse_block(["end"])
        _expect("end")
        return {"kind": "for", "name": name, "start": start, "finish": finish, "body": body}
    if _match("return"):
        return {"kind": "return", "value": _parse_expression(0)}
    var expression = _parse_expression(0)
    if _match("="):
        return {"kind": "assign", "target": expression, "value": _parse_expression(0)}
    return {"kind": "expression", "value": expression}


func _parse_expression(minimum_precedence: int):
    var left
    if _match("#"):
        left = {"kind": "unary", "operation": "#", "value": _parse_expression(6)}
    elif _match("-"):
        left = {"kind": "unary", "operation": "-", "value": _parse_expression(6)}
    elif _match("{"):
        left = _parse_table()
    elif _match("("):
        left = _parse_expression(0)
        _expect(")")
    else:
        var token = _advance()
        if token.type == "number" or token.type == "string":
            left = {"kind": "literal", "value": token.value}
        elif token.value in ["true", "false", "nil"]:
            left = {"kind": "literal", "value": true if token.value == "true" else (false if token.value == "false" else null)}
        else:
            left = {"kind": "variable", "name": token.value}
    while true:
        if _match("."):
            left = {"kind": "field", "base": left, "name": _advance().value}
            continue
        if _match("["):
            var index = _parse_expression(0)
            _expect("]")
            left = {"kind": "index", "base": left, "index": index}
            continue
        if _match("("):
            var arguments := []
            if not _check(")"):
                while true:
                    arguments.append(_parse_expression(0))
                    if not _match(","):
                        break
            _expect(")")
            left = {"kind": "call", "callee": left, "arguments": arguments}
            continue
        var operation = _peek_value()
        var precedence = {"or": 1, "and": 2, "==": 3, "~=": 3, "<": 3, ">": 3, "<=": 3, ">=": 3, "+": 4, "-": 4}.get(operation, -1)
        if precedence < minimum_precedence:
            break
        _advance()
        left = {
            "kind": "binary", "operation": operation, "left": left,
            "right": _parse_expression(precedence + 1),
        }
    return left


func _parse_table():
    var named := {}
    var array := []
    if not _check("}"):
        while true:
            if _peek().type == "identifier" and _peek_value(1) == "=":
                var key = _advance().value
                _expect("=")
                named[key] = _parse_expression(0)
            else:
                array.append(_parse_expression(0))
            if not _match(","):
                break
            if _check("}"):
                break
    _expect("}")
    return {"kind": "table", "named": named, "array": array}


func _execute_block(statements: Array, environment: Dictionary) -> Dictionary:
    for statement in statements:
        var result = _execute_statement(statement, environment)
        if result.returned:
            return result
    return {"returned": false, "value": null}


func _execute_statement(statement: Dictionary, environment: Dictionary) -> Dictionary:
    match statement.kind:
        "assign":
            _assign(statement.target, _evaluate(statement.value, environment), environment)
        "function":
            environment[statement.name] = {
                "__function": true, "parameters": statement.parameters,
                "body": statement.body, "closure": environment,
            }
        "if":
            for branch in statement.branches:
                if _truthy(_evaluate(branch.condition, environment)):
                    return _execute_block(branch.body, environment)
            return _execute_block(statement.else, environment)
        "for":
            var start = int(_evaluate(statement.start, environment))
            var finish = int(_evaluate(statement.finish, environment))
            for value in range(start, finish + 1):
                environment[statement.name] = value
                var loop_result = _execute_block(statement.body, environment)
                if loop_result.returned:
                    return loop_result
        "return":
            return {"returned": true, "value": _evaluate(statement.value, environment)}
        "expression":
            _evaluate(statement.value, environment)
    return {"returned": false, "value": null}


func _evaluate(expression: Dictionary, environment: Dictionary):
    match expression.kind:
        "literal":
            return expression.value
        "variable":
            return environment.get(expression.name)
        "field":
            var base = _evaluate(expression.base, environment)
            if base is Dictionary and base.has("__service"):
                var proxy = base.duplicate()
                proxy.__path = base.__path + [expression.name]
                return proxy
            return base.get(expression.name) if base is Dictionary else null
        "index":
            var base = _evaluate(expression.base, environment)
            var index = _evaluate(expression.index, environment)
            if base is Array:
                return base[int(index) - 1]
            return base.get(index) if base is Dictionary else null
        "call":
            var callee = _evaluate(expression.callee, environment)
            var arguments = expression.arguments.map(func(v): return _evaluate(v, environment))
            return _call(callee, arguments)
        "table":
            if expression.named.is_empty():
                return expression.array.map(func(v): return _evaluate(v, environment))
            var table := {}
            for key in expression.named:
                table[key] = _evaluate(expression.named[key], environment)
            return table
        "unary":
            var value = _evaluate(expression.value, environment)
            return value.size() if expression.operation == "#" else -value
        "binary":
            var left = _evaluate(expression.left, environment)
            if expression.operation == "and" and not _truthy(left):
                return left
            if expression.operation == "or" and _truthy(left):
                return left
            var right = _evaluate(expression.right, environment)
            match expression.operation:
                "+": return left + right
                "-": return left - right
                "==": return left == right
                "~=": return left != right
                "<": return left < right
                ">": return left > right
                "<=": return left <= right
                ">=": return left >= right
                "and", "or": return right
    return null


func _assign(target: Dictionary, value, environment: Dictionary) -> void:
    if target.kind == "variable":
        environment[target.name] = value
        return
    var base = _evaluate(target.base, environment)
    if target.kind == "field" and base is Dictionary:
        base[target.name] = value
    elif target.kind == "index":
        var index = _evaluate(target.index, environment)
        if base is Array:
            base[int(index) - 1] = value
        elif base is Dictionary:
            base[index] = value


func _call(callee, arguments: Array):
    if callee is Callable:
        return callee.callv(arguments)
    if callee is Dictionary and callee.has("__function"):
        var environment = callee.closure.duplicate()
        for index in callee.parameters.size():
            environment[callee.parameters[index]] = arguments[index] if index < arguments.size() else null
        return _execute_block(callee.body, environment).value
    if callee is Dictionary and callee.has("__service") and callee.__path.size() == 2:
        return _build_action(callee.__service, callee.__path[1], arguments[0])
    return null


func _truthy(value) -> bool:
    return value != null and value != false


func _transaction_service(service_name: String):
    return {"__service": service_name, "__path": []}


func _transaction_execute(actions) -> bool:
    for action in actions.get("consumeActions", []):
        _consume_actions.append(action)
    for action in actions.get("acquireActions", []):
        _acquire_actions.append(action)
    return true


func _table_insert(array: Array, value):
    array.append(value)
    return null


func _build_action(service_name: String, method_name: String, request: Dictionary):
    var service_pascal = ""
    for part in service_name.split("_"):
        service_pascal += part.capitalize()
    var method_pascal = ""
    for part in method_name.split("_"):
        method_pascal += part.capitalize()
    var action_name = "Gs2" + service_pascal + ":" + method_pascal
    var model = Gs2ConsumeAction.new() if method_name.begins_with("consume_") else Gs2AcquireAction.new()
    model.action = action_name
    var configured = request.duplicate(true)
    configured.userId = "#{userId}"
    model.request = _request_encoder.call(configured)
    return model


func _peek(offset := 0):
    return _tokens[min(_position + offset, _tokens.size() - 1)]


func _peek_value(offset := 0):
    return _peek(offset).value


func _advance():
    var token = _peek()
    _position += 1
    return token


func _check(value: String) -> bool:
    return _peek_value() is String and _peek_value() == value


func _match(value: String) -> bool:
    if not _check(value):
        return false
    _advance()
    return true


func _expect(value: String) -> void:
    if not _match(value):
        push_error("Lua parse error: expected '%s', got '%s'" % [value, str(_peek_value())])
