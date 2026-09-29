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
class_name Gs2InventoryEzSimpleInventoryGameSessionDomain
extends RefCounted


var _domain: Gs2InventorySimpleInventoryAccessTokenDomain
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
    domain: Gs2InventorySimpleInventoryAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func consume_simple_items(
    consume_counts
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.consume_simple_items(
            Gs2InventoryConsumeSimpleItemsRequest.new()
                .with_consume_counts(null if consume_counts == null else consume_counts.map(func(v): return null if v == null else v.to_model()))
        )
    )
    if async_result.error != null:
        return async_result
    var domains = []
    if async_result.result != null:
        for v in async_result.result:
            domains.append(Gs2InventoryEzSimpleItemGameSessionDomain.new(
                v,
                _game_session,
                _connection
            ))
    return Gs2AsyncResult.new(domains, null)


func simple_items(
) -> Gs2InventoryEzListSimpleItemsIterator:
    return Gs2InventoryEzListSimpleItemsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_simple_items(
    callback: Callable
) -> int:
    return _domain.subscribe_simple_items(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzSimpleItem.from_model(v)))
    )


func unsubscribe_simple_items(
    callback_id: int
) -> void:
    _domain.unsubscribe_simple_items(
        callback_id
    )


func simple_item(
    item_name
) -> Gs2InventoryEzSimpleItemGameSessionDomain:
    return Gs2InventoryEzSimpleItemGameSessionDomain.new(
        _domain.simple_item(
            item_name
        ),
        _game_session,
        _connection
    )