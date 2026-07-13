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
class_name Gs2StateMachineEzEmitEvent
extends RefCounted


var event = null
var parameters = null
var timestamp = 0


func with_event(v) -> Gs2StateMachineEzEmitEvent:
    event = v
    return self


func with_parameters(v) -> Gs2StateMachineEzEmitEvent:
    parameters = v
    return self


func with_timestamp(v) -> Gs2StateMachineEzEmitEvent:
    timestamp = v
    return self


func to_model() -> Gs2StateMachineEmitEvent:
    var ret = Gs2StateMachineEmitEvent.new()
    ret.event = event
    ret.parameters = parameters
    ret.timestamp = timestamp
    return ret


static func from_model(model) -> Gs2StateMachineEzEmitEvent:
    var ret = Gs2StateMachineEzEmitEvent.new()
    ret.event = model.event
    ret.parameters = model.parameters
    ret.timestamp = 0 if model.timestamp == null else model.timestamp
    return ret