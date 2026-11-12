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
class_name Gs2ExchangeNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ExchangeRestClient
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
    _client = Gs2ExchangeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2ExchangeGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExchangeGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2ExchangeGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExchangeGetNamespaceMethodCache.invoke(
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
    request: Gs2ExchangeUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExchangeUpdateNamespaceMethodCache.invoke(
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
    request: Gs2ExchangeDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExchangeDeleteNamespaceMethodCache.invoke(
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


func create_rate_model_master(
    request: Gs2ExchangeCreateRateModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExchangeCreateRateModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_rate_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ExchangeRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_incremental_rate_model_master(
    request: Gs2ExchangeCreateIncrementalRateModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExchangeCreateIncrementalRateModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_incremental_rate_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ExchangeIncrementalRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func rate_model_masters(
    name_prefix = null
) -> Gs2ExchangeDescribeRateModelMastersIterator:
    return Gs2ExchangeDescribeRateModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_rate_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExchangeRateModelMaster",
        Gs2ExchangeRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rate_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExchangeRateModelMaster",
        Gs2ExchangeRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rate_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExchangeRateModelMaster",
        Gs2ExchangeRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rate_model_master(
    rate_name
) -> Gs2ExchangeRateModelMasterDomain:
    return Gs2ExchangeRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )
func current_rate_master(
) -> Gs2ExchangeCurrentRateMasterDomain:
    return Gs2ExchangeCurrentRateMasterDomain.new(
        _gs2,
        namespace_name
    )


func rate_models(
) -> Gs2ExchangeDescribeRateModelsIterator:
    return Gs2ExchangeDescribeRateModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_rate_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExchangeRateModel",
        Gs2ExchangeRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rate_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExchangeRateModel",
        Gs2ExchangeRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rate_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExchangeRateModel",
        Gs2ExchangeRateModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rate_model(
    rate_name
) -> Gs2ExchangeRateModelDomain:
    return Gs2ExchangeRateModelDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )
func user(
    user_id
) -> Gs2ExchangeUserDomain:
    return Gs2ExchangeUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2ExchangeUserAccessTokenDomain:
    return Gs2ExchangeUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func incremental_rate_models(
) -> Gs2ExchangeDescribeIncrementalRateModelsIterator:
    return Gs2ExchangeDescribeIncrementalRateModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_incremental_rate_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExchangeIncrementalRateModel",
        Gs2ExchangeIncrementalRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_incremental_rate_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExchangeIncrementalRateModel",
        Gs2ExchangeIncrementalRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_incremental_rate_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExchangeIncrementalRateModel",
        Gs2ExchangeIncrementalRateModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func incremental_rate_model(
    rate_name
) -> Gs2ExchangeIncrementalRateModelDomain:
    return Gs2ExchangeIncrementalRateModelDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )


func incremental_rate_model_masters(
    name_prefix = null
) -> Gs2ExchangeDescribeIncrementalRateModelMastersIterator:
    return Gs2ExchangeDescribeIncrementalRateModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_incremental_rate_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExchangeIncrementalRateModelMaster",
        Gs2ExchangeIncrementalRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_incremental_rate_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExchangeIncrementalRateModelMaster",
        Gs2ExchangeIncrementalRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_incremental_rate_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExchangeIncrementalRateModelMaster",
        Gs2ExchangeIncrementalRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func incremental_rate_model_master(
    rate_name
) -> Gs2ExchangeIncrementalRateModelMasterDomain:
    return Gs2ExchangeIncrementalRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2ExchangeNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ExchangeNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2ExchangeGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ExchangeNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ExchangeNamespace",
        Gs2ExchangeNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ExchangeNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ExchangeNamespace",
        Gs2ExchangeNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ExchangeNamespaceCache.cache_key(
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