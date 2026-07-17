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
class_name Gs2IdleClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2IdleRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2IdleRestClient.new(connection.rest_session)


func get_category_model(namespace_name, category_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2IdleGetCategoryModelRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        return await _rest_client.get_category_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2IdleEzGetCategoryModelResult.from_model(async_result.result), null)


func list_category_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2IdleDescribeCategoryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_category_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2IdleEzListCategoryModelsResult.from_model(async_result.result), null)


func get_status(game_session, namespace_name, category_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2IdleGetStatusRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2IdleEzGetStatusResult.from_model(async_result.result), null)


func list_statuses(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2IdleDescribeStatusesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2IdleEzListStatusesResult.from_model(async_result.result), null)


func prediction(game_session, namespace_name, category_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2IdlePredictionRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        return await _rest_client.prediction(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2IdleEzPredictionResult.from_model(async_result.result), null)


func receive(game_session, namespace_name, category_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2IdleReceiveRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        return await _rest_client.receive(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2IdleEzReceiveResult.from_model(async_result.result), null)