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
class_name Gs2ScheduleUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ScheduleRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var in_schedule: Variant = null
var schedule_start_at: Variant = null
var schedule_end_at: Variant = null
var is_global_schedule: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2ScheduleRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func triggers(
) -> Gs2ScheduleDescribeTriggersIterator:
    return Gs2ScheduleDescribeTriggersIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_triggers(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ScheduleTrigger",
        Gs2ScheduleTriggerCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_triggers(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ScheduleTrigger",
        Gs2ScheduleTriggerCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_triggers(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ScheduleTrigger",
        Gs2ScheduleTriggerCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func trigger(
    trigger_name
) -> Gs2ScheduleTriggerAccessTokenDomain:
    return Gs2ScheduleTriggerAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        trigger_name
    )


func events(
) -> Gs2ScheduleDescribeEventsIterator:
    return Gs2ScheduleDescribeEventsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_events(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ScheduleEvent",
        Gs2ScheduleEventCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_events(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ScheduleEvent",
        Gs2ScheduleEventCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_events(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ScheduleEvent",
        Gs2ScheduleEventCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func event(
# diff --- start
#    event_name
# diff --- end
# diff +++ start
    event_name,
    is_in_schedule = null
# diff +++ end
) -> Gs2ScheduleEventAccessTokenDomain:
    return Gs2ScheduleEventAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
# diff --- start
#        event_name
# diff --- end
# diff +++ start
        event_name,
        is_in_schedule
# diff +++ end
    )