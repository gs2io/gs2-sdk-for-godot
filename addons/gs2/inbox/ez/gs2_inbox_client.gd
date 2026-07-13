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
class_name Gs2InboxClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2InboxWebSocketClient
var _rest_client: Gs2InboxRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2InboxWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2InboxRestClient.new(connection.rest_session)


func batch_read(game_session, namespace_name, message_names) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InboxBatchReadMessagesRequest.new()
        request.namespace_name = namespace_name
        request.message_names = null if message_names == null else message_names.map(func(v): return v)
        request.access_token = game_session.access_token.token
        return await _rest_client.batch_read_messages(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InboxEzBatchReadResult.from_model(async_result.result), null)


func delete(game_session, namespace_name, message_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InboxDeleteMessageRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.message_name = message_name
        return await _rest_client.delete_message(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InboxEzDeleteResult.from_model(async_result.result), null)


func get_(game_session, namespace_name, message_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InboxGetMessageRequest.new()
        request.namespace_name = namespace_name
        request.message_name = message_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_message(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InboxEzGetResult.from_model(async_result.result), null)


func list(game_session, namespace_name, is_read = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InboxDescribeMessagesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.is_read = is_read
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_messages(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InboxEzListResult.from_model(async_result.result), null)


func read(game_session, namespace_name, message_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InboxReadMessageRequest.new()
        request.namespace_name = namespace_name
        request.message_name = message_name
        request.access_token = game_session.access_token.token
        return await _rest_client.read_message(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InboxEzReadResult.from_model(async_result.result), null)


func receive_global_message(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2InboxReceiveGlobalMessageRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.receive_global_message(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2InboxEzReceiveGlobalMessageResult.from_model(async_result.result), null)