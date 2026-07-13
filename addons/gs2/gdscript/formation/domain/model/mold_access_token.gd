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
class_name Gs2FormationMoldAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2FormationRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var mold_model_name: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_,
    mold_model_name_
):
    _gs2 = gs2
    _client = Gs2FormationRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    mold_model_name = mold_model_name_


func get_(
    request: Gs2FormationGetMoldRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_mold_model_name(mold_model_name)
    var async_result = await Gs2FormationGetMoldMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_mold(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func sub_capacity(
    request: Gs2FormationSubMoldCapacityRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_mold_model_name(mold_model_name)
    var async_result = await Gs2FormationSubMoldCapacityMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.sub_mold_capacity(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2FormationDeleteMoldRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_mold_model_name(mold_model_name)
    var async_result = await Gs2FormationDeleteMoldMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_mold(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func forms(
) -> Gs2FormationDescribeFormsIterator:
    return Gs2FormationDescribeFormsIterator.new(
        _gs2,
        _client,
        namespace_name,
        mold_model_name,
        access_token
    )


func subscribe_forms(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationForm",
        Gs2FormationFormCache.cache_parent_key(
            namespace_name,
            user_id,
            mold_model_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_forms(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationForm",
        Gs2FormationFormCache.cache_parent_key(
            namespace_name,
            user_id,
            mold_model_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_forms(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationForm",
        Gs2FormationFormCache.cache_parent_key(
            namespace_name,
            user_id,
            mold_model_name,
            null if access_token == null else access_token.time_offset
        )
    )
func form(
    index
) -> Gs2FormationFormAccessTokenDomain:
    return Gs2FormationFormAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        mold_model_name,
        index
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2FormationMoldCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        mold_model_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2FormationMoldCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        mold_model_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2FormationGetMoldRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2FormationMoldCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        mold_model_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FormationMold",
        Gs2FormationMoldCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2FormationMoldCache.cache_key(
            mold_model_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FormationMold",
        Gs2FormationMoldCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2FormationMoldCache.cache_key(
            mold_model_name
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