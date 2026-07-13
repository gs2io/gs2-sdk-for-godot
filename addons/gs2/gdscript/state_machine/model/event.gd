# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# or in the "license" file accompanying this file. This file is distributed
# on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
# express or implied. See the License for the specific language governing
# permissions and limitations under the License.
class_name Gs2StateMachineEvent
extends RefCounted


var event_type = null
var change_state_event = null
var emit_event = null


func with_event_type(v) -> Gs2StateMachineEvent:
    event_type = v
    return self


func with_change_state_event(v) -> Gs2StateMachineEvent:
    change_state_event = v
    return self


func with_emit_event(v) -> Gs2StateMachineEvent:
    emit_event = v
    return self


static func from_dict(data) -> Gs2StateMachineEvent:
    if data == null:
        return null
    var ret = Gs2StateMachineEvent.new()
    ret.event_type = null if data.get("eventType") == null else str(data.get("eventType"))
    ret.change_state_event = null if data.get("changeStateEvent") == null else Gs2StateMachineChangeStateEvent.from_dict(data.get("changeStateEvent"))
    ret.emit_event = null if data.get("emitEvent") == null else Gs2StateMachineEmitEvent.from_dict(data.get("emitEvent"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["eventType"] = event_type
    ret["changeStateEvent"] = null if change_state_event == null else change_state_event.to_dict()
    ret["emitEvent"] = null if emit_event == null else emit_event.to_dict()
    return ret