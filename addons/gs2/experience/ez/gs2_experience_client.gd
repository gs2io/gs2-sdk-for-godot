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
class_name Gs2ExperienceClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2ExperienceRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2ExperienceRestClient.new(connection.rest_session)


func get_experience_model(namespace_name, experience_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExperienceGetExperienceModelRequest.new()
        request.namespace_name = namespace_name
        request.experience_name = experience_name
        return await _rest_client.get_experience_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExperienceEzGetExperienceModelResult.from_model(async_result.result), null)


func list_experience_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExperienceDescribeExperienceModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_experience_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExperienceEzListExperienceModelsResult.from_model(async_result.result), null)


func get_status(game_session, namespace_name, experience_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExperienceGetStatusRequest.new()
        request.namespace_name = namespace_name
        request.experience_name = experience_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.get_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExperienceEzGetStatusResult.from_model(async_result.result), null)


func get_status_with_signature(game_session, namespace_name, experience_name, property_id, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExperienceGetStatusWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.experience_name = experience_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        request.key_id = key_id
        return await _rest_client.get_status_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExperienceEzGetStatusWithSignatureResult.from_model(async_result.result), null)


func list_statuses(game_session, namespace_name, experience_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExperienceDescribeStatusesRequest.new()
        request.namespace_name = namespace_name
        request.experience_name = experience_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExperienceEzListStatusesResult.from_model(async_result.result), null)