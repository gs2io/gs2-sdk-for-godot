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
class_name Gs2InventoryEzBigInventoryGameSessionDomain
extends RefCounted


var _domain: Gs2InventoryBigInventoryAccessTokenDomain
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
var inventory_name: Variant:
    get:
        return null if _domain == null else _domain.inventory_name


func _init(
    domain: Gs2InventoryBigInventoryAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func big_items(
) -> Gs2InventoryEzListBigItemsIterator:
    return Gs2InventoryEzListBigItemsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_big_items(
    callback: Callable
) -> int:
    return _domain.subscribe_big_items(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzBigItem.from_model(v)))
    )


func unsubscribe_big_items(
    callback_id: int
) -> void:
    _domain.unsubscribe_big_items(
        callback_id
    )


func big_item(
    item_name
) -> Gs2InventoryEzBigItemGameSessionDomain:
    return Gs2InventoryEzBigItemGameSessionDomain.new(
        _domain.big_item(
            item_name
        ),
        _game_session,
        _connection
    )