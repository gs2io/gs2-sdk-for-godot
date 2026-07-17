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
class_name Gs2LoginRewardClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2LoginRewardRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2LoginRewardRestClient.new(connection.rest_session)


func missed_receive(game_session, namespace_name, bonus_model_name, step_number = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LoginRewardMissedReceiveRequest.new()
        request.namespace_name = namespace_name
        request.bonus_model_name = bonus_model_name
        request.access_token = game_session.access_token.token
        request.step_number = step_number
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.missed_receive(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LoginRewardEzMissedReceiveResult.from_model(async_result.result), null)


func receive(game_session, namespace_name, bonus_model_name, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LoginRewardReceiveRequest.new()
        request.namespace_name = namespace_name
        request.bonus_model_name = bonus_model_name
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.receive(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LoginRewardEzReceiveResult.from_model(async_result.result), null)


func get_bonus_model(namespace_name, bonus_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LoginRewardGetBonusModelRequest.new()
        request.namespace_name = namespace_name
        request.bonus_model_name = bonus_model_name
        return await _rest_client.get_bonus_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LoginRewardEzGetBonusModelResult.from_model(async_result.result), null)


func list_bonus_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LoginRewardDescribeBonusModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_bonus_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LoginRewardEzListBonusModelsResult.from_model(async_result.result), null)


func get_receive_status(game_session, namespace_name, bonus_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LoginRewardGetReceiveStatusRequest.new()
        request.namespace_name = namespace_name
        request.bonus_model_name = bonus_model_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_receive_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LoginRewardEzGetReceiveStatusResult.from_model(async_result.result), null)


func list_receive_statuss(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2LoginRewardDescribeReceiveStatusesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.describe_receive_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2LoginRewardEzListReceiveStatussResult.from_model(async_result.result), null)