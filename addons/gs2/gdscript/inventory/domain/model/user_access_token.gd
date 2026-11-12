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
class_name Gs2InventoryUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2InventoryRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2InventoryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func inventories(
) -> Gs2InventoryDescribeInventoriesIterator:
    return Gs2InventoryDescribeInventoriesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_inventories(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InventoryInventory",
        Gs2InventoryInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_inventories(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InventoryInventory",
        Gs2InventoryInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_inventories(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InventoryInventory",
        Gs2InventoryInventoryCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func inventory(
    inventory_name
) -> Gs2InventoryInventoryAccessTokenDomain:
    return Gs2InventoryInventoryAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        inventory_name
    )
func simple_inventory(
    inventory_name
) -> Gs2InventorySimpleInventoryAccessTokenDomain:
    return Gs2InventorySimpleInventoryAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        inventory_name
    )
func big_inventory(
    inventory_name
) -> Gs2InventoryBigInventoryAccessTokenDomain:
    return Gs2InventoryBigInventoryAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        inventory_name
    )