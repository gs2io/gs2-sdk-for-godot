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
class_name Gs2EnhanceClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2EnhanceRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2EnhanceRestClient.new(connection.rest_session)


func get_rate_model(namespace_name, rate_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceGetRateModelRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        return await _rest_client.get_rate_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzGetRateModelResult.from_model(async_result.result), null)


func list_rate_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceDescribeRateModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_rate_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzListRateModelsResult.from_model(async_result.result), null)


func get_unleash_rate_model(namespace_name, rate_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceGetUnleashRateModelRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        return await _rest_client.get_unleash_rate_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzGetUnleashRateModelResult.from_model(async_result.result), null)


func list_unleash_rate_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceDescribeUnleashRateModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_unleash_rate_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzListUnleashRateModelsResult.from_model(async_result.result), null)


func delete_progress(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceDeleteProgressRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.delete_progress(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzDeleteProgressResult.from_model(async_result.result), null)


func end(game_session, namespace_name, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceEndRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.end(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzEndResult.from_model(async_result.result), null)


func get_progress(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceGetProgressRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_progress(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzGetProgressResult.from_model(async_result.result), null)


func start(game_session, namespace_name, rate_name, target_item_set_id, materials = null, force = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceStartRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        request.target_item_set_id = target_item_set_id
        request.materials = null if materials == null else materials.map(func(v): return null if v == null else v.to_model())
        request.access_token = game_session.access_token.token
        request.force = force
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.start(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzStartResult.from_model(async_result.result), null)


func enhance(game_session, namespace_name, rate_name, target_item_set_id, materials, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnhanceDirectEnhanceRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        request.access_token = game_session.access_token.token
        request.target_item_set_id = target_item_set_id
        request.materials = null if materials == null else materials.map(func(v): return null if v == null else v.to_model())
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.direct_enhance(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnhanceEzEnhanceResult.from_model(async_result.result), null)