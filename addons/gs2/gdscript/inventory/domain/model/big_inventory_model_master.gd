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
class_name Gs2InventoryBigInventoryModelMasterDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var inventory_name: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    inventory_name_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    inventory_name = inventory_name_


func get_(
    request: Gs2InventoryGetBigInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryGetBigInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_big_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2InventoryUpdateBigInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryUpdateBigInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_big_inventory_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2InventoryDeleteBigInventoryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryDeleteBigInventoryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_big_inventory_model_master(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_big_item_model_master(
    request: Gs2InventoryCreateBigItemModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryCreateBigItemModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_big_item_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryBigItemModelMasterDomain.new(
        _gs2,
        namespace_name,
        inventory_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func big_item_model_masters(
    name_prefix = null
) -> Gs2InventoryDescribeBigItemModelMastersIterator:
    return Gs2InventoryDescribeBigItemModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name,
        name_prefix
    )


func subscribe_big_item_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryBigItemModelMaster",
        Gs2InventoryBigItemModelMasterCache.cache_parent_key(
            namespace_name,
            inventory_name,
            null
        ),
        callback
    )


func unsubscribe_big_item_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryBigItemModelMaster",
        Gs2InventoryBigItemModelMasterCache.cache_parent_key(
            namespace_name,
            inventory_name,
            null
        ),
        callback_id
    )


func invalidate_big_item_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryBigItemModelMaster",
        Gs2InventoryBigItemModelMasterCache.cache_parent_key(
            namespace_name,
            inventory_name,
            null
        )
    )
func big_item_model_master(
    item_name
) -> Gs2InventoryBigItemModelMasterDomain:
    return Gs2InventoryBigItemModelMasterDomain.new(
        _gs2,
        namespace_name,
        inventory_name,
        item_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InventoryBigInventoryModelMasterCache.get_cache(
        _gs2.cache,
        namespace_name,
        inventory_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InventoryBigInventoryModelMasterCache.fetch(
        _gs2.cache,
        namespace_name,
        inventory_name,
        null,
        func():
            var get_result = await get_(Gs2InventoryGetBigInventoryModelMasterRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InventoryBigInventoryModelMasterCache.delete_cache(
        _gs2.cache,
        namespace_name,
        inventory_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventoryBigInventoryModelMaster",
        Gs2InventoryBigInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2InventoryBigInventoryModelMasterCache.cache_key(
            inventory_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InventoryBigInventoryModelMaster",
        Gs2InventoryBigInventoryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2InventoryBigInventoryModelMasterCache.cache_key(
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