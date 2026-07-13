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
class_name Gs2QuestEndRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var rewards = null
var is_complete = null
var config = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2QuestEndRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2QuestEndRequest:
    access_token = v
    return self


func with_rewards(v) -> Gs2QuestEndRequest:
    rewards = v
    return self


func with_is_complete(v) -> Gs2QuestEndRequest:
    is_complete = v
    return self


func with_config(v) -> Gs2QuestEndRequest:
    config = v
    return self


func with_duplication_avoider(v) -> Gs2QuestEndRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2QuestEndRequest:
    if data == null:
        return null
    var ret = Gs2QuestEndRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.rewards = null if data.get("rewards") == null else data.get("rewards").map(func(v): return Gs2QuestReward.from_dict(v))
    ret.is_complete = null if data.get("isComplete") == null else bool(data.get("isComplete"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2QuestConfig.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["rewards"] = null if rewards == null else rewards.map(func(v): return null if v == null else v.to_dict())
    ret["isComplete"] = is_complete
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    return ret