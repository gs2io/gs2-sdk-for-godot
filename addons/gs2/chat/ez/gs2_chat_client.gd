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
class_name Gs2ChatClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2ChatWebSocketClient
var _rest_client: Gs2ChatRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2ChatWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2ChatRestClient.new(connection.rest_session)


func create_room(game_session, namespace_name, name = null, metadata = null, password = null, white_list_user_ids = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatCreateRoomRequest.new()
        request.namespace_name = namespace_name
        request.name = name
        request.access_token = game_session.access_token.token
        request.metadata = metadata
        request.password = password
        request.white_list_user_ids = null if white_list_user_ids == null else white_list_user_ids.map(func(v): return v)
        return await _rest_client.create_room(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzCreateRoomResult.from_model(async_result.result), null)


func delete_room(game_session, namespace_name, room_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatDeleteRoomRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        return await _rest_client.delete_room(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzDeleteRoomResult.from_model(async_result.result), null)


func get_room(namespace_name, room_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatGetRoomRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        return await _rest_client.get_room(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzGetRoomResult.from_model(async_result.result), null)


func get_message(game_session, namespace_name, room_name, message_name = null, password = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatGetMessageRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.message_name = message_name
        request.access_token = game_session.access_token.token
        request.password = password
        return await _web_socket_client.get_message(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzGetMessageResult.from_model(async_result.result), null)


func list_latest_messages(game_session, namespace_name, room_name = null, limit = null, password = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatDescribeLatestMessagesRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        request.limit = limit
        request.password = password
        return await _rest_client.describe_latest_messages(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzListLatestMessagesResult.from_model(async_result.result), null)


func list_messages(game_session, namespace_name, room_name = null, start_at = null, limit = null, password = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatDescribeMessagesRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        request.start_at = start_at
        request.limit = limit
        request.password = password
        return await _rest_client.describe_messages(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzListMessagesResult.from_model(async_result.result), null)


func post(game_session, namespace_name, room_name, metadata, category = null, password = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatPostRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        request.category = category
        request.metadata = metadata
        request.password = password
        return await _web_socket_client.post(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzPostResult.from_model(async_result.result), null)


func list_subscribe_rooms(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatDescribeSubscribesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_subscribes(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzListSubscribeRoomsResult.from_model(async_result.result), null)


func subscribe(game_session, namespace_name, room_name, notification_types = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatSubscribeRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        request.notification_types = null if notification_types == null else notification_types.map(func(v): return null if v == null else v.to_model())
        return await _web_socket_client.subscribe(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzSubscribeResult.from_model(async_result.result), null)


func unsubscribe(game_session, namespace_name, room_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatUnsubscribeRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        return await _web_socket_client.unsubscribe(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzUnsubscribeResult.from_model(async_result.result), null)


func update_subscribe_setting(game_session, namespace_name, room_name, notification_types = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatUpdateNotificationTypeRequest.new()
        request.namespace_name = namespace_name
        request.room_name = room_name
        request.access_token = game_session.access_token.token
        request.notification_types = null if notification_types == null else notification_types.map(func(v): return null if v == null else v.to_model())
        return await _web_socket_client.update_notification_type(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzUpdateSubscribeSettingResult.from_model(async_result.result), null)


func get_category_model(namespace_name, category) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatGetCategoryModelRequest.new()
        request.namespace_name = namespace_name
        request.category = category
        return await _web_socket_client.get_category_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzGetCategoryModelResult.from_model(async_result.result), null)


func list_category_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ChatDescribeCategoryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_category_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ChatEzListCategoryModelsResult.from_model(async_result.result), null)