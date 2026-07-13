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
class_name Gs2LimitClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2LimitWebSocketClient
var _rest_client: Gs2LimitRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2LimitWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2LimitRestClient.new(connection.rest_session)


func count_up(game_session, namespace_name, limit_name, counter_name, count_up_value = null, max_value = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LimitCountUpRequest.new()
        request.namespace_name = namespace_name
        request.limit_name = limit_name
        request.counter_name = counter_name
        request.access_token = game_session.access_token.token
        request.count_up_value = count_up_value
        request.max_value = max_value
        return await _web_socket_client.count_up(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LimitEzCountUpResult.from_model(async_result.result), null)


func get_counter(game_session, namespace_name, limit_name, counter_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LimitGetCounterRequest.new()
        request.namespace_name = namespace_name
        request.limit_name = limit_name
        request.counter_name = counter_name
        request.access_token = game_session.access_token.token
        return await _web_socket_client.get_counter(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LimitEzGetCounterResult.from_model(async_result.result), null)


func list_counters(game_session, namespace_name, limit_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LimitDescribeCountersRequest.new()
        request.namespace_name = namespace_name
        request.limit_name = limit_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_counters(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LimitEzListCountersResult.from_model(async_result.result), null)


func get_limit_model(namespace_name, limit_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LimitGetLimitModelRequest.new()
        request.namespace_name = namespace_name
        request.limit_name = limit_name
        return await _web_socket_client.get_limit_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LimitEzGetLimitModelResult.from_model(async_result.result), null)


func list_limit_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LimitDescribeLimitModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_limit_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LimitEzListLimitModelsResult.from_model(async_result.result), null)