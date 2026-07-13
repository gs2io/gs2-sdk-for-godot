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
class_name Gs2MissionEzCounterScopeModel
extends RefCounted


var scope_type = null
var reset_type = null
var reset_day_of_month = 0
var reset_day_of_week = null
var reset_hour = 0
var condition_name = null
var condition = null
var anchor_timestamp = 0
var days = 0


func with_scope_type(v) -> Gs2MissionEzCounterScopeModel:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionEzCounterScopeModel:
    reset_type = v
    return self


func with_reset_day_of_month(v) -> Gs2MissionEzCounterScopeModel:
    reset_day_of_month = v
    return self


func with_reset_day_of_week(v) -> Gs2MissionEzCounterScopeModel:
    reset_day_of_week = v
    return self


func with_reset_hour(v) -> Gs2MissionEzCounterScopeModel:
    reset_hour = v
    return self


func with_condition_name(v) -> Gs2MissionEzCounterScopeModel:
    condition_name = v
    return self


func with_condition(v) -> Gs2MissionEzCounterScopeModel:
    condition = v
    return self


func with_anchor_timestamp(v) -> Gs2MissionEzCounterScopeModel:
    anchor_timestamp = v
    return self


func with_days(v) -> Gs2MissionEzCounterScopeModel:
    days = v
    return self


func to_model() -> Gs2MissionCounterScopeModel:
    var ret = Gs2MissionCounterScopeModel.new()
    ret.scope_type = scope_type
    ret.reset_type = reset_type
    ret.reset_day_of_month = reset_day_of_month
    ret.reset_day_of_week = reset_day_of_week
    ret.reset_hour = reset_hour
    ret.condition_name = condition_name
    ret.condition = null if condition == null else condition.to_model()
    ret.anchor_timestamp = anchor_timestamp
    ret.days = days
    return ret


static func from_model(model) -> Gs2MissionEzCounterScopeModel:
    var ret = Gs2MissionEzCounterScopeModel.new()
    ret.scope_type = model.scope_type
    ret.reset_type = model.reset_type
    ret.reset_day_of_month = 0 if model.reset_day_of_month == null else model.reset_day_of_month
    ret.reset_day_of_week = model.reset_day_of_week
    ret.reset_hour = 0 if model.reset_hour == null else model.reset_hour
    ret.condition_name = model.condition_name
    ret.condition = null if model.condition == null else Gs2EzVerifyAction.from_model(model.condition)
    ret.anchor_timestamp = 0 if model.anchor_timestamp == null else model.anchor_timestamp
    ret.days = 0 if model.days == null else model.days
    return ret