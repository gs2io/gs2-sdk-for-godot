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
class_name Gs2SerialKeyClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2SerialKeyWebSocketClient
var _rest_client: Gs2SerialKeyRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2SerialKeyWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2SerialKeyRestClient.new(connection.rest_session)


func get_campaign_model(namespace_name, campaign_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SerialKeyGetCampaignModelRequest.new()
        request.namespace_name = namespace_name
        request.campaign_model_name = campaign_model_name
        return await _web_socket_client.get_campaign_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SerialKeyEzGetCampaignModelResult.from_model(async_result.result), null)


func get_(namespace_name, code) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SerialKeyGetSerialKeyRequest.new()
        request.namespace_name = namespace_name
        request.code = code
        return await _web_socket_client.get_serial_key(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SerialKeyEzGetResult.from_model(async_result.result), null)


func use_serial_code(game_session, namespace_name, code) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SerialKeyUseRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.code = code
        return await _web_socket_client.use(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SerialKeyEzUseSerialCodeResult.from_model(async_result.result), null)