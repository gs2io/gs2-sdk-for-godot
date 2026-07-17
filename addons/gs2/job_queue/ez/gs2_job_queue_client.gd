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
class_name Gs2JobQueueClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2JobQueueRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2JobQueueRestClient.new(connection.rest_session)


func run(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2JobQueueRunRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.run(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2JobQueueEzRunResult.from_model(async_result.result), null)


func get_result(game_session, namespace_name, job_name = null, try_number = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2JobQueueGetJobResultRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.job_name = job_name
        request.try_number = try_number
        return await _rest_client.get_job_result(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2JobQueueEzGetResultResult.from_model(async_result.result), null)