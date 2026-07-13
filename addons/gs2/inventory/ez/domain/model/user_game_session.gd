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
class_name Gs2InventoryEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2InventoryUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2InventoryUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func inventories(
) -> Gs2InventoryEzListInventoriesIterator:
    return Gs2InventoryEzListInventoriesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_inventories(
    callback: Callable
) -> int:
    return _domain.subscribe_inventories(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzInventory.from_model(v)))
    )


func unsubscribe_inventories(
    callback_id: int
) -> void:
    _domain.unsubscribe_inventories(
        callback_id
    )


func inventory(
    inventory_name
) -> Gs2InventoryEzInventoryGameSessionDomain:
    return Gs2InventoryEzInventoryGameSessionDomain.new(
        _domain.inventory(
            inventory_name
        ),
        _game_session,
        _connection
    )


func simple_inventory(
    inventory_name
) -> Gs2InventoryEzSimpleInventoryGameSessionDomain:
    return Gs2InventoryEzSimpleInventoryGameSessionDomain.new(
        _domain.simple_inventory(
            inventory_name
        ),
        _game_session,
        _connection
    )


func big_inventory(
    inventory_name
) -> Gs2InventoryEzBigInventoryGameSessionDomain:
    return Gs2InventoryEzBigInventoryGameSessionDomain.new(
        _domain.big_inventory(
            inventory_name
        ),
        _game_session,
        _connection
    )