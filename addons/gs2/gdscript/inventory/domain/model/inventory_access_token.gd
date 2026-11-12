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
class_name Gs2InventoryInventoryAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var inventory_name: Variant = null
var overflow_count: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    inventory_name_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    inventory_name = inventory_name_


func get_(
    request: Gs2InventoryGetInventoryRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_inventory_name(inventory_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2InventoryGetInventoryMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_inventory(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func verify_current_max_capacity(
    request: Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_inventory_name(inventory_name)
    var async_result = await Gs2InventoryVerifyInventoryCurrentMaxCapacityMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_inventory_current_max_capacity(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func item_sets(
) -> Gs2InventoryDescribeItemSetsIterator:
    return Gs2InventoryDescribeItemSetsIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name,
        access_token
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func item_set(
    item_name,
    item_set_name = null
) -> Gs2InventoryItemSetAccessTokenDomain:
    return Gs2InventoryItemSetAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
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
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InventoryInventoryCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2InventoryGetInventoryRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InventoryInventoryCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventoryInventory",
        Gs2InventoryInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
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
            (null if access_token == null else access_token.time_offset)
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