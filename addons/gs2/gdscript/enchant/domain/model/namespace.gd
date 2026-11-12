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
class_name Gs2EnchantNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2EnchantRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2EnchantRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2EnchantGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnchantGetNamespaceStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2EnchantGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnchantGetNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2EnchantUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnchantUpdateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2EnchantDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnchantDeleteNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_namespace(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_balance_parameter_model_master(
    request: Gs2EnchantCreateBalanceParameterModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnchantCreateBalanceParameterModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_balance_parameter_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2EnchantBalanceParameterModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_rarity_parameter_model_master(
    request: Gs2EnchantCreateRarityParameterModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnchantCreateRarityParameterModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_rarity_parameter_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2EnchantRarityParameterModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_parameter_master(
) -> Gs2EnchantCurrentParameterMasterDomain:
    return Gs2EnchantCurrentParameterMasterDomain.new(
        _gs2,
        namespace_name
    )


func balance_parameter_models(
) -> Gs2EnchantDescribeBalanceParameterModelsIterator:
    return Gs2EnchantDescribeBalanceParameterModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_balance_parameter_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantBalanceParameterModel",
        Gs2EnchantBalanceParameterModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_balance_parameter_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantBalanceParameterModel",
        Gs2EnchantBalanceParameterModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_balance_parameter_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantBalanceParameterModel",
        Gs2EnchantBalanceParameterModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func balance_parameter_model(
    parameter_name
) -> Gs2EnchantBalanceParameterModelDomain:
    return Gs2EnchantBalanceParameterModelDomain.new(
        _gs2,
        namespace_name,
        parameter_name
    )


func balance_parameter_model_masters(
    name_prefix = null
) -> Gs2EnchantDescribeBalanceParameterModelMastersIterator:
    return Gs2EnchantDescribeBalanceParameterModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_balance_parameter_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantBalanceParameterModelMaster",
        Gs2EnchantBalanceParameterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_balance_parameter_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantBalanceParameterModelMaster",
        Gs2EnchantBalanceParameterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_balance_parameter_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantBalanceParameterModelMaster",
        Gs2EnchantBalanceParameterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func balance_parameter_model_master(
    parameter_name
) -> Gs2EnchantBalanceParameterModelMasterDomain:
    return Gs2EnchantBalanceParameterModelMasterDomain.new(
        _gs2,
        namespace_name,
        parameter_name
    )


func rarity_parameter_models(
) -> Gs2EnchantDescribeRarityParameterModelsIterator:
    return Gs2EnchantDescribeRarityParameterModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_rarity_parameter_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantRarityParameterModel",
        Gs2EnchantRarityParameterModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rarity_parameter_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantRarityParameterModel",
        Gs2EnchantRarityParameterModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rarity_parameter_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantRarityParameterModel",
        Gs2EnchantRarityParameterModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rarity_parameter_model(
    parameter_name
) -> Gs2EnchantRarityParameterModelDomain:
    return Gs2EnchantRarityParameterModelDomain.new(
        _gs2,
        namespace_name,
        parameter_name
    )


func rarity_parameter_model_masters(
) -> Gs2EnchantDescribeRarityParameterModelMastersIterator:
    return Gs2EnchantDescribeRarityParameterModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_rarity_parameter_model_masters(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantRarityParameterModelMaster",
        Gs2EnchantRarityParameterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rarity_parameter_model_masters(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantRarityParameterModelMaster",
        Gs2EnchantRarityParameterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rarity_parameter_model_masters(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantRarityParameterModelMaster",
        Gs2EnchantRarityParameterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rarity_parameter_model_master(
    parameter_name
) -> Gs2EnchantRarityParameterModelMasterDomain:
    return Gs2EnchantRarityParameterModelMasterDomain.new(
        _gs2,
        namespace_name,
        parameter_name
    )
func user(
    user_id
) -> Gs2EnchantUserDomain:
    return Gs2EnchantUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2EnchantUserAccessTokenDomain:
    return Gs2EnchantUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2EnchantNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2EnchantNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2EnchantGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2EnchantNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2EnchantNamespace",
        Gs2EnchantNamespaceCache.cache_parent_key(
            null
        ),
        Gs2EnchantNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2EnchantNamespace",
        Gs2EnchantNamespaceCache.cache_parent_key(
            null
        ),
        Gs2EnchantNamespaceCache.cache_key(
            namespace_name
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