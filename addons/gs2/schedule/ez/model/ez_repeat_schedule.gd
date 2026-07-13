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
class_name Gs2ScheduleEzRepeatSchedule
extends RefCounted


var repeat_count = 0
var current_repeat_start_at = 0
var current_repeat_end_at = 0
var last_repeat_end_at = 0
var next_repeat_start_at = 0


func with_repeat_count(v) -> Gs2ScheduleEzRepeatSchedule:
    repeat_count = v
    return self


func with_current_repeat_start_at(v) -> Gs2ScheduleEzRepeatSchedule:
    current_repeat_start_at = v
    return self


func with_current_repeat_end_at(v) -> Gs2ScheduleEzRepeatSchedule:
    current_repeat_end_at = v
    return self


func with_last_repeat_end_at(v) -> Gs2ScheduleEzRepeatSchedule:
    last_repeat_end_at = v
    return self


func with_next_repeat_start_at(v) -> Gs2ScheduleEzRepeatSchedule:
    next_repeat_start_at = v
    return self


func to_model() -> Gs2ScheduleRepeatSchedule:
    var ret = Gs2ScheduleRepeatSchedule.new()
    ret.repeat_count = repeat_count
    ret.current_repeat_start_at = current_repeat_start_at
    ret.current_repeat_end_at = current_repeat_end_at
    ret.last_repeat_end_at = last_repeat_end_at
    ret.next_repeat_start_at = next_repeat_start_at
    return ret


static func from_model(model) -> Gs2ScheduleEzRepeatSchedule:
    var ret = Gs2ScheduleEzRepeatSchedule.new()
    ret.repeat_count = 0 if model.repeat_count == null else model.repeat_count
    ret.current_repeat_start_at = 0 if model.current_repeat_start_at == null else model.current_repeat_start_at
    ret.current_repeat_end_at = 0 if model.current_repeat_end_at == null else model.current_repeat_end_at
    ret.last_repeat_end_at = 0 if model.last_repeat_end_at == null else model.last_repeat_end_at
    ret.next_repeat_start_at = 0 if model.next_repeat_start_at == null else model.next_repeat_start_at
    return ret