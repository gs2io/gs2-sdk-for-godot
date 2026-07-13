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
class_name Gs2IdleUpdateCategoryModelMasterRequest
extends Gs2Request


var namespace_name = null
var category_name = null
var description = null
var metadata = null
var reward_interval_minutes = null
var default_maximum_idle_minutes = null
var reward_reset_mode = null
var acquire_actions = null
var idle_period_schedule_id = null
var receive_period_schedule_id = null


func with_namespace_name(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    namespace_name = v
    return self


func with_category_name(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    category_name = v
    return self


func with_description(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    metadata = v
    return self


func with_reward_interval_minutes(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    reward_interval_minutes = v
    return self


func with_default_maximum_idle_minutes(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    default_maximum_idle_minutes = v
    return self


func with_reward_reset_mode(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    reward_reset_mode = v
    return self


func with_acquire_actions(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    acquire_actions = v
    return self


func with_idle_period_schedule_id(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    idle_period_schedule_id = v
    return self


func with_receive_period_schedule_id(v) -> Gs2IdleUpdateCategoryModelMasterRequest:
    receive_period_schedule_id = v
    return self


static func from_dict(data) -> Gs2IdleUpdateCategoryModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2IdleUpdateCategoryModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.reward_interval_minutes = null if data.get("rewardIntervalMinutes") == null else int(data.get("rewardIntervalMinutes"))
    ret.default_maximum_idle_minutes = null if data.get("defaultMaximumIdleMinutes") == null else int(data.get("defaultMaximumIdleMinutes"))
    ret.reward_reset_mode = null if data.get("rewardResetMode") == null else str(data.get("rewardResetMode"))
    ret.acquire_actions = null if data.get("acquireActions") == null else data.get("acquireActions").map(func(v): return Gs2IdleAcquireActionList.from_dict(v))
    ret.idle_period_schedule_id = null if data.get("idlePeriodScheduleId") == null else str(data.get("idlePeriodScheduleId"))
    ret.receive_period_schedule_id = null if data.get("receivePeriodScheduleId") == null else str(data.get("receivePeriodScheduleId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["categoryName"] = category_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["rewardIntervalMinutes"] = reward_interval_minutes
    ret["defaultMaximumIdleMinutes"] = default_maximum_idle_minutes
    ret["rewardResetMode"] = reward_reset_mode
    ret["acquireActions"] = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["idlePeriodScheduleId"] = idle_period_schedule_id
    ret["receivePeriodScheduleId"] = receive_period_schedule_id
    return ret