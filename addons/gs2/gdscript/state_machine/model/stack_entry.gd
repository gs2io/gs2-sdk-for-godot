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
class_name Gs2StateMachineStackEntry
extends RefCounted


var state_machine_name = null
var task_name = null


func with_state_machine_name(v) -> Gs2StateMachineStackEntry:
    state_machine_name = v
    return self


func with_task_name(v) -> Gs2StateMachineStackEntry:
    task_name = v
    return self


static func from_dict(data) -> Gs2StateMachineStackEntry:
    if data == null:
        return null
    var ret = Gs2StateMachineStackEntry.new()
    ret.state_machine_name = null if data.get("stateMachineName") == null else str(data.get("stateMachineName"))
    ret.task_name = null if data.get("taskName") == null else str(data.get("taskName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["stateMachineName"] = state_machine_name
    ret["taskName"] = task_name
    return ret