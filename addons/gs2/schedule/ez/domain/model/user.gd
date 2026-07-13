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
class_name Gs2ScheduleEzUserDomain
extends RefCounted


var _domain: Gs2ScheduleUserDomain
var _connection: Gs2Connection
# diff --- start
#var in_schedule:
#    get:
#        return _domain.in_schedule
#var schedule_start_at:
#    get:
#        return _domain.schedule_start_at
#var schedule_end_at:
#    get:
#        return _domain.schedule_end_at
#var is_global_schedule:
#    get:
#        return _domain.is_global_schedule
# diff --- end
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2ScheduleUserDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func trigger(
    trigger_name
) -> Gs2ScheduleEzTriggerDomain:
    return Gs2ScheduleEzTriggerDomain.new(
        _domain.trigger(
            trigger_name
        ),
        _connection
    )


func event(
# diff --- start
#    event_name
# diff --- end
# diff +++ start
    event_name,
    is_in_schedule = true
# diff +++ end
) -> Gs2ScheduleEzEventDomain:
    return Gs2ScheduleEzEventDomain.new(
        _domain.event(
# diff --- start
#            event_name
# diff --- end
# diff +++ start
            event_name,
            is_in_schedule
# diff +++ end
        ),
        _connection
    )
