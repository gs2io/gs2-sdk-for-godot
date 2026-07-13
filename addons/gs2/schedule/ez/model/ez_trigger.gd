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
class_name Gs2ScheduleEzTrigger
extends RefCounted


var trigger_id = null
var name = null
var created_at = 0
var expires_at = 0


func with_trigger_id(v) -> Gs2ScheduleEzTrigger:
    trigger_id = v
    return self


func with_name(v) -> Gs2ScheduleEzTrigger:
    name = v
    return self


func with_created_at(v) -> Gs2ScheduleEzTrigger:
    created_at = v
    return self


func with_expires_at(v) -> Gs2ScheduleEzTrigger:
    expires_at = v
    return self


func to_model() -> Gs2ScheduleTrigger:
    var ret = Gs2ScheduleTrigger.new()
    ret.trigger_id = trigger_id
    ret.name = name
    ret.created_at = created_at
    ret.expires_at = expires_at
    return ret


static func from_model(model) -> Gs2ScheduleEzTrigger:
    var ret = Gs2ScheduleEzTrigger.new()
    ret.trigger_id = model.trigger_id
    ret.name = model.name
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    return ret