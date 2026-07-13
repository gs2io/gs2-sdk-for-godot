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
class_name Gs2QuestStartRequest
extends Gs2Request


var namespace_name = null
var quest_group_name = null
var quest_name = null
var access_token = null
var force = null
var config = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2QuestStartRequest:
    namespace_name = v
    return self


func with_quest_group_name(v) -> Gs2QuestStartRequest:
    quest_group_name = v
    return self


func with_quest_name(v) -> Gs2QuestStartRequest:
    quest_name = v
    return self


func with_access_token(v) -> Gs2QuestStartRequest:
    access_token = v
    return self


func with_force(v) -> Gs2QuestStartRequest:
    force = v
    return self


func with_config(v) -> Gs2QuestStartRequest:
    config = v
    return self


func with_duplication_avoider(v) -> Gs2QuestStartRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2QuestStartRequest:
    if data == null:
        return null
    var ret = Gs2QuestStartRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.quest_group_name = null if data.get("questGroupName") == null else str(data.get("questGroupName"))
    ret.quest_name = null if data.get("questName") == null else str(data.get("questName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.force = null if data.get("force") == null else bool(data.get("force"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2QuestConfig.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["questGroupName"] = quest_group_name
    ret["questName"] = quest_name
    ret["accessToken"] = access_token
    ret["force"] = force
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    return ret