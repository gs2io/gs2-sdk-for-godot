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
# deny overwrite
class_name Gs2ScheduleEzEventDomain
extends RefCounted


var _domain: Gs2ScheduleEventDomain
var _connection: Gs2Connection
var in_schedule: Variant:
    get:
        return _domain.in_schedule
var schedule_start_at: Variant:
    get:
        return _domain.schedule_start_at
var schedule_end_at: Variant:
    get:
        return _domain.schedule_end_at
var is_global_schedule: Variant:
    get:
        return _domain.is_global_schedule
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var event_name: Variant:
    get:
        return null if _domain == null else _domain.event_name


func _init(
    domain: Gs2ScheduleEventDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


# diff +++ start
func repeat_schedule() -> Gs2ScheduleEzRepeatScheduleDomain:
    return Gs2ScheduleEzRepeatScheduleDomain.new(
        _domain.repeat_schedule(),
        _connection
    )
# diff +++ end
