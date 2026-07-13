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
class_name Gs2MissionReceiveByUserIdRequest
extends Gs2Request


var namespace_name = null
var mission_group_name = null
var mission_task_name = null
var user_id = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MissionReceiveByUserIdRequest:
    namespace_name = v
    return self


func with_mission_group_name(v) -> Gs2MissionReceiveByUserIdRequest:
    mission_group_name = v
    return self


func with_mission_task_name(v) -> Gs2MissionReceiveByUserIdRequest:
    mission_task_name = v
    return self


func with_user_id(v) -> Gs2MissionReceiveByUserIdRequest:
    user_id = v
    return self


func with_time_offset_token(v) -> Gs2MissionReceiveByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2MissionReceiveByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MissionReceiveByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MissionReceiveByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.mission_group_name = null if data.get("missionGroupName") == null else str(data.get("missionGroupName"))
    ret.mission_task_name = null if data.get("missionTaskName") == null else str(data.get("missionTaskName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["missionGroupName"] = mission_group_name
    ret["missionTaskName"] = mission_task_name
    ret["userId"] = user_id
    ret["timeOffsetToken"] = time_offset_token
    return ret