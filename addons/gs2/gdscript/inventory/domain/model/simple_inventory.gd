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
class_name Gs2InventorySimpleInventoryDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var inventory_name: Variant = null
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


func acquire_simple_items(
    request: Gs2InventoryAcquireSimpleItemsByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryAcquireSimpleItemsByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.acquire_simple_items_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2InventorySimpleItemDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                inventory_name,
                (null if v == null else v.item_name)
            ))
    return Gs2AsyncResult.new(domain, null)


func consume_simple_items(
    request: Gs2InventoryConsumeSimpleItemsByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryConsumeSimpleItemsByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.consume_simple_items_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2InventorySimpleItemDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                inventory_name,
                (null if v == null else v.item_name)
            ))
    return Gs2AsyncResult.new(domain, null)


func set_simple_items(
    request: Gs2InventorySetSimpleItemsByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventorySetSimpleItemsByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_simple_items_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2InventorySimpleItemDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                inventory_name,
                (null if v == null else v.item_name)
            ))
    return Gs2AsyncResult.new(domain, null)


func delete_simple_items(
    request: Gs2InventoryDeleteSimpleItemsByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InventoryDeleteSimpleItemsByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_simple_items_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func simple_items(
    time_offset_token = null
) -> Gs2InventoryDescribeSimpleItemsByUserIdIterator:
    return Gs2InventoryDescribeSimpleItemsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name,
        user_id,
        time_offset_token
    )


func subscribe_simple_items(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventorySimpleItem",
        Gs2InventorySimpleItemCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        callback
    )


func unsubscribe_simple_items(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventorySimpleItem",
        Gs2InventorySimpleItemCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        callback_id
    )


func invalidate_simple_items(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventorySimpleItem",
        Gs2InventorySimpleItemCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        )
    )
func simple_item(
    item_name
) -> Gs2InventorySimpleItemDomain:
    return Gs2InventorySimpleItemDomain.new(
        _gs2,
        namespace_name,
        user_id,
        inventory_name,
        item_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InventorySimpleInventoryCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2InventorySimpleInventoryCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventorySimpleInventory",
        Gs2InventorySimpleInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2InventorySimpleInventoryCache.cache_key(
            inventory_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InventorySimpleInventory",
        Gs2InventorySimpleInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2InventorySimpleInventoryCache.cache_key(
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