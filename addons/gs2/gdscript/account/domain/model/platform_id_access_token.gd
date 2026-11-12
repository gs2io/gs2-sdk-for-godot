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
class_name Gs2AccountPlatformIdAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2AccountRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var type: Variant = null
var user_identifier: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    type_
):
    _gs2 = gs2
    _client = Gs2AccountRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    type = type_


func create(
    request: Gs2AccountCreatePlatformIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_type(type)
    var async_result = await Gs2AccountCreatePlatformIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.create_platform_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2AccountGetPlatformIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_type(type)
    var async_result = await Gs2AccountGetPlatformIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_platform_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func find(
    request: Gs2AccountFindPlatformIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_type(type)
    var async_result = await Gs2AccountFindPlatformIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.find_platform_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2AccountDeletePlatformIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_type(type)
    var async_result = await Gs2AccountDeletePlatformIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_platform_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2AccountPlatformIdCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        type,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2AccountPlatformIdCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        type,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2AccountGetPlatformIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2AccountPlatformIdCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        type,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2AccountPlatformIdCache.cache_key(
            type
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2AccountPlatformIdCache.cache_key(
            type
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