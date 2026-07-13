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
class_name Gs2GatewayClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2GatewayWebSocketClient
var _rest_client: Gs2GatewayRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2GatewayWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2GatewayRestClient.new(connection.rest_session)


func set_user_id(game_session, namespace_name, allow_concurrent_access = null, session_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GatewaySetUserIdRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.allow_concurrent_access = allow_concurrent_access
        request.session_id = session_id
        return await _web_socket_client.set_user_id(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GatewayEzSetUserIdResult.from_model(async_result.result), null)