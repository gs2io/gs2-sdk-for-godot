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
class_name Gs2InventoryInventoryModelMasterDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var inventory_name: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    inventory_name_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    inventory_name = inventory_name_


func get_(
    request: Gs2InventoryGetInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryGetInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2InventoryUpdateInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryUpdateInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2InventoryDeleteInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryDeleteInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_inventory_model_master(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_item_model_master(
    request: Gs2InventoryCreateItemModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryCreateItemModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_item_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryItemModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.inventory_name),
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func item_model_masters(
) -> Gs2InventoryDescribeItemModelMastersIterator:
    return Gs2InventoryDescribeItemModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name
    )


func subscribe_item_model_masters(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryItemModelMaster",
        Gs2InventoryItemModelMasterCache.cache_parent_key(
            namespace_name,
            inventory_name,
            null
        ),
        callback
    )


func unsubscribe_item_model_masters(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryItemModelMaster",
        Gs2InventoryItemModelMasterCache.cache_parent_key(
            namespace_name,
            inventory_name,
            null
        ),
        callback_id
    )


func invalidate_item_model_masters(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryItemModelMaster",
        Gs2InventoryItemModelMasterCache.cache_parent_key(
            namespace_name,
            inventory_name,
            null
        )
    )
func item_model_master(
    item_name
) -> Gs2InventoryItemModelMasterDomain:
    return Gs2InventoryItemModelMasterDomain.new(
        _gs2,
        namespace_name,
        inventory_name,
        item_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InventoryInventoryModelMasterCache.get_cache(
        _gs2.cache,
        namespace_name,
        inventory_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InventoryInventoryModelMasterCache.fetch(
        _gs2.cache,
        namespace_name,
        inventory_name,
        null,
        func():
            var get_result = await get_(Gs2InventoryGetInventoryModelMasterRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InventoryInventoryModelMasterCache.delete_cache(
        _gs2.cache,
        namespace_name,
        inventory_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventoryInventoryModelMaster",
        Gs2InventoryInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2InventoryInventoryModelMasterCache.cache_key(
            inventory_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InventoryInventoryModelMaster",
        Gs2InventoryInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2InventoryInventoryModelMasterCache.cache_key(
            inventory_name
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