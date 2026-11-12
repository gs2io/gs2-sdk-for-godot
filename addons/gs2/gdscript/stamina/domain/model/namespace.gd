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
class_name Gs2StaminaNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2StaminaRestClient
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
    _client = Gs2StaminaRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2StaminaGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2StaminaGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaGetNamespaceMethodCache.invoke(
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
    request: Gs2StaminaUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaUpdateNamespaceMethodCache.invoke(
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
    request: Gs2StaminaDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaDeleteNamespaceMethodCache.invoke(
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


func create_max_stamina_table_master(
    request: Gs2StaminaCreateMaxStaminaTableMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaCreateMaxStaminaTableMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_max_stamina_table_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2StaminaMaxStaminaTableMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_recover_interval_table_master(
    request: Gs2StaminaCreateRecoverIntervalTableMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaCreateRecoverIntervalTableMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_recover_interval_table_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2StaminaRecoverIntervalTableMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_recover_value_table_master(
    request: Gs2StaminaCreateRecoverValueTableMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaCreateRecoverValueTableMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_recover_value_table_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2StaminaRecoverValueTableMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_stamina_model_master(
    request: Gs2StaminaCreateStaminaModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2StaminaCreateStaminaModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_stamina_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2StaminaStaminaModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_stamina_master(
) -> Gs2StaminaCurrentStaminaMasterDomain:
    return Gs2StaminaCurrentStaminaMasterDomain.new(
        _gs2,
        namespace_name
    )


func max_stamina_table_masters(
) -> Gs2StaminaDescribeMaxStaminaTableMastersIterator:
    return Gs2StaminaDescribeMaxStaminaTableMastersIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_max_stamina_table_masters(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2StaminaMaxStaminaTableMaster",
        Gs2StaminaMaxStaminaTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_max_stamina_table_masters(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2StaminaMaxStaminaTableMaster",
        Gs2StaminaMaxStaminaTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_max_stamina_table_masters(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2StaminaMaxStaminaTableMaster",
        Gs2StaminaMaxStaminaTableMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func max_stamina_table_master(
    max_stamina_table_name
) -> Gs2StaminaMaxStaminaTableMasterDomain:
    return Gs2StaminaMaxStaminaTableMasterDomain.new(
        _gs2,
        namespace_name,
        max_stamina_table_name
    )


func stamina_models(
) -> Gs2StaminaDescribeStaminaModelsIterator:
    return Gs2StaminaDescribeStaminaModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_stamina_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2StaminaStaminaModel",
        Gs2StaminaStaminaModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_stamina_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2StaminaStaminaModel",
        Gs2StaminaStaminaModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_stamina_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2StaminaStaminaModel",
        Gs2StaminaStaminaModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func stamina_model(
    stamina_name
) -> Gs2StaminaStaminaModelDomain:
    return Gs2StaminaStaminaModelDomain.new(
        _gs2,
        namespace_name,
        stamina_name
    )
func user(
    user_id
) -> Gs2StaminaUserDomain:
    return Gs2StaminaUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2StaminaUserAccessTokenDomain:
    return Gs2StaminaUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func recover_interval_table_masters(
    name_prefix = null
) -> Gs2StaminaDescribeRecoverIntervalTableMastersIterator:
    return Gs2StaminaDescribeRecoverIntervalTableMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_recover_interval_table_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2StaminaRecoverIntervalTableMaster",
        Gs2StaminaRecoverIntervalTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_recover_interval_table_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2StaminaRecoverIntervalTableMaster",
        Gs2StaminaRecoverIntervalTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_recover_interval_table_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2StaminaRecoverIntervalTableMaster",
        Gs2StaminaRecoverIntervalTableMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func recover_interval_table_master(
    recover_interval_table_name
) -> Gs2StaminaRecoverIntervalTableMasterDomain:
    return Gs2StaminaRecoverIntervalTableMasterDomain.new(
        _gs2,
        namespace_name,
        recover_interval_table_name
    )


func recover_value_table_masters(
    name_prefix = null
) -> Gs2StaminaDescribeRecoverValueTableMastersIterator:
    return Gs2StaminaDescribeRecoverValueTableMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_recover_value_table_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2StaminaRecoverValueTableMaster",
        Gs2StaminaRecoverValueTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_recover_value_table_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2StaminaRecoverValueTableMaster",
        Gs2StaminaRecoverValueTableMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_recover_value_table_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2StaminaRecoverValueTableMaster",
        Gs2StaminaRecoverValueTableMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func recover_value_table_master(
    recover_value_table_name
) -> Gs2StaminaRecoverValueTableMasterDomain:
    return Gs2StaminaRecoverValueTableMasterDomain.new(
        _gs2,
        namespace_name,
        recover_value_table_name
    )


func stamina_model_masters(
    name_prefix = null
) -> Gs2StaminaDescribeStaminaModelMastersIterator:
    return Gs2StaminaDescribeStaminaModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_stamina_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2StaminaStaminaModelMaster",
        Gs2StaminaStaminaModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_stamina_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2StaminaStaminaModelMaster",
        Gs2StaminaStaminaModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_stamina_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2StaminaStaminaModelMaster",
        Gs2StaminaStaminaModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func stamina_model_master(
    stamina_name
) -> Gs2StaminaStaminaModelMasterDomain:
    return Gs2StaminaStaminaModelMasterDomain.new(
        _gs2,
        namespace_name,
        stamina_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2StaminaNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2StaminaNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2StaminaGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2StaminaNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2StaminaNamespace",
        Gs2StaminaNamespaceCache.cache_parent_key(
            null
        ),
        Gs2StaminaNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2StaminaNamespace",
        Gs2StaminaNamespaceCache.cache_parent_key(
            null
        ),
        Gs2StaminaNamespaceCache.cache_key(
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