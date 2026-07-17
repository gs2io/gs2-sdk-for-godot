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
class_name Gs2InventoryClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2InventoryRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2InventoryRestClient.new(connection.rest_session)


func get_inventory_model(namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetInventoryModelRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        return await _rest_client.get_inventory_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetInventoryModelResult.from_model(async_result.result), null)


func list_inventory_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeInventoryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_inventory_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListInventoryModelsResult.from_model(async_result.result), null)


func get_item_model(namespace_name, inventory_name, item_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetItemModelRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        return await _rest_client.get_item_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetItemModelResult.from_model(async_result.result), null)


func list_item_models(namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeItemModelsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        return await _rest_client.describe_item_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListItemModelsResult.from_model(async_result.result), null)


func get_inventory(game_session, namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetInventoryRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_inventory(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetInventoryResult.from_model(async_result.result), null)


func list_inventories(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeInventoriesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_inventories(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListInventoriesResult.from_model(async_result.result), null)


func consume(game_session, namespace_name, inventory_name, item_name, consume_count, item_set_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryConsumeItemSetRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        request.consume_count = consume_count
        request.item_set_name = item_set_name
        return await _rest_client.consume_item_set(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzConsumeResult.from_model(async_result.result), null)


func get_item(game_session, namespace_name, inventory_name, item_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetItemSetRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_item_set(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetItemResult.from_model(async_result.result), null)


func get_item_with_signature(game_session, namespace_name, inventory_name, item_name, item_set_name = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetItemWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        request.item_set_name = item_set_name
        request.key_id = key_id
        return await _rest_client.get_item_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetItemWithSignatureResult.from_model(async_result.result), null)


func list_items(game_session, namespace_name, inventory_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeItemSetsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_item_sets(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListItemsResult.from_model(async_result.result), null)


func get_simple_inventory_model(namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetSimpleInventoryModelRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        return await _rest_client.get_simple_inventory_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetSimpleInventoryModelResult.from_model(async_result.result), null)


func list_simple_inventory_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeSimpleInventoryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_simple_inventory_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListSimpleInventoryModelsResult.from_model(async_result.result), null)


func get_simple_item_model(namespace_name, inventory_name, item_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetSimpleItemModelRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        return await _rest_client.get_simple_item_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetSimpleItemModelResult.from_model(async_result.result), null)


func list_simple_item_models(namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeSimpleItemModelsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        return await _rest_client.describe_simple_item_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListSimpleItemModelsResult.from_model(async_result.result), null)


func consume_simple_items(game_session, namespace_name, inventory_name, consume_counts) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryConsumeSimpleItemsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.access_token = game_session.access_token.token
        request.consume_counts = null if consume_counts == null else consume_counts.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.consume_simple_items(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzConsumeSimpleItemsResult.from_model(async_result.result), null)


func get_simple_item(game_session, namespace_name, inventory_name, item_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetSimpleItemRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_simple_item(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetSimpleItemResult.from_model(async_result.result), null)


func get_simple_item_with_signature(game_session, namespace_name, inventory_name, item_name, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetSimpleItemWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        request.key_id = key_id
        return await _rest_client.get_simple_item_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetSimpleItemWithSignatureResult.from_model(async_result.result), null)


func list_simple_items(game_session, namespace_name, inventory_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeSimpleItemsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_simple_items(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListSimpleItemsResult.from_model(async_result.result), null)


func get_big_inventory_model(namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetBigInventoryModelRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        return await _rest_client.get_big_inventory_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetBigInventoryModelResult.from_model(async_result.result), null)


func list_big_inventory_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeBigInventoryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_big_inventory_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListBigInventoryModelsResult.from_model(async_result.result), null)


func get_big_item_model(namespace_name, inventory_name, item_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetBigItemModelRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        return await _rest_client.get_big_item_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetBigItemModelResult.from_model(async_result.result), null)


func list_big_item_models(namespace_name, inventory_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeBigItemModelsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        return await _rest_client.describe_big_item_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListBigItemModelsResult.from_model(async_result.result), null)


func consume_big_item(game_session, namespace_name, inventory_name, item_name, consume_count) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryConsumeBigItemRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        request.consume_count = null if consume_count == null else str(consume_count)
        return await _rest_client.consume_big_item(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzConsumeBigItemResult.from_model(async_result.result), null)


func get_big_item(game_session, namespace_name, inventory_name, item_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryGetBigItemRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.item_name = item_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_big_item(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzGetBigItemResult.from_model(async_result.result), null)


func list_big_items(game_session, namespace_name, inventory_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InventoryDescribeBigItemsRequest.new()
        request.namespace_name = namespace_name
        request.inventory_name = inventory_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_big_items(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InventoryEzListBigItemsResult.from_model(async_result.result), null)