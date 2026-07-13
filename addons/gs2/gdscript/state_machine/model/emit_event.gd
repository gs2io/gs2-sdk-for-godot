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
class_name Gs2StateMachineEmitEvent
extends RefCounted


var event = null
var parameters = null
var timestamp = null


func with_event(v) -> Gs2StateMachineEmitEvent:
    event = v
    return self


func with_parameters(v) -> Gs2StateMachineEmitEvent:
    parameters = v
    return self


func with_timestamp(v) -> Gs2StateMachineEmitEvent:
    timestamp = v
    return self


static func from_dict(data) -> Gs2StateMachineEmitEvent:
    if data == null:
        return null
    var ret = Gs2StateMachineEmitEvent.new()
    ret.event = null if data.get("event") == null else str(data.get("event"))
    ret.parameters = null if data.get("parameters") == null else str(data.get("parameters"))
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["event"] = event
    ret["parameters"] = parameters
    ret["timestamp"] = timestamp
    return ret