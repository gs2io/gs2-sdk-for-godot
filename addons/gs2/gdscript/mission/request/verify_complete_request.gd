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
class_name Gs2MissionVerifyCompleteRequest
extends Gs2Request


var namespace_name = null
var mission_group_name = null
var access_token = null
var verify_type = null
var mission_task_name = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MissionVerifyCompleteRequest:
    namespace_name = v
    return self


func with_mission_group_name(v) -> Gs2MissionVerifyCompleteRequest:
    mission_group_name = v
    return self


func with_access_token(v) -> Gs2MissionVerifyCompleteRequest:
    access_token = v
    return self


func with_verify_type(v) -> Gs2MissionVerifyCompleteRequest:
    verify_type = v
    return self


func with_mission_task_name(v) -> Gs2MissionVerifyCompleteRequest:
    mission_task_name = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2MissionVerifyCompleteRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2MissionVerifyCompleteRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MissionVerifyCompleteRequest:
    if data == null:
        return null
    var ret = Gs2MissionVerifyCompleteRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.mission_group_name = null if data.get("missionGroupName") == null else str(data.get("missionGroupName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.mission_task_name = null if data.get("missionTaskName") == null else str(data.get("missionTaskName"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["missionGroupName"] = mission_group_name
    ret["accessToken"] = access_token
    ret["verifyType"] = verify_type
    ret["missionTaskName"] = mission_task_name
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret