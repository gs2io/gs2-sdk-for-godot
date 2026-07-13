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
class_name Gs2MissionMissionTaskModel
extends RefCounted


var mission_task_id = null
var name = null
var metadata = null
var verify_complete_type = null
var target_counter = null
var verify_complete_consume_actions = null
var complete_acquire_actions = null
var challenge_period_event_id = null
var premise_mission_task_name = null
var counter_name = null
var target_reset_type = null
var target_value = null


func with_mission_task_id(v) -> Gs2MissionMissionTaskModel:
    mission_task_id = v
    return self


func with_name(v) -> Gs2MissionMissionTaskModel:
    name = v
    return self


func with_metadata(v) -> Gs2MissionMissionTaskModel:
    metadata = v
    return self


func with_verify_complete_type(v) -> Gs2MissionMissionTaskModel:
    verify_complete_type = v
    return self


func with_target_counter(v) -> Gs2MissionMissionTaskModel:
    target_counter = v
    return self


func with_verify_complete_consume_actions(v) -> Gs2MissionMissionTaskModel:
    verify_complete_consume_actions = v
    return self


func with_complete_acquire_actions(v) -> Gs2MissionMissionTaskModel:
    complete_acquire_actions = v
    return self


func with_challenge_period_event_id(v) -> Gs2MissionMissionTaskModel:
    challenge_period_event_id = v
    return self


func with_premise_mission_task_name(v) -> Gs2MissionMissionTaskModel:
    premise_mission_task_name = v
    return self


func with_counter_name(v) -> Gs2MissionMissionTaskModel:
    counter_name = v
    return self


func with_target_reset_type(v) -> Gs2MissionMissionTaskModel:
    target_reset_type = v
    return self


func with_target_value(v) -> Gs2MissionMissionTaskModel:
    target_value = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):group:(?<missionGroupName>.+):missionTaskModel:(?<missionTaskName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):group:(?<missionGroupName>.+):missionTaskModel:(?<missionTaskName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):group:(?<missionGroupName>.+):missionTaskModel:(?<missionTaskName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_mission_group_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):group:(?<missionGroupName>.+):missionTaskModel:(?<missionTaskName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("missionGroupName")


static func get_mission_task_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):group:(?<missionGroupName>.+):missionTaskModel:(?<missionTaskName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("missionTaskName")


static func from_dict(data) -> Gs2MissionMissionTaskModel:
    if data == null:
        return null
    var ret = Gs2MissionMissionTaskModel.new()
    ret.mission_task_id = null if data.get("missionTaskId") == null else str(data.get("missionTaskId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
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
    ret["missionTaskId"] = mission_task_id
    ret["name"] = name
    ret["metadata"] = metadata
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