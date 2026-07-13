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
class_name Gs2ScheduleEzGetEventResult
extends RefCounted


var item = null
var in_schedule = false
var schedule_start_at = 0
var schedule_end_at = 0
var repeat_schedule = null
var is_global_schedule = false


static func from_model(model) -> Gs2ScheduleEzGetEventResult:
    var ret = Gs2ScheduleEzGetEventResult.new()
    ret.item = null if model.item == null else Gs2ScheduleEzEvent.from_model(model.item)
    ret.in_schedule = false if model.in_schedule == null else model.in_schedule
    ret.schedule_start_at = 0 if model.schedule_start_at == null else model.schedule_start_at
    ret.schedule_end_at = 0 if model.schedule_end_at == null else model.schedule_end_at
    ret.repeat_schedule = null if model.repeat_schedule == null else Gs2ScheduleEzRepeatSchedule.from_model(model.repeat_schedule)
    ret.is_global_schedule = false if model.is_global_schedule == null else model.is_global_schedule
    return ret