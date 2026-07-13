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
class_name Gs2GradeClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2GradeWebSocketClient
var _rest_client: Gs2GradeRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2GradeWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2GradeRestClient.new(connection.rest_session)


func get_grade_model(namespace_name, grade_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GradeGetGradeModelRequest.new()
        request.namespace_name = namespace_name
        request.grade_name = grade_name
        return await _rest_client.get_grade_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GradeEzGetGradeModelResult.from_model(async_result.result), null)


func list_grade_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GradeDescribeGradeModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_grade_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GradeEzListGradeModelsResult.from_model(async_result.result), null)


func apply_rank_cap(game_session, namespace_name, grade_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GradeApplyRankCapRequest.new()
        request.namespace_name = namespace_name
        request.grade_name = grade_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _web_socket_client.apply_rank_cap(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GradeEzApplyRankCapResult.from_model(async_result.result), null)


func get_status(game_session, namespace_name, grade_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GradeGetStatusRequest.new()
        request.namespace_name = namespace_name
        request.grade_name = grade_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _web_socket_client.get_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GradeEzGetStatusResult.from_model(async_result.result), null)


func list_statuses(game_session, namespace_name, grade_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2GradeDescribeStatusesRequest.new()
        request.namespace_name = namespace_name
        request.grade_name = grade_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2GradeEzListStatusesResult.from_model(async_result.result), null)