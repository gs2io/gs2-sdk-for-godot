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
class_name Gs2ChatRoomAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var room_name: Variant = null
var password: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    room_name_,
    password_
):
    _gs2 = gs2
    _client = Gs2ChatRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    room_name = room_name_
    password = password_


func update(
    request: Gs2ChatUpdateRoomRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_password(password)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatUpdateRoomMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.update_room(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2ChatDeleteRoomRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatDeleteRoomMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_room(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func post(
    request: Gs2ChatPostRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_password(password)
    var async_result = await Gs2ChatPostMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.post(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ChatMessageAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.room_name),
        request.password,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2ChatGetRoomRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    var async_result = await Gs2ChatGetRoomMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_room(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func messages(
    category = null
) -> Gs2ChatDescribeMessagesIterator:
    return Gs2ChatDescribeMessagesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        room_name,
        password,
        category
    )


func subscribe_messages(
    callback: Callable,
    category = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ChatMessage",
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_messages(
    callback_id: int,
    category = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ChatMessage",
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_messages(
    category = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ChatMessage",
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null if access_token == null else access_token.time_offset
        )
    )


func latest_messages(
    category = null
) -> Gs2ChatDescribeLatestMessagesIterator:
    return Gs2ChatDescribeLatestMessagesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        room_name,
        password,
        category
    )


func subscribe_latest_messages(
    callback: Callable,
    category = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ChatMessage",
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_latest_messages(
    callback_id: int,
    category = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ChatMessage",
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_latest_messages(
    category = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ChatMessage",
        Gs2ChatMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            room_name,
            null if access_token == null else access_token.time_offset
        )
    )
func message(
    message_name
) -> Gs2ChatMessageAccessTokenDomain:
    return Gs2ChatMessageAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        room_name,
        password,
        message_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2ChatRoomCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ChatRoomCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2ChatGetRoomRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ChatRoomCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ChatRoom",
        Gs2ChatRoomCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2ChatRoomCache.cache_key(
            room_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ChatRoom",
        Gs2ChatRoomCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2ChatRoomCache.cache_key(
            room_name
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)