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
class_name Gs2ScheduleVerifyEventResult
extends RefCounted


var item = null
var in_schedule = null
var schedule_start_at = null
var schedule_end_at = null
var repeat_schedule = null
var is_global_schedule = null
var metadata = null


func with_item(v) -> Gs2ScheduleVerifyEventResult:
    item = v
    return self


func with_in_schedule(v) -> Gs2ScheduleVerifyEventResult:
    in_schedule = v
    return self


func with_schedule_start_at(v) -> Gs2ScheduleVerifyEventResult:
    schedule_start_at = v
    return self


func with_schedule_end_at(v) -> Gs2ScheduleVerifyEventResult:
    schedule_end_at = v
    return self


func with_repeat_schedule(v) -> Gs2ScheduleVerifyEventResult:
    repeat_schedule = v
    return self


func with_is_global_schedule(v) -> Gs2ScheduleVerifyEventResult:
    is_global_schedule = v
    return self


func with_metadata(v) -> Gs2ScheduleVerifyEventResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2ScheduleVerifyEventResult:
    if data == null:
        return null
    var ret = Gs2ScheduleVerifyEventResult.new()
    ret.item = null if data.get("item") == null else Gs2ScheduleEvent.from_dict(data.get("item"))
    ret.in_schedule = null if data.get("inSchedule") == null else bool(data.get("inSchedule"))
    ret.schedule_start_at = null if data.get("scheduleStartAt") == null else int(data.get("scheduleStartAt"))
    ret.schedule_end_at = null if data.get("scheduleEndAt") == null else int(data.get("scheduleEndAt"))
    ret.repeat_schedule = null if data.get("repeatSchedule") == null else Gs2ScheduleRepeatSchedule.from_dict(data.get("repeatSchedule"))
    ret.is_global_schedule = null if data.get("isGlobalSchedule") == null else bool(data.get("isGlobalSchedule"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["inSchedule"] = in_schedule
    ret["scheduleStartAt"] = schedule_start_at
    ret["scheduleEndAt"] = schedule_end_at
    ret["repeatSchedule"] = null if repeat_schedule == null else repeat_schedule.to_dict()
    ret["isGlobalSchedule"] = is_global_schedule
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret