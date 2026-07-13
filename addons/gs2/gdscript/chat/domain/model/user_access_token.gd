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
class_name Gs2ChatUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2ChatRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func create_room(
    request: Gs2ChatCreateRoomRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatCreateRoomMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.create_room(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ChatRoomAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.name),
        (null if ref == null else ref.password)
    )
    return Gs2AsyncResult.new(domain, null)
func room(
    room_name,
    password = null
) -> Gs2ChatRoomAccessTokenDomain:
    return Gs2ChatRoomAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        room_name,
        password
    )


func subscribes(
    room_name_prefix = null
) -> Gs2ChatDescribeSubscribesIterator:
    return Gs2ChatDescribeSubscribesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        room_name_prefix
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func subscribe(
    room_name
) -> Gs2ChatSubscribeAccessTokenDomain:
    return Gs2ChatSubscribeAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        room_name
    )