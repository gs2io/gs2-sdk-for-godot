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
class_name Gs2ChatSubscribeAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ChatRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var room_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    room_name_
):
    _gs2 = gs2
    _client = Gs2ChatRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    room_name = room_name_


func subscribe(
    request: Gs2ChatSubscribeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatSubscribeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.subscribe(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2ChatGetSubscribeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatGetSubscribeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_subscribe(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update_notification_type(
    request: Gs2ChatUpdateNotificationTypeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatUpdateNotificationTypeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.update_notification_type(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func unsubscribe(
    request: Gs2ChatUnsubscribeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_room_name(room_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2ChatUnsubscribeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.unsubscribe(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2ChatSubscribeCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ChatSubscribeCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2ChatGetSubscribeRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ChatSubscribeCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        room_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2ChatSubscribeCache.cache_key(
            room_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ChatSubscribe",
        Gs2ChatSubscribeCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2ChatSubscribeCache.cache_key(
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