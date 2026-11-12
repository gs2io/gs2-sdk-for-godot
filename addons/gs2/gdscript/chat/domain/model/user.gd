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
class_name Gs2ChatUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2ChatRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func rooms(
    name_prefix = null
) -> Gs2ChatDescribeRoomsIterator:
    return Gs2ChatDescribeRoomsIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_rooms(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ChatRoom",
        Gs2ChatRoomCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_rooms(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ChatRoom",
        Gs2ChatRoomCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_rooms(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ChatRoom",
        Gs2ChatRoomCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func room(
    room_name,
    password = null
) -> Gs2ChatRoomDomain:
    return Gs2ChatRoomDomain.new(
        _gs2,
        namespace_name,
        user_id,
        room_name,
        password
    )


func subscribes(
    room_name_prefix = null,
    time_offset_token = null
) -> Gs2ChatDescribeSubscribesByUserIdIterator:
    return Gs2ChatDescribeSubscribesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        room_name_prefix,
        time_offset_token
    )


func subscribe_subscribes(
    callback: Callable,
    room_name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_subscribes(
    callback_id: int,
    room_name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_subscribes(
    room_name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )


func subscribes_by_room_name(
    room_name
) -> Gs2ChatDescribeSubscribesByRoomNameIterator:
    return Gs2ChatDescribeSubscribesByRoomNameIterator.new(
        _gs2,
        _client,
        namespace_name,
        room_name
    )


func subscribe_subscribes_by_room_name(
    callback: Callable,
    room_name
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_subscribes_by_room_name(
    callback_id: int,
    room_name
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_subscribes_by_room_name(
    room_name
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func subscribe(
    room_name
) -> Gs2ChatSubscribeDomain:
    return Gs2ChatSubscribeDomain.new(
        _gs2,
        namespace_name,
        user_id,
        room_name
    )