# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights Reserved.
## Hand-written Godot port of Unity LocalStateMachineKit's EventStream.
class_name Gs2StateMachineLocalEventStream
extends RefCounted


var events: Array = []


func attach(state_machine) -> void:
    var stream_ref = weakref(self)
    state_machine.emitted.connect(func(event_name, parameters):
        var stream = stream_ref.get_ref()
        if stream == null:
            return
        stream.events.append({
            "type": "emit", "event": event_name,
            "parameters": parameters.duplicate(true),
        })
    )
    state_machine.changed_state.connect(func(task_name, hash_string):
        var stream = stream_ref.get_ref()
        if stream == null:
            return
        stream.events.append({
            "type": "change_state", "task_name": task_name, "hash": hash_string,
        })
    )
