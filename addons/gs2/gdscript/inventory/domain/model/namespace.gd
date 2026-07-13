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
class_name Gs2InventoryNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2InventoryRestClient
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
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2InventoryGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2InventoryGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryGetNamespaceMethodCache.invoke(
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
    request: Gs2InventoryUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryUpdateNamespaceMethodCache.invoke(
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
    request: Gs2InventoryDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryDeleteNamespaceMethodCache.invoke(
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


func create_simple_inventory_model_master(
    request: Gs2InventoryCreateSimpleInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryCreateSimpleInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_simple_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventorySimpleInventoryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_big_inventory_model_master(
    request: Gs2InventoryCreateBigInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryCreateBigInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_big_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryBigInventoryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_inventory_model_master(
    request: Gs2InventoryCreateInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InventoryCreateInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryInventoryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_item_model_master(
) -> Gs2InventoryCurrentItemModelMasterDomain:
    return Gs2InventoryCurrentItemModelMasterDomain.new(
        _gs2,
        namespace_name
    )


func inventory_models(
) -> Gs2InventoryDescribeInventoryModelsIterator:
    return Gs2InventoryDescribeInventoryModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_inventory_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryInventoryModel",
        Gs2InventoryInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_inventory_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryInventoryModel",
        Gs2InventoryInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_inventory_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryInventoryModel",
        Gs2InventoryInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func inventory_model(
    inventory_name
) -> Gs2InventoryInventoryModelDomain:
    return Gs2InventoryInventoryModelDomain.new(
        _gs2,
        namespace_name,
        inventory_name
    )
func user(
    user_id = null
) -> Gs2InventoryUserDomain:
    return Gs2InventoryUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2InventoryUserAccessTokenDomain:
    return Gs2InventoryUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func simple_inventory_model_masters(
    name_prefix = null
) -> Gs2InventoryDescribeSimpleInventoryModelMastersIterator:
    return Gs2InventoryDescribeSimpleInventoryModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_simple_inventory_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventorySimpleInventoryModelMaster",
        Gs2InventorySimpleInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_simple_inventory_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventorySimpleInventoryModelMaster",
        Gs2InventorySimpleInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_simple_inventory_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventorySimpleInventoryModelMaster",
        Gs2InventorySimpleInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func simple_inventory_model_master(
    inventory_name
) -> Gs2InventorySimpleInventoryModelMasterDomain:
    return Gs2InventorySimpleInventoryModelMasterDomain.new(
        _gs2,
        namespace_name,
        inventory_name
    )


func simple_inventory_models(
) -> Gs2InventoryDescribeSimpleInventoryModelsIterator:
    return Gs2InventoryDescribeSimpleInventoryModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_simple_inventory_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventorySimpleInventoryModel",
        Gs2InventorySimpleInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_simple_inventory_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventorySimpleInventoryModel",
        Gs2InventorySimpleInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_simple_inventory_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventorySimpleInventoryModel",
        Gs2InventorySimpleInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func simple_inventory_model(
    inventory_name
) -> Gs2InventorySimpleInventoryModelDomain:
    return Gs2InventorySimpleInventoryModelDomain.new(
        _gs2,
        namespace_name,
        inventory_name
    )


func big_inventory_models(
) -> Gs2InventoryDescribeBigInventoryModelsIterator:
    return Gs2InventoryDescribeBigInventoryModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_big_inventory_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryBigInventoryModel",
        Gs2InventoryBigInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_big_inventory_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryBigInventoryModel",
        Gs2InventoryBigInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_big_inventory_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryBigInventoryModel",
        Gs2InventoryBigInventoryModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func big_inventory_model(
    inventory_name
) -> Gs2InventoryBigInventoryModelDomain:
    return Gs2InventoryBigInventoryModelDomain.new(
        _gs2,
        namespace_name,
        inventory_name
    )


func big_inventory_model_masters(
    name_prefix = null
) -> Gs2InventoryDescribeBigInventoryModelMastersIterator:
    return Gs2InventoryDescribeBigInventoryModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_big_inventory_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryBigInventoryModelMaster",
        Gs2InventoryBigInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_big_inventory_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryBigInventoryModelMaster",
        Gs2InventoryBigInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_big_inventory_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryBigInventoryModelMaster",
        Gs2InventoryBigInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func big_inventory_model_master(
    inventory_name
) -> Gs2InventoryBigInventoryModelMasterDomain:
    return Gs2InventoryBigInventoryModelMasterDomain.new(
        _gs2,
        namespace_name,
        inventory_name
    )


func inventory_model_masters(
    name_prefix = null
) -> Gs2InventoryDescribeInventoryModelMastersIterator:
    return Gs2InventoryDescribeInventoryModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_inventory_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryInventoryModelMaster",
        Gs2InventoryInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_inventory_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryInventoryModelMaster",
        Gs2InventoryInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_inventory_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryInventoryModelMaster",
        Gs2InventoryInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func inventory_model_master(
    inventory_name
) -> Gs2InventoryInventoryModelMasterDomain:
    return Gs2InventoryInventoryModelMasterDomain.new(
        _gs2,
        namespace_name,
        inventory_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InventoryNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InventoryNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2InventoryGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InventoryNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventoryNamespace",
        Gs2InventoryNamespaceCache.cache_parent_key(
            null
        ),
        Gs2InventoryNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InventoryNamespace",
        Gs2InventoryNamespaceCache.cache_parent_key(
            null
        ),
        Gs2InventoryNamespaceCache.cache_key(
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