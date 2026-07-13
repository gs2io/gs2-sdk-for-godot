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
class_name Gs2QuestContents
extends RefCounted


var metadata = null
var complete_acquire_actions = null
var weight = null


func with_metadata(v) -> Gs2QuestContents:
    metadata = v
    return self


func with_complete_acquire_actions(v) -> Gs2QuestContents:
    complete_acquire_actions = v
    return self


func with_weight(v) -> Gs2QuestContents:
    weight = v
    return self


static func from_dict(data) -> Gs2QuestContents:
    if data == null:
        return null
    var ret = Gs2QuestContents.new()
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.complete_acquire_actions = null if data.get("completeAcquireActions") == null else data.get("completeAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.weight = null if data.get("weight") == null else int(data.get("weight"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["metadata"] = metadata
    ret["completeAcquireActions"] = null if complete_acquire_actions == null else complete_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["weight"] = weight
    return ret