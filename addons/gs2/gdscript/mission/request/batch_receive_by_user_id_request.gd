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
class_name Gs2MissionBatchReceiveByUserIdRequest
extends Gs2Request


var namespace_name = null
var mission_group_name = null
var user_id = null
var mission_task_names = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MissionBatchReceiveByUserIdRequest:
    namespace_name = v
    return self


func with_mission_group_name(v) -> Gs2MissionBatchReceiveByUserIdRequest:
    mission_group_name = v
    return self


func with_user_id(v) -> Gs2MissionBatchReceiveByUserIdRequest:
    user_id = v
    return self


func with_mission_task_names(v) -> Gs2MissionBatchReceiveByUserIdRequest:
    mission_task_names = v
    return self


func with_time_offset_token(v) -> Gs2MissionBatchReceiveByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2MissionBatchReceiveByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MissionBatchReceiveByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MissionBatchReceiveByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.mission_group_name = null if data.get("missionGroupName") == null else str(data.get("missionGroupName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.mission_task_names = null if data.get("missionTaskNames") == null else data.get("missionTaskNames").map(func(v): return str(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["missionGroupName"] = mission_group_name
    ret["userId"] = user_id
    ret["missionTaskNames"] = mission_task_names
    ret["timeOffsetToken"] = time_offset_token
    return ret