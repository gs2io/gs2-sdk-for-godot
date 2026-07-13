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
class_name Gs2ScheduleRepeatSetting
extends RefCounted


var repeat_type = null
var begin_day_of_month = null
var end_day_of_month = null
var begin_day_of_week = null
var end_day_of_week = null
var begin_hour = null
var end_hour = null
var anchor_timestamp = null
var active_days = null
var inactive_days = null


func with_repeat_type(v) -> Gs2ScheduleRepeatSetting:
    repeat_type = v
    return self


func with_begin_day_of_month(v) -> Gs2ScheduleRepeatSetting:
    begin_day_of_month = v
    return self


func with_end_day_of_month(v) -> Gs2ScheduleRepeatSetting:
    end_day_of_month = v
    return self


func with_begin_day_of_week(v) -> Gs2ScheduleRepeatSetting:
    begin_day_of_week = v
    return self


func with_end_day_of_week(v) -> Gs2ScheduleRepeatSetting:
    end_day_of_week = v
    return self


func with_begin_hour(v) -> Gs2ScheduleRepeatSetting:
    begin_hour = v
    return self


func with_end_hour(v) -> Gs2ScheduleRepeatSetting:
    end_hour = v
    return self


func with_anchor_timestamp(v) -> Gs2ScheduleRepeatSetting:
    anchor_timestamp = v
    return self


func with_active_days(v) -> Gs2ScheduleRepeatSetting:
    active_days = v
    return self


func with_inactive_days(v) -> Gs2ScheduleRepeatSetting:
    inactive_days = v
    return self


static func from_dict(data) -> Gs2ScheduleRepeatSetting:
    if data == null:
        return null
    var ret = Gs2ScheduleRepeatSetting.new()
    ret.repeat_type = null if data.get("repeatType") == null else str(data.get("repeatType"))
    ret.begin_day_of_month = null if data.get("beginDayOfMonth") == null else int(data.get("beginDayOfMonth"))
    ret.end_day_of_month = null if data.get("endDayOfMonth") == null else int(data.get("endDayOfMonth"))
    ret.begin_day_of_week = null if data.get("beginDayOfWeek") == null else str(data.get("beginDayOfWeek"))
    ret.end_day_of_week = null if data.get("endDayOfWeek") == null else str(data.get("endDayOfWeek"))
    ret.begin_hour = null if data.get("beginHour") == null else int(data.get("beginHour"))
    ret.end_hour = null if data.get("endHour") == null else int(data.get("endHour"))
    ret.anchor_timestamp = null if data.get("anchorTimestamp") == null else int(data.get("anchorTimestamp"))
    ret.active_days = null if data.get("activeDays") == null else int(data.get("activeDays"))
    ret.inactive_days = null if data.get("inactiveDays") == null else int(data.get("inactiveDays"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["repeatType"] = repeat_type
    ret["beginDayOfMonth"] = begin_day_of_month
    ret["endDayOfMonth"] = end_day_of_month
    ret["beginDayOfWeek"] = begin_day_of_week
    ret["endDayOfWeek"] = end_day_of_week
    ret["beginHour"] = begin_hour
    ret["endHour"] = end_hour
    ret["anchorTimestamp"] = anchor_timestamp
    ret["activeDays"] = active_days
    ret["inactiveDays"] = inactive_days
    return ret