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
class_name Gs2MissionUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2MissionRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var changed_completes: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2MissionRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func completes(
    time_offset_token = null
) -> Gs2MissionDescribeCompletesByUserIdIterator:
    return Gs2MissionDescribeCompletesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_completes(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionComplete",
        Gs2MissionCompleteCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_completes(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionComplete",
        Gs2MissionCompleteCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_completes(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionComplete",
        Gs2MissionCompleteCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func complete(
    mission_group_name
) -> Gs2MissionCompleteDomain:
    return Gs2MissionCompleteDomain.new(
        _gs2,
        namespace_name,
        user_id,
        mission_group_name
    )


func counters(
    time_offset_token = null
) -> Gs2MissionDescribeCountersByUserIdIterator:
    return Gs2MissionDescribeCountersByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_counters(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionCounter",
        Gs2MissionCounterCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_counters(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionCounter",
        Gs2MissionCounterCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_counters(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionCounter",
        Gs2MissionCounterCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func counter(
    counter_name
) -> Gs2MissionCounterDomain:
    return Gs2MissionCounterDomain.new(
        _gs2,
        namespace_name,
        user_id,
        counter_name
    )