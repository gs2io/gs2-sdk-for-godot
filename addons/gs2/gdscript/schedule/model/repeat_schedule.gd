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
class_name Gs2ScheduleRepeatSchedule
extends RefCounted


var repeat_count = null
var current_repeat_start_at = null
var current_repeat_end_at = null
var last_repeat_end_at = null
var next_repeat_start_at = null


func with_repeat_count(v) -> Gs2ScheduleRepeatSchedule:
    repeat_count = v
    return self


func with_current_repeat_start_at(v) -> Gs2ScheduleRepeatSchedule:
    current_repeat_start_at = v
    return self


func with_current_repeat_end_at(v) -> Gs2ScheduleRepeatSchedule:
    current_repeat_end_at = v
    return self


func with_last_repeat_end_at(v) -> Gs2ScheduleRepeatSchedule:
    last_repeat_end_at = v
    return self


func with_next_repeat_start_at(v) -> Gs2ScheduleRepeatSchedule:
    next_repeat_start_at = v
    return self


static func from_dict(data) -> Gs2ScheduleRepeatSchedule:
    if data == null:
        return null
    var ret = Gs2ScheduleRepeatSchedule.new()
    ret.repeat_count = null if data.get("repeatCount") == null else int(data.get("repeatCount"))
    ret.current_repeat_start_at = null if data.get("currentRepeatStartAt") == null else int(data.get("currentRepeatStartAt"))
    ret.current_repeat_end_at = null if data.get("currentRepeatEndAt") == null else int(data.get("currentRepeatEndAt"))
    ret.last_repeat_end_at = null if data.get("lastRepeatEndAt") == null else int(data.get("lastRepeatEndAt"))
    ret.next_repeat_start_at = null if data.get("nextRepeatStartAt") == null else int(data.get("nextRepeatStartAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["repeatCount"] = repeat_count
    ret["currentRepeatStartAt"] = current_repeat_start_at
    ret["currentRepeatEndAt"] = current_repeat_end_at
    ret["lastRepeatEndAt"] = last_repeat_end_at
    ret["nextRepeatStartAt"] = next_repeat_start_at
    return ret