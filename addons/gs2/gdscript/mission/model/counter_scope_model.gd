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
class_name Gs2MissionCounterScopeModel
extends RefCounted


var scope_type = null
var reset_type = null
var reset_day_of_month = null
var reset_day_of_week = null
var reset_hour = null
var condition_name = null
var condition = null
var anchor_timestamp = null
var days = null


func with_scope_type(v) -> Gs2MissionCounterScopeModel:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionCounterScopeModel:
    reset_type = v
    return self


func with_reset_day_of_month(v) -> Gs2MissionCounterScopeModel:
    reset_day_of_month = v
    return self


func with_reset_day_of_week(v) -> Gs2MissionCounterScopeModel:
    reset_day_of_week = v
    return self


func with_reset_hour(v) -> Gs2MissionCounterScopeModel:
    reset_hour = v
    return self


func with_condition_name(v) -> Gs2MissionCounterScopeModel:
    condition_name = v
    return self


func with_condition(v) -> Gs2MissionCounterScopeModel:
    condition = v
    return self


func with_anchor_timestamp(v) -> Gs2MissionCounterScopeModel:
    anchor_timestamp = v
    return self


func with_days(v) -> Gs2MissionCounterScopeModel:
    days = v
    return self


static func from_dict(data) -> Gs2MissionCounterScopeModel:
    if data == null:
        return null
    var ret = Gs2MissionCounterScopeModel.new()
    ret.scope_type = null if data.get("scopeType") == null else str(data.get("scopeType"))
    ret.reset_type = null if data.get("resetType") == null else str(data.get("resetType"))
    ret.reset_day_of_month = null if data.get("resetDayOfMonth") == null else int(data.get("resetDayOfMonth"))
    ret.reset_day_of_week = null if data.get("resetDayOfWeek") == null else str(data.get("resetDayOfWeek"))
    ret.reset_hour = null if data.get("resetHour") == null else int(data.get("resetHour"))
    ret.condition_name = null if data.get("conditionName") == null else str(data.get("conditionName"))
    ret.condition = null if data.get("condition") == null else Gs2VerifyAction.from_dict(data.get("condition"))
    ret.anchor_timestamp = null if data.get("anchorTimestamp") == null else int(data.get("anchorTimestamp"))
    ret.days = null if data.get("days") == null else int(data.get("days"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["scopeType"] = scope_type
    ret["resetType"] = reset_type
    ret["resetDayOfMonth"] = reset_day_of_month
    ret["resetDayOfWeek"] = reset_day_of_week
    ret["resetHour"] = reset_hour
    ret["conditionName"] = condition_name
    ret["condition"] = null if condition == null else condition.to_dict()
    ret["anchorTimestamp"] = anchor_timestamp
    ret["days"] = days
    return ret