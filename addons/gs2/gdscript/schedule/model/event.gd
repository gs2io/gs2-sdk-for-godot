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
class_name Gs2ScheduleEvent
extends RefCounted


var event_id = null
var name = null
var metadata = null
var schedule_type = null
var absolute_begin = null
var absolute_end = null
var relative_trigger_name = null
var repeat_setting = null
var repeat_type = null
var repeat_begin_day_of_month = null
var repeat_end_day_of_month = null
var repeat_begin_day_of_week = null
var repeat_end_day_of_week = null
var repeat_begin_hour = null
var repeat_end_hour = null


func with_event_id(v) -> Gs2ScheduleEvent:
    event_id = v
    return self


func with_name(v) -> Gs2ScheduleEvent:
    name = v
    return self


func with_metadata(v) -> Gs2ScheduleEvent:
    metadata = v
    return self


func with_schedule_type(v) -> Gs2ScheduleEvent:
    schedule_type = v
    return self


func with_absolute_begin(v) -> Gs2ScheduleEvent:
    absolute_begin = v
    return self


func with_absolute_end(v) -> Gs2ScheduleEvent:
    absolute_end = v
    return self


func with_relative_trigger_name(v) -> Gs2ScheduleEvent:
    relative_trigger_name = v
    return self


func with_repeat_setting(v) -> Gs2ScheduleEvent:
    repeat_setting = v
    return self


func with_repeat_type(v) -> Gs2ScheduleEvent:
    repeat_type = v
    return self


func with_repeat_begin_day_of_month(v) -> Gs2ScheduleEvent:
    repeat_begin_day_of_month = v
    return self


func with_repeat_end_day_of_month(v) -> Gs2ScheduleEvent:
    repeat_end_day_of_month = v
    return self


func with_repeat_begin_day_of_week(v) -> Gs2ScheduleEvent:
    repeat_begin_day_of_week = v
    return self


func with_repeat_end_day_of_week(v) -> Gs2ScheduleEvent:
    repeat_end_day_of_week = v
    return self


func with_repeat_begin_hour(v) -> Gs2ScheduleEvent:
    repeat_begin_hour = v
    return self


func with_repeat_end_hour(v) -> Gs2ScheduleEvent:
    repeat_end_hour = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_event_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):schedule:(?<namespaceName>.+):event:(?<eventName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("eventName")


static func from_dict(data) -> Gs2ScheduleEvent:
    if data == null:
        return null
    var ret = Gs2ScheduleEvent.new()
    ret.event_id = null if data.get("eventId") == null else str(data.get("eventId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.schedule_type = null if data.get("scheduleType") == null else str(data.get("scheduleType"))
    ret.absolute_begin = null if data.get("absoluteBegin") == null else int(data.get("absoluteBegin"))
    ret.absolute_end = null if data.get("absoluteEnd") == null else int(data.get("absoluteEnd"))
    ret.relative_trigger_name = null if data.get("relativeTriggerName") == null else str(data.get("relativeTriggerName"))
    ret.repeat_setting = null if data.get("repeatSetting") == null else Gs2ScheduleRepeatSetting.from_dict(data.get("repeatSetting"))
    ret.repeat_type = null if data.get("repeatType") == null else str(data.get("repeatType"))
    ret.repeat_begin_day_of_month = null if data.get("repeatBeginDayOfMonth") == null else int(data.get("repeatBeginDayOfMonth"))
    ret.repeat_end_day_of_month = null if data.get("repeatEndDayOfMonth") == null else int(data.get("repeatEndDayOfMonth"))
    ret.repeat_begin_day_of_week = null if data.get("repeatBeginDayOfWeek") == null else str(data.get("repeatBeginDayOfWeek"))
    ret.repeat_end_day_of_week = null if data.get("repeatEndDayOfWeek") == null else str(data.get("repeatEndDayOfWeek"))
    ret.repeat_begin_hour = null if data.get("repeatBeginHour") == null else int(data.get("repeatBeginHour"))
    ret.repeat_end_hour = null if data.get("repeatEndHour") == null else int(data.get("repeatEndHour"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["eventId"] = event_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["scheduleType"] = schedule_type
    ret["absoluteBegin"] = absolute_begin
    ret["absoluteEnd"] = absolute_end
    ret["relativeTriggerName"] = relative_trigger_name
    ret["repeatSetting"] = null if repeat_setting == null else repeat_setting.to_dict()
    ret["repeatType"] = repeat_type
    ret["repeatBeginDayOfMonth"] = repeat_begin_day_of_month
    ret["repeatEndDayOfMonth"] = repeat_end_day_of_month
    ret["repeatBeginDayOfWeek"] = repeat_begin_day_of_week
    ret["repeatEndDayOfWeek"] = repeat_end_day_of_week
    ret["repeatBeginHour"] = repeat_begin_hour
    ret["repeatEndHour"] = repeat_end_hour
    return ret