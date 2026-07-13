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
class_name Gs2MegaFieldClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2MegaFieldWebSocketClient
var _rest_client: Gs2MegaFieldRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2MegaFieldWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2MegaFieldRestClient.new(connection.rest_session)


func describe_area_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MegaFieldDescribeAreaModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_area_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MegaFieldEzDescribeAreaModelsResult.from_model(async_result.result), null)


func get_area_model(namespace_name, area_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MegaFieldGetAreaModelRequest.new()
        request.namespace_name = namespace_name
        request.area_model_name = area_model_name
        return await _rest_client.get_area_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MegaFieldEzGetAreaModelResult.from_model(async_result.result), null)


func describe_layer_models(namespace_name, area_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MegaFieldDescribeLayerModelsRequest.new()
        request.namespace_name = namespace_name
        request.area_model_name = area_model_name
        return await _rest_client.describe_layer_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MegaFieldEzDescribeLayerModelsResult.from_model(async_result.result), null)


func get_layer_model(namespace_name, area_model_name, layer_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MegaFieldGetLayerModelRequest.new()
        request.namespace_name = namespace_name
        request.area_model_name = area_model_name
        request.layer_model_name = layer_model_name
        return await _web_socket_client.get_layer_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MegaFieldEzGetLayerModelResult.from_model(async_result.result), null)


func update(game_session, namespace_name, area_model_name, layer_model_name, position, scopes = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MegaFieldActionRequest.new()
        request.namespace_name = namespace_name
        request.area_model_name = area_model_name
        request.layer_model_name = layer_model_name
        request.position = null if position == null else position.to_model()
        request.scopes = null if scopes == null else scopes.map(func(v): return null if v == null else v.to_model())
        request.access_token = game_session.access_token.token
        return await _rest_client.action(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MegaFieldEzUpdateResult.from_model(async_result.result), null)