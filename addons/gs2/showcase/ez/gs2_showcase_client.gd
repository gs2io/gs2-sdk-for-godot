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
class_name Gs2ShowcaseClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2ShowcaseRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2ShowcaseRestClient.new(connection.rest_session)


func buy(game_session, namespace_name, showcase_name, display_item_id = null, quantity = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ShowcaseBuyRequest.new()
        request.namespace_name = namespace_name
        request.showcase_name = showcase_name
        request.access_token = game_session.access_token.token
        request.display_item_id = display_item_id
        request.quantity = quantity
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.buy(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ShowcaseEzBuyResult.from_model(async_result.result), null)


func get_showcase(game_session, namespace_name, showcase_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ShowcaseGetShowcaseRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.showcase_name = showcase_name
        return await _rest_client.get_showcase(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ShowcaseEzGetShowcaseResult.from_model(async_result.result), null)


func get_random_showcase_display_item(game_session, namespace_name, showcase_name, display_item_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ShowcaseGetRandomDisplayItemRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.showcase_name = showcase_name
        request.display_item_name = display_item_name
        return await _rest_client.get_random_display_item(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ShowcaseEzGetRandomShowcaseDisplayItemResult.from_model(async_result.result), null)


func list_random_showcase_display_items(game_session, namespace_name, showcase_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ShowcaseDescribeRandomDisplayItemsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.showcase_name = showcase_name
        return await _rest_client.describe_random_display_items(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ShowcaseEzListRandomShowcaseDisplayItemsResult.from_model(async_result.result), null)


func random_showcase_buy(game_session, namespace_name, showcase_name, display_item_name = null, quantity = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ShowcaseRandomShowcaseBuyRequest.new()
        request.namespace_name = namespace_name
        request.showcase_name = showcase_name
        request.access_token = game_session.access_token.token
        request.display_item_name = display_item_name
        request.quantity = quantity
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.random_showcase_buy(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ShowcaseEzRandomShowcaseBuyResult.from_model(async_result.result), null)