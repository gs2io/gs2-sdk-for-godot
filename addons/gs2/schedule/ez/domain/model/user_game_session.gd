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
class_name Gs2ScheduleEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2ScheduleUserAccessTokenDomain
var _game_session: Variant
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
    domain: Gs2ScheduleUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func triggers(
) -> Gs2ScheduleEzListTriggersIterator:
    return Gs2ScheduleEzListTriggersIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_triggers(
    callback: Callable
) -> int:
    return _domain.subscribe_triggers(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ScheduleEzTrigger.from_model(v)))
    )


func unsubscribe_triggers(
    callback_id: int
) -> void:
    _domain.unsubscribe_triggers(
        callback_id
    )


func events(
) -> Gs2ScheduleEzListEventsIterator:
    return Gs2ScheduleEzListEventsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_events(
    callback: Callable
) -> int:
    return _domain.subscribe_events(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ScheduleEzEvent.from_model(v)))
    )


func unsubscribe_events(
    callback_id: int
) -> void:
    _domain.unsubscribe_events(
        callback_id
    )


func trigger(
    trigger_name
) -> Gs2ScheduleEzTriggerGameSessionDomain:
    return Gs2ScheduleEzTriggerGameSessionDomain.new(
        _domain.trigger(
            trigger_name
        ),
        _game_session,
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
) -> Gs2ScheduleEzEventGameSessionDomain:
    return Gs2ScheduleEzEventGameSessionDomain.new(
        _domain.event(
# diff --- start
#            event_name
# diff --- end
# diff +++ start
            event_name,
            is_in_schedule
# diff +++ end
        ),
        _game_session,
        _connection
    )
