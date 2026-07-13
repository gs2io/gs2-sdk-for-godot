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
class_name Gs2IdleAcquireActionList
extends RefCounted


var acquire_actions = null


func with_acquire_actions(v) -> Gs2IdleAcquireActionList:
    acquire_actions = v
    return self


static func from_dict(data) -> Gs2IdleAcquireActionList:
    if data == null:
        return null
    var ret = Gs2IdleAcquireActionList.new()
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    return ret