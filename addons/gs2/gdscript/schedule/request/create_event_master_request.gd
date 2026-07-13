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
class_name Gs2ScheduleCreateEventMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var schedule_type = null
var absolute_begin = null
var absolute_end = null
var repeat_type = null
var repeat_begin_day_of_month = null
var repeat_end_day_of_month = null
var repeat_begin_day_of_week = null
var repeat_end_day_of_week = null
var repeat_begin_hour = null
var repeat_end_hour = null
var relative_trigger_name = null
var repeat_setting = null


func with_namespace_name(v) -> Gs2ScheduleCreateEventMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2ScheduleCreateEventMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2ScheduleCreateEventMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2ScheduleCreateEventMasterRequest:
    metadata = v
    return self


func with_schedule_type(v) -> Gs2ScheduleCreateEventMasterRequest:
    schedule_type = v
    return self


func with_absolute_begin(v) -> Gs2ScheduleCreateEventMasterRequest:
    absolute_begin = v
    return self


func with_absolute_end(v) -> Gs2ScheduleCreateEventMasterRequest:
    absolute_end = v
    return self


func with_repeat_type(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_type = v
    return self


func with_repeat_begin_day_of_month(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_begin_day_of_month = v
    return self


func with_repeat_end_day_of_month(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_end_day_of_month = v
    return self


func with_repeat_begin_day_of_week(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_begin_day_of_week = v
    return self


func with_repeat_end_day_of_week(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_end_day_of_week = v
    return self


func with_repeat_begin_hour(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_begin_hour = v
    return self


func with_repeat_end_hour(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_end_hour = v
    return self


func with_relative_trigger_name(v) -> Gs2ScheduleCreateEventMasterRequest:
    relative_trigger_name = v
    return self


func with_repeat_setting(v) -> Gs2ScheduleCreateEventMasterRequest:
    repeat_setting = v
    return self


static func from_dict(data) -> Gs2ScheduleCreateEventMasterRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleCreateEventMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.schedule_type = null if data.get("scheduleType") == null else str(data.get("scheduleType"))
    ret.absolute_begin = null if data.get("absoluteBegin") == null else int(data.get("absoluteBegin"))
    ret.absolute_end = null if data.get("absoluteEnd") == null else int(data.get("absoluteEnd"))
    ret.repeat_type = null if data.get("repeatType") == null else str(data.get("repeatType"))
    ret.repeat_begin_day_of_month = null if data.get("repeatBeginDayOfMonth") == null else int(data.get("repeatBeginDayOfMonth"))
    ret.repeat_end_day_of_month = null if data.get("repeatEndDayOfMonth") == null else int(data.get("repeatEndDayOfMonth"))
    ret.repeat_begin_day_of_week = null if data.get("repeatBeginDayOfWeek") == null else str(data.get("repeatBeginDayOfWeek"))
    ret.repeat_end_day_of_week = null if data.get("repeatEndDayOfWeek") == null else str(data.get("repeatEndDayOfWeek"))
    ret.repeat_begin_hour = null if data.get("repeatBeginHour") == null else int(data.get("repeatBeginHour"))
    ret.repeat_end_hour = null if data.get("repeatEndHour") == null else int(data.get("repeatEndHour"))
    ret.relative_trigger_name = null if data.get("relativeTriggerName") == null else str(data.get("relativeTriggerName"))
    ret.repeat_setting = null if data.get("repeatSetting") == null else Gs2ScheduleRepeatSetting.from_dict(data.get("repeatSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["scheduleType"] = schedule_type
    ret["absoluteBegin"] = absolute_begin
    ret["absoluteEnd"] = absolute_end
    ret["repeatType"] = repeat_type
    ret["repeatBeginDayOfMonth"] = repeat_begin_day_of_month
    ret["repeatEndDayOfMonth"] = repeat_end_day_of_month
    ret["repeatBeginDayOfWeek"] = repeat_begin_day_of_week
    ret["repeatEndDayOfWeek"] = repeat_end_day_of_week
    ret["repeatBeginHour"] = repeat_begin_hour
    ret["repeatEndHour"] = repeat_end_hour
    ret["relativeTriggerName"] = relative_trigger_name
    ret["repeatSetting"] = null if repeat_setting == null else repeat_setting.to_dict()
    return ret