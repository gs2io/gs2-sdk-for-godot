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
class_name Gs2MissionBatchCompleteRequest
extends Gs2Request


var namespace_name = null
var mission_group_name = null
var access_token = null
var mission_task_names = null
var config = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MissionBatchCompleteRequest:
    namespace_name = v
    return self


func with_mission_group_name(v) -> Gs2MissionBatchCompleteRequest:
    mission_group_name = v
    return self


func with_access_token(v) -> Gs2MissionBatchCompleteRequest:
    access_token = v
    return self


func with_mission_task_names(v) -> Gs2MissionBatchCompleteRequest:
    mission_task_names = v
    return self


func with_config(v) -> Gs2MissionBatchCompleteRequest:
    config = v
    return self


func with_duplication_avoider(v) -> Gs2MissionBatchCompleteRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MissionBatchCompleteRequest:
    if data == null:
        return null
    var ret = Gs2MissionBatchCompleteRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.mission_group_name = null if data.get("missionGroupName") == null else str(data.get("missionGroupName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.mission_task_names = null if data.get("missionTaskNames") == null else data.get("missionTaskNames").map(func(v): return str(v))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2MissionConfig.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["missionGroupName"] = mission_group_name
    ret["accessToken"] = access_token
    ret["missionTaskNames"] = mission_task_names
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    return ret