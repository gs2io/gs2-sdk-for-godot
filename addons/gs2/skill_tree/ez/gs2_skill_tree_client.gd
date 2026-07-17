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
class_name Gs2SkillTreeClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2SkillTreeRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2SkillTreeRestClient.new(connection.rest_session)


func get_node_model(namespace_name, node_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SkillTreeGetNodeModelRequest.new()
        request.namespace_name = namespace_name
        request.node_model_name = node_model_name
        return await _rest_client.get_node_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SkillTreeEzGetNodeModelResult.from_model(async_result.result), null)


func list_node_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SkillTreeDescribeNodeModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_node_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SkillTreeEzListNodeModelsResult.from_model(async_result.result), null)


func get_status(game_session, namespace_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SkillTreeGetStatusRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.get_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SkillTreeEzGetStatusResult.from_model(async_result.result), null)


func release(game_session, namespace_name, node_model_names, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SkillTreeReleaseRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.node_model_names = null if node_model_names == null else node_model_names.map(func(v): return v)
        request.property_id = property_id
        return await _rest_client.release(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SkillTreeEzReleaseResult.from_model(async_result.result), null)


func reset(game_session, namespace_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SkillTreeResetRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.reset(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SkillTreeEzResetResult.from_model(async_result.result), null)


func restrain(game_session, namespace_name, node_model_names, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SkillTreeRestrainRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.node_model_names = null if node_model_names == null else node_model_names.map(func(v): return v)
        request.property_id = property_id
        return await _rest_client.restrain(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SkillTreeEzRestrainResult.from_model(async_result.result), null)