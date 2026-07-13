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
class_name Gs2InventoryBigInventoryDomain
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


func big_items(
    time_offset_token = null
) -> Gs2InventoryDescribeBigItemsByUserIdIterator:
    return Gs2InventoryDescribeBigItemsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        inventory_name,
        user_id,
        time_offset_token
    )


func subscribe_big_items(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryBigItem",
        Gs2InventoryBigItemCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        callback
    )


func unsubscribe_big_items(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryBigItem",
        Gs2InventoryBigItemCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        ),
        callback_id
    )


func invalidate_big_items(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryBigItem",
        Gs2InventoryBigItemCache.cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            null
        )
    )
func big_item(
    item_name
) -> Gs2InventoryBigItemDomain:
    return Gs2InventoryBigItemDomain.new(
        _gs2,
        namespace_name,
        user_id,
        inventory_name,
        item_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InventoryBigInventoryCache.get_cache(
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
    Gs2InventoryBigInventoryCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        inventory_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InventoryBigInventory",
        Gs2InventoryBigInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2InventoryBigInventoryCache.cache_key(
            inventory_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InventoryBigInventory",
        Gs2InventoryBigInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2InventoryBigInventoryCache.cache_key(
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