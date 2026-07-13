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
class_name Gs2LogClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2LogWebSocketClient
var _rest_client: Gs2LogRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2LogWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2LogRestClient.new(connection.rest_session)


func send_in_game_log(game_session, namespace_name, payload, tags = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LogSendInGameLogRequest.new()
        request.namespace_name = namespace_name
        request.tags = null if tags == null else tags.map(func(v): return null if v == null else v.to_model())
        request.payload = payload
        request.access_token = game_session.access_token.token
        return await _rest_client.send_in_game_log(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LogEzSendInGameLogResult.from_model(async_result.result), null)