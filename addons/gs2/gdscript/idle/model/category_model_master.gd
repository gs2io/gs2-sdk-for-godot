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
class_name Gs2IdleCategoryModelMaster
extends RefCounted


var category_model_id = null
var name = null
var description = null
var metadata = null
var reward_interval_minutes = null
var default_maximum_idle_minutes = null
var reward_reset_mode = null
var acquire_actions = null
var idle_period_schedule_id = null
var receive_period_schedule_id = null
var created_at = null
var updated_at = null
var revision = null


func with_category_model_id(v) -> Gs2IdleCategoryModelMaster:
    category_model_id = v
    return self


func with_name(v) -> Gs2IdleCategoryModelMaster:
    name = v
    return self


func with_description(v) -> Gs2IdleCategoryModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2IdleCategoryModelMaster:
    metadata = v
    return self


func with_reward_interval_minutes(v) -> Gs2IdleCategoryModelMaster:
    reward_interval_minutes = v
    return self


func with_default_maximum_idle_minutes(v) -> Gs2IdleCategoryModelMaster:
    default_maximum_idle_minutes = v
    return self


func with_reward_reset_mode(v) -> Gs2IdleCategoryModelMaster:
    reward_reset_mode = v
    return self


func with_acquire_actions(v) -> Gs2IdleCategoryModelMaster:
    acquire_actions = v
    return self


func with_idle_period_schedule_id(v) -> Gs2IdleCategoryModelMaster:
    idle_period_schedule_id = v
    return self


func with_receive_period_schedule_id(v) -> Gs2IdleCategoryModelMaster:
    receive_period_schedule_id = v
    return self


func with_created_at(v) -> Gs2IdleCategoryModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2IdleCategoryModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2IdleCategoryModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):model:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):model:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):model:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_category_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):idle:(?<namespaceName>.+):model:(?<categoryName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("categoryName")


static func from_dict(data) -> Gs2IdleCategoryModelMaster:
    if data == null:
        return null
    var ret = Gs2IdleCategoryModelMaster.new()
    ret.category_model_id = null if data.get("categoryModelId") == null else str(data.get("categoryModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.reward_interval_minutes = null if data.get("rewardIntervalMinutes") == null else int(data.get("rewardIntervalMinutes"))
    ret.default_maximum_idle_minutes = null if data.get("defaultMaximumIdleMinutes") == null else int(data.get("defaultMaximumIdleMinutes"))
    ret.reward_reset_mode = null if data.get("rewardResetMode") == null else str(data.get("rewardResetMode"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2IdleAcquireActionList.from_dict(v))
    ret.idle_period_schedule_id = null if data.get("idlePeriodScheduleId") == null else str(data.get("idlePeriodScheduleId"))
    ret.receive_period_schedule_id = null if data.get("receivePeriodScheduleId") == null else str(data.get("receivePeriodScheduleId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["categoryModelId"] = category_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["rewardIntervalMinutes"] = reward_interval_minutes
    ret["defaultMaximumIdleMinutes"] = default_maximum_idle_minutes
    ret["rewardResetMode"] = reward_reset_mode
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["idlePeriodScheduleId"] = idle_period_schedule_id
    ret["receivePeriodScheduleId"] = receive_period_schedule_id
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret