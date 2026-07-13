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
class_name Gs2MissionUpdateMissionTaskModelMasterRequest
extends Gs2Request


var namespace_name = null
var mission_group_name = null
var mission_task_name = null
var metadata = null
var description = null
var verify_complete_type = null
var target_counter = null
var verify_complete_consume_actions = null
var complete_acquire_actions = null
var challenge_period_event_id = null
var premise_mission_task_name = null
var counter_name = null
var target_reset_type = null
var target_value = null


func with_namespace_name(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    namespace_name = v
    return self


func with_mission_group_name(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    mission_group_name = v
    return self


func with_mission_task_name(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    mission_task_name = v
    return self


func with_metadata(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    metadata = v
    return self


func with_description(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    description = v
    return self


func with_verify_complete_type(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    verify_complete_type = v
    return self


func with_target_counter(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    target_counter = v
    return self


func with_verify_complete_consume_actions(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    verify_complete_consume_actions = v
    return self


func with_complete_acquire_actions(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    complete_acquire_actions = v
    return self


func with_challenge_period_event_id(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    challenge_period_event_id = v
    return self


func with_premise_mission_task_name(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    premise_mission_task_name = v
    return self


func with_counter_name(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    counter_name = v
    return self


func with_target_reset_type(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    target_reset_type = v
    return self


func with_target_value(v) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    target_value = v
    return self


static func from_dict(data) -> Gs2MissionUpdateMissionTaskModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2MissionUpdateMissionTaskModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.mission_group_name = null if data.get("missionGroupName") == null else str(data.get("missionGroupName"))
    ret.mission_task_name = null if data.get("missionTaskName") == null else str(data.get("missionTaskName"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.verify_complete_type = null if data.get("verifyCompleteType") == null else str(data.get("verifyCompleteType"))
    ret.target_counter = null if data.get("targetCounter") == null else Gs2MissionTargetCounterModel.from_dict(data.get("targetCounter"))
    ret.verify_complete_consume_actions = null if data.get("verifyCompleteConsumeActions") == null else data.get("verifyCompleteConsumeActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.complete_acquire_actions = null if data.get("completeAcquireActions") == null else data.get("completeAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.challenge_period_event_id = null if data.get("challengePeriodEventId") == null else str(data.get("challengePeriodEventId"))
    ret.premise_mission_task_name = null if data.get("premiseMissionTaskName") == null else str(data.get("premiseMissionTaskName"))
    ret.counter_name = null if data.get("counterName") == null else str(data.get("counterName"))
    ret.target_reset_type = null if data.get("targetResetType") == null else str(data.get("targetResetType"))
    ret.target_value = null if data.get("targetValue") == null else int(data.get("targetValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["missionGroupName"] = mission_group_name
    ret["missionTaskName"] = mission_task_name
    ret["metadata"] = metadata
    ret["description"] = description
    ret["verifyCompleteType"] = verify_complete_type
    ret["targetCounter"] = null if target_counter == null else target_counter.to_dict()
    ret["verifyCompleteConsumeActions"] = null if verify_complete_consume_actions == null else verify_complete_consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["completeAcquireActions"] = null if complete_acquire_actions == null else complete_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["challengePeriodEventId"] = challenge_period_event_id
    ret["premiseMissionTaskName"] = premise_mission_task_name
    ret["counterName"] = counter_name
    ret["targetResetType"] = target_reset_type
    ret["targetValue"] = target_value
    return ret