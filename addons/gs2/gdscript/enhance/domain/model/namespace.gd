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
class_name Gs2EnhanceNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2EnhanceRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2EnhanceRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2EnhanceGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnhanceGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2EnhanceGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnhanceGetNamespaceMethodCache.invoke(
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
    request: Gs2EnhanceUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnhanceUpdateNamespaceMethodCache.invoke(
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
    request: Gs2EnhanceDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnhanceDeleteNamespaceMethodCache.invoke(
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


func create_unleash_rate_model_master(
    request: Gs2EnhanceCreateUnleashRateModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnhanceCreateUnleashRateModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_unleash_rate_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2EnhanceUnleashRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_rate_model_master(
    request: Gs2EnhanceCreateRateModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2EnhanceCreateRateModelMasterMethodCache.invoke(
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
    var domain = Gs2EnhanceRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_rate_master(
) -> Gs2EnhanceCurrentRateMasterDomain:
    return Gs2EnhanceCurrentRateMasterDomain.new(
        _gs2,
        namespace_name
    )


func unleash_rate_models(
) -> Gs2EnhanceDescribeUnleashRateModelsIterator:
    return Gs2EnhanceDescribeUnleashRateModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_unleash_rate_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnhanceUnleashRateModel",
        Gs2EnhanceUnleashRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_unleash_rate_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnhanceUnleashRateModel",
        Gs2EnhanceUnleashRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_unleash_rate_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnhanceUnleashRateModel",
        Gs2EnhanceUnleashRateModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func unleash_rate_model(
    rate_name
) -> Gs2EnhanceUnleashRateModelDomain:
    return Gs2EnhanceUnleashRateModelDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )


func unleash_rate_model_masters(
    name_prefix = null
) -> Gs2EnhanceDescribeUnleashRateModelMastersIterator:
    return Gs2EnhanceDescribeUnleashRateModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_unleash_rate_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnhanceUnleashRateModelMaster",
        Gs2EnhanceUnleashRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_unleash_rate_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnhanceUnleashRateModelMaster",
        Gs2EnhanceUnleashRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_unleash_rate_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnhanceUnleashRateModelMaster",
        Gs2EnhanceUnleashRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func unleash_rate_model_master(
    rate_name
) -> Gs2EnhanceUnleashRateModelMasterDomain:
    return Gs2EnhanceUnleashRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )


func rate_models(
) -> Gs2EnhanceDescribeRateModelsIterator:
    return Gs2EnhanceDescribeRateModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_rate_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnhanceRateModel",
        Gs2EnhanceRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rate_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnhanceRateModel",
        Gs2EnhanceRateModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rate_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnhanceRateModel",
        Gs2EnhanceRateModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rate_model(
    rate_name
) -> Gs2EnhanceRateModelDomain:
    return Gs2EnhanceRateModelDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )
func user(
    user_id
) -> Gs2EnhanceUserDomain:
    return Gs2EnhanceUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2EnhanceUserAccessTokenDomain:
    return Gs2EnhanceUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func rate_model_masters(
    name_prefix = null
) -> Gs2EnhanceDescribeRateModelMastersIterator:
    return Gs2EnhanceDescribeRateModelMastersIterator.new(
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
        "Gs2EnhanceRateModelMaster",
        Gs2EnhanceRateModelMasterCache.cache_parent_key(
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
        "Gs2EnhanceRateModelMaster",
        Gs2EnhanceRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rate_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnhanceRateModelMaster",
        Gs2EnhanceRateModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rate_model_master(
    rate_name
) -> Gs2EnhanceRateModelMasterDomain:
    return Gs2EnhanceRateModelMasterDomain.new(
        _gs2,
        namespace_name,
        rate_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2EnhanceNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2EnhanceNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2EnhanceGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2EnhanceNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2EnhanceNamespace",
        Gs2EnhanceNamespaceCache.cache_parent_key(
            null
        ),
        Gs2EnhanceNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2EnhanceNamespace",
        Gs2EnhanceNamespaceCache.cache_parent_key(
            null
        ),
        Gs2EnhanceNamespaceCache.cache_key(
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