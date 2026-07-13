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
class_name Gs2RealtimeClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2RealtimeWebSocketClient
var _rest_client: Gs2RealtimeRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2RealtimeWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2RealtimeRestClient.new(connection.rest_session)


func now(game_session) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RealtimeNowRequest.new()
        return await _web_socket_client.now(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RealtimeEzNowResult.from_model(async_result.result), null)


func get_room(namespace_name, room_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RealtimeGetRoomRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        return await _rest_client.get_room(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RealtimeEzGetRoomResult.from_model(async_result.result), null)