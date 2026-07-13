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
class_name Gs2ScheduleEzEvent
extends RefCounted


var name = null
var metadata = null
var schedule_type = null
var repeat_type = null
var absolute_begin = 0
var absolute_end = 0
var repeat_begin_day_of_month = 0
var repeat_end_day_of_month = 0
var repeat_begin_day_of_week = null
var repeat_end_day_of_week = null
var repeat_begin_hour = 0
var repeat_end_hour = 0
var relative_trigger_name = null


func with_name(v) -> Gs2ScheduleEzEvent:
    name = v
    return self


func with_metadata(v) -> Gs2ScheduleEzEvent:
    metadata = v
    return self


func with_schedule_type(v) -> Gs2ScheduleEzEvent:
    schedule_type = v
    return self


func with_repeat_type(v) -> Gs2ScheduleEzEvent:
    repeat_type = v
    return self


func with_absolute_begin(v) -> Gs2ScheduleEzEvent:
    absolute_begin = v
    return self


func with_absolute_end(v) -> Gs2ScheduleEzEvent:
    absolute_end = v
    return self


func with_repeat_begin_day_of_month(v) -> Gs2ScheduleEzEvent:
    repeat_begin_day_of_month = v
    return self


func with_repeat_end_day_of_month(v) -> Gs2ScheduleEzEvent:
    repeat_end_day_of_month = v
    return self


func with_repeat_begin_day_of_week(v) -> Gs2ScheduleEzEvent:
    repeat_begin_day_of_week = v
    return self


func with_repeat_end_day_of_week(v) -> Gs2ScheduleEzEvent:
    repeat_end_day_of_week = v
    return self


func with_repeat_begin_hour(v) -> Gs2ScheduleEzEvent:
    repeat_begin_hour = v
    return self


func with_repeat_end_hour(v) -> Gs2ScheduleEzEvent:
    repeat_end_hour = v
    return self


func with_relative_trigger_name(v) -> Gs2ScheduleEzEvent:
    relative_trigger_name = v
    return self


func to_model() -> Gs2ScheduleEvent:
    var ret = Gs2ScheduleEvent.new()
    ret.name = name
    ret.metadata = metadata
    ret.schedule_type = schedule_type
    ret.repeat_type = repeat_type
    ret.absolute_begin = absolute_begin
    ret.absolute_end = absolute_end
    ret.repeat_begin_day_of_month = repeat_begin_day_of_month
    ret.repeat_end_day_of_month = repeat_end_day_of_month
    ret.repeat_begin_day_of_week = repeat_begin_day_of_week
    ret.repeat_end_day_of_week = repeat_end_day_of_week
    ret.repeat_begin_hour = repeat_begin_hour
    ret.repeat_end_hour = repeat_end_hour
    ret.relative_trigger_name = relative_trigger_name
    return ret


static func from_model(model) -> Gs2ScheduleEzEvent:
    var ret = Gs2ScheduleEzEvent.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.schedule_type = model.schedule_type
    ret.repeat_type = model.repeat_type
    ret.absolute_begin = 0 if model.absolute_begin == null else model.absolute_begin
    ret.absolute_end = 0 if model.absolute_end == null else model.absolute_end
    ret.repeat_begin_day_of_month = 0 if model.repeat_begin_day_of_month == null else model.repeat_begin_day_of_month
    ret.repeat_end_day_of_month = 0 if model.repeat_end_day_of_month == null else model.repeat_end_day_of_month
    ret.repeat_begin_day_of_week = model.repeat_begin_day_of_week
    ret.repeat_end_day_of_week = model.repeat_end_day_of_week
    ret.repeat_begin_hour = 0 if model.repeat_begin_hour == null else model.repeat_begin_hour
    ret.repeat_end_hour = 0 if model.repeat_end_hour == null else model.repeat_end_hour
    ret.relative_trigger_name = model.relative_trigger_name
    return ret