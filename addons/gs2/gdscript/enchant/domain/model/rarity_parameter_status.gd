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
class_name Gs2EnchantRarityParameterStatusDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2EnchantRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var parameter_name: Variant = null
var property_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    parameter_name_,
    property_id_
):
    _gs2 = gs2
    _client = Gs2EnchantRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    parameter_name = parameter_name_
    if property_id_ != null:
        property_id_ = property_id_.replace("{region}", gs2.rest_session.region).replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id).replace("{userId}", "" if user_id == null else user_id)
    property_id = property_id_


func get_(
    request: Gs2EnchantGetRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_parameter_name(parameter_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2EnchantGetRarityParameterStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_rarity_parameter_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2EnchantDeleteRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_parameter_name(parameter_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2EnchantDeleteRarityParameterStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_rarity_parameter_status_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func re_draw(
    request: Gs2EnchantReDrawRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_parameter_name(parameter_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2EnchantReDrawRarityParameterStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.re_draw_rarity_parameter_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func add(
    request: Gs2EnchantAddRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_parameter_name(parameter_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2EnchantAddRarityParameterStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_rarity_parameter_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify(
    request: Gs2EnchantVerifyRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_parameter_name(parameter_name)
    request = request.with_user_id(user_id)
    request = request.with_property_id(property_id)
    var async_result = await Gs2EnchantVerifyRarityParameterStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_rarity_parameter_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_(
    request: Gs2EnchantSetRarityParameterStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_parameter_name(parameter_name)
    request = request.with_property_id(property_id)
    var async_result = await Gs2EnchantSetRarityParameterStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_rarity_parameter_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2EnchantRarityParameterStatusCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        parameter_name,
        property_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2EnchantRarityParameterStatusCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        parameter_name,
        property_id,
        null,
        func():
            var get_result = await get_(Gs2EnchantGetRarityParameterStatusByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2EnchantRarityParameterStatusCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        parameter_name,
        property_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2EnchantRarityParameterStatus",
        Gs2EnchantRarityParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2EnchantRarityParameterStatusCache.cache_key(
            parameter_name,
            property_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2EnchantRarityParameterStatus",
        Gs2EnchantRarityParameterStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2EnchantRarityParameterStatusCache.cache_key(
            parameter_name,
            property_id
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