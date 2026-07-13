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
class_name Gs2MissionComplete
extends RefCounted


var complete_id = null
var user_id = null
var mission_group_name = null
var completed_mission_task_names = null
var received_mission_task_names = null
var next_reset_at = null
var created_at = null
var updated_at = null
var revision = null


func with_complete_id(v) -> Gs2MissionComplete:
    complete_id = v
    return self


func with_user_id(v) -> Gs2MissionComplete:
    user_id = v
    return self


func with_mission_group_name(v) -> Gs2MissionComplete:
    mission_group_name = v
    return self


func with_completed_mission_task_names(v) -> Gs2MissionComplete:
    completed_mission_task_names = v
    return self


func with_received_mission_task_names(v) -> Gs2MissionComplete:
    received_mission_task_names = v
    return self


func with_next_reset_at(v) -> Gs2MissionComplete:
    next_reset_at = v
    return self


func with_created_at(v) -> Gs2MissionComplete:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MissionComplete:
    updated_at = v
    return self


func with_revision(v) -> Gs2MissionComplete:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):user:(?<userId>.+):group:(?<missionGroupName>.+):complete")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):user:(?<userId>.+):group:(?<missionGroupName>.+):complete")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):user:(?<userId>.+):group:(?<missionGroupName>.+):complete")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):user:(?<userId>.+):group:(?<missionGroupName>.+):complete")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_mission_group_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):mission:(?<namespaceName>.+):user:(?<userId>.+):group:(?<missionGroupName>.+):complete")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("missionGroupName")


static func from_dict(data) -> Gs2MissionComplete:
    if data == null:
        return null
    var ret = Gs2MissionComplete.new()
    ret.complete_id = null if data.get("completeId") == null else str(data.get("completeId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.mission_group_name = null if data.get("missionGroupName") == null else str(data.get("missionGroupName"))
    ret.completed_mission_task_names = null if data.get("completedMissionTaskNames") == null else data.get("completedMissionTaskNames").map(func(v): return str(v))
    ret.received_mission_task_names = null if data.get("receivedMissionTaskNames") == null else data.get("receivedMissionTaskNames").map(func(v): return str(v))
    ret.next_reset_at = null if data.get("nextResetAt") == null else int(data.get("nextResetAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["completeId"] = complete_id
    ret["userId"] = user_id
    ret["missionGroupName"] = mission_group_name
    ret["completedMissionTaskNames"] = completed_mission_task_names
    ret["receivedMissionTaskNames"] = received_mission_task_names
    ret["nextResetAt"] = next_reset_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret