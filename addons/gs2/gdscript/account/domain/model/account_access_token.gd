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
class_name Gs2AccountAccountAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2AccountRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var ban_statuses: Variant = null
var body: Variant = null
var signature: Variant = null
var authorization_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2AccountRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func delete_take_over(
    request: Gs2AccountDeleteTakeOverRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2AccountDeleteTakeOverMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_take_over(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2AccountTakeOverAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.type)
    )
    return Gs2AsyncResult.new(domain, null)


func take_overs(
) -> Gs2AccountDescribeTakeOversIterator:
    return Gs2AccountDescribeTakeOversIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_take_overs(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountTakeOver",
        Gs2AccountTakeOverCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_take_overs(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountTakeOver",
        Gs2AccountTakeOverCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_take_overs(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountTakeOver",
        Gs2AccountTakeOverCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func take_over(
    type
) -> Gs2AccountTakeOverAccessTokenDomain:
    return Gs2AccountTakeOverAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        type
    )
func data_owner(
) -> Gs2AccountDataOwnerAccessTokenDomain:
    return Gs2AccountDataOwnerAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )


func platform_ids(
) -> Gs2AccountDescribePlatformIdsIterator:
    return Gs2AccountDescribePlatformIdsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_platform_ids(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_platform_ids(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_platform_ids(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2AccountPlatformId",
        Gs2AccountPlatformIdCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func platform_id(
    type
) -> Gs2AccountPlatformIdAccessTokenDomain:
    return Gs2AccountPlatformIdAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        type
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2AccountAccountCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2AccountAccountCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2AccountAccountCache.cache_key(
            user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2AccountAccount",
        Gs2AccountAccountCache.cache_parent_key(
            namespace_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2AccountAccountCache.cache_key(
            user_id
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