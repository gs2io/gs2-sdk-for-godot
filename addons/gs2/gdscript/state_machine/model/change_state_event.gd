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
class_name Gs2StateMachineChangeStateEvent
extends RefCounted


var task_name = null
var hash = null
var timestamp = null


func with_task_name(v) -> Gs2StateMachineChangeStateEvent:
    task_name = v
    return self


func with_hash(v) -> Gs2StateMachineChangeStateEvent:
    hash = v
    return self


func with_timestamp(v) -> Gs2StateMachineChangeStateEvent:
    timestamp = v
    return self


static func from_dict(data) -> Gs2StateMachineChangeStateEvent:
    if data == null:
        return null
    var ret = Gs2StateMachineChangeStateEvent.new()
    ret.task_name = null if data.get("taskName") == null else str(data.get("taskName"))
    ret.hash = null if data.get("hash") == null else str(data.get("hash"))
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["taskName"] = task_name
    ret["hash"] = hash
    ret["timestamp"] = timestamp
    return ret