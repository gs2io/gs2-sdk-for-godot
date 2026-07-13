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
class_name Gs2BuffClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2BuffWebSocketClient
var _rest_client: Gs2BuffRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2BuffWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2BuffRestClient.new(connection.rest_session)


func get_buff_entry_model(namespace_name, buff_entry_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2BuffGetBuffEntryModelRequest.new()
        request.namespace_name = namespace_name
        request.buff_entry_name = buff_entry_name
        return await _web_socket_client.get_buff_entry_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2BuffEzGetBuffEntryModelResult.from_model(async_result.result), null)


func list_buff_entry_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2BuffDescribeBuffEntryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_buff_entry_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2BuffEzListBuffEntryModelsResult.from_model(async_result.result), null)


func apply_buff(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2BuffApplyBuffRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.apply_buff(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2BuffEzApplyBuffResult.from_model(async_result.result), null)