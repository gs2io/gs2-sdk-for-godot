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
class_name Gs2StateMachineEzEvent
extends RefCounted


var event_type = null
var change_state_event = null
var emit_event = null


func with_event_type(v) -> Gs2StateMachineEzEvent:
    event_type = v
    return self


func with_change_state_event(v) -> Gs2StateMachineEzEvent:
    change_state_event = v
    return self


func with_emit_event(v) -> Gs2StateMachineEzEvent:
    emit_event = v
    return self


func to_model() -> Gs2StateMachineEvent:
    var ret = Gs2StateMachineEvent.new()
    ret.event_type = event_type
    ret.change_state_event = null if change_state_event == null else change_state_event.to_model()
    ret.emit_event = null if emit_event == null else emit_event.to_model()
    return ret


static func from_model(model) -> Gs2StateMachineEzEvent:
    var ret = Gs2StateMachineEzEvent.new()
    ret.event_type = model.event_type
    ret.change_state_event = null if model.change_state_event == null else Gs2StateMachineEzChangeStateEvent.from_model(model.change_state_event)
    ret.emit_event = null if model.emit_event == null else Gs2StateMachineEzEmitEvent.from_model(model.emit_event)
    return ret