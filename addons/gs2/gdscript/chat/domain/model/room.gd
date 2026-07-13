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
class_name Gs2ChatRoomDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var room_name: Variant = null
var password: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    room_name_,
    password_
):
    _gs2 = gs2
    _client = Gs2ChatRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    room_name = room_name_
    password = password_


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


func update_from_backend(
    request: Gs2ChatUpdateRoomFromBackendRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_password(password)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ChatUpdateRoomFromBackendMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.update_room_from_backend(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_from_backend(
    request: Gs2ChatDeleteRoomFromBackendRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2ChatDeleteRoomFromBackendMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_room_from_backend(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func post(
    request: Gs2ChatPostByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_user_id(user_id)
    request = request.with_password(password)
    var async_result = await Gs2ChatPostByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.post_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ChatMessageDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.room_name),
        request.password,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func messages(
    category = null,
    time_offset_token = null
) -> Gs2ChatDescribeMessagesByUserIdIterator:
    return Gs2ChatDescribeMessagesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        room_name,
        password,
        category,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )


func latest_messages(
    category = null,
    time_offset_token = null
) -> Gs2ChatDescribeLatestMessagesByUserIdIterator:
    return Gs2ChatDescribeLatestMessagesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        room_name,
        password,
        category,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func message(
    message_name
) -> Gs2ChatMessageDomain:
    return Gs2ChatMessageDomain.new(
        _gs2,
        namespace_name,
        user_id,
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
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ChatRoomCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        null,
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
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ChatRoom",
        Gs2ChatRoomCache.cache_parent_key(
            namespace_name,
            user_id,
            null
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
            null
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