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
class_name Gs2InventoryInventoryDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var inventory_name: Variant = null
var overflow_count: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    inventory_name_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    inventory_name = inventory_name_


func get_(
    request: Gs2InventoryGetInventoryByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryGetInventoryByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_inventory_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func add_capacity(
    request: Gs2InventoryAddCapacityByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryAddCapacityByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.add_capacity_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_capacity(
    request: Gs2InventorySetCapacityByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventorySetCapacityByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_capacity_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2InventoryDeleteInventoryByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryDeleteInventoryByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_inventory_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_current_max_capacity(
    request: Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_inventory_current_max_capacity_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func acquire_item_set_with_grade(
    request: Gs2InventoryAcquireItemSetWithGradeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryAcquireItemSetWithGradeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.acquire_item_set_with_grade_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InventoryItemSetDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.inventory_name),
        (null if ref == null else ref.item_name),
        (null if ref == null else ref.name)
    )
    domain.overflow_count = null if result == null else result.overflow_count
    return Gs2AsyncResult.new(domain, null)


func item_sets(
    time_offset_token = null
) -> Gs2InventoryDescribeItemSetsByUserIdIterator:
    return Gs2InventoryDescribeItemSetsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name,
        user_id,
        time_offset_token
    )


func subscribe_item_sets(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryItemSet",
        Gs2InventoryItemSetCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        callback
    )


func unsubscribe_item_sets(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryItemSet",
        Gs2InventoryItemSetCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        callback_id
    )


func invalidate_item_sets(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryItemSet",
        Gs2InventoryItemSetCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        )
    )
func item_set(
    item_name,
    item_set_name = null
) -> Gs2InventoryItemSetDomain:
    return Gs2InventoryItemSetDomain.new(
        _gs2,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InventoryInventoryCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InventoryInventoryCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        null,
        func():
            var get_result = await get_(Gs2InventoryGetInventoryByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InventoryInventoryCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventoryInventory",
        Gs2InventoryInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2InventoryInventoryCache.cache_key(
            inventory_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InventoryInventory",
        Gs2InventoryInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2InventoryInventoryCache.cache_key(
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