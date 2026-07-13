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
class_name Gs2IdleEzCategoryModel
extends RefCounted


var name = null
var metadata = null
var reward_interval_minutes = 0
var default_maximum_idle_minutes = 0
var acquire_actions = []
var idle_period_schedule_id = null
var receive_period_schedule_id = null


func with_name(v) -> Gs2IdleEzCategoryModel:
    name = v
    return self


func with_metadata(v) -> Gs2IdleEzCategoryModel:
    metadata = v
    return self


func with_reward_interval_minutes(v) -> Gs2IdleEzCategoryModel:
    reward_interval_minutes = v
    return self


func with_default_maximum_idle_minutes(v) -> Gs2IdleEzCategoryModel:
    default_maximum_idle_minutes = v
    return self


func with_acquire_actions(v) -> Gs2IdleEzCategoryModel:
    acquire_actions = v
    return self


func with_idle_period_schedule_id(v) -> Gs2IdleEzCategoryModel:
    idle_period_schedule_id = v
    return self


func with_receive_period_schedule_id(v) -> Gs2IdleEzCategoryModel:
    receive_period_schedule_id = v
    return self


func to_model() -> Gs2IdleCategoryModel:
    var ret = Gs2IdleCategoryModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.reward_interval_minutes = reward_interval_minutes
    ret.default_maximum_idle_minutes = default_maximum_idle_minutes
    ret.acquire_actions = null if acquire_actions == null else acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.idle_period_schedule_id = idle_period_schedule_id
    ret.receive_period_schedule_id = receive_period_schedule_id
    return ret


static func from_model(model) -> Gs2IdleEzCategoryModel:
    var ret = Gs2IdleEzCategoryModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.reward_interval_minutes = 0 if model.reward_interval_minutes == null else model.reward_interval_minutes
    ret.default_maximum_idle_minutes = 0 if model.default_maximum_idle_minutes == null else model.default_maximum_idle_minutes
    ret.acquire_actions = [] if model.acquire_actions == null else model.acquire_actions.map(func(v): return Gs2IdleEzAcquireActionList.from_model(v))
    ret.idle_period_schedule_id = model.idle_period_schedule_id
    ret.receive_period_schedule_id = model.receive_period_schedule_id
    return ret