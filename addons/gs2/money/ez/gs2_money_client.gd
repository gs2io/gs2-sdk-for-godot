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
class_name Gs2MoneyClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2MoneyWebSocketClient
var _rest_client: Gs2MoneyRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2MoneyWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2MoneyRestClient.new(connection.rest_session)


func get_(game_session, namespace_name, slot) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MoneyGetWalletRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.slot = slot
        return await _web_socket_client.get_wallet(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MoneyEzGetResult.from_model(async_result.result), null)


func withdraw(game_session, namespace_name, slot, count, paid_only = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MoneyWithdrawRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.slot = slot
        request.count = count
        request.paid_only = paid_only
        return await _web_socket_client.withdraw(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MoneyEzWithdrawResult.from_model(async_result.result), null)