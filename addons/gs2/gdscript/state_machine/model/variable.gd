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
class_name Gs2StateMachineVariable
extends RefCounted


var state_machine_name = null
var value = null


func with_state_machine_name(v) -> Gs2StateMachineVariable:
    state_machine_name = v
    return self


func with_value(v) -> Gs2StateMachineVariable:
    value = v
    return self


static func from_dict(data) -> Gs2StateMachineVariable:
    if data == null:
        return null
    var ret = Gs2StateMachineVariable.new()
    ret.state_machine_name = null if data.get("stateMachineName") == null else str(data.get("stateMachineName"))
    ret.value = null if data.get("value") == null else str(data.get("value"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stateMachineName"] = state_machine_name
    ret["value"] = value
    return ret