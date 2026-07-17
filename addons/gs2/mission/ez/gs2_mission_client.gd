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
class_name Gs2MissionClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2MissionRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2MissionRestClient.new(connection.rest_session)


func batch_receive_rewards(game_session, namespace_name, mission_group_name, mission_task_names, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionBatchCompleteRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        request.mission_task_names = null if mission_task_names == null else mission_task_names.map(func(v): return v)
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.batch_complete(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzBatchReceiveRewardsResult.from_model(async_result.result), null)


func evaluate_complete(game_session, namespace_name, mission_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionEvaluateCompleteRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        request.access_token = game_session.access_token.token
        return await _rest_client.evaluate_complete(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzEvaluateCompleteResult.from_model(async_result.result), null)


func get_complete(game_session, namespace_name, mission_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionGetCompleteRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_complete(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzGetCompleteResult.from_model(async_result.result), null)


func list_completes(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDescribeCompletesRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_completes(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzListCompletesResult.from_model(async_result.result), null)


func receive_rewards(game_session, namespace_name, mission_group_name, mission_task_name, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionCompleteRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        request.mission_task_name = mission_task_name
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.complete(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzReceiveRewardsResult.from_model(async_result.result), null)


func decrease_counter(game_session, namespace_name, counter_name, value) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDecreaseCounterRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.counter_name = counter_name
        request.value = value
        return await _rest_client.decrease_counter(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzDecreaseCounterResult.from_model(async_result.result), null)


func delete_counter(game_session, namespace_name, counter_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDeleteCounterRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.counter_name = counter_name
        return await _rest_client.delete_counter(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzDeleteCounterResult.from_model(async_result.result), null)


func get_counter(game_session, namespace_name, counter_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionGetCounterRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.counter_name = counter_name
        return await _rest_client.get_counter(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzGetCounterResult.from_model(async_result.result), null)


func list_counters(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDescribeCountersRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_counters(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzListCountersResult.from_model(async_result.result), null)


func reset_counter(game_session, namespace_name, counter_name, scopes) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionResetCounterRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.counter_name = counter_name
        request.scopes = null if scopes == null else scopes.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.reset_counter(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzResetCounterResult.from_model(async_result.result), null)


func get_counter_model(namespace_name, counter_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionGetCounterModelRequest.new()
        request.namespace_name = namespace_name
        request.counter_name = counter_name
        return await _rest_client.get_counter_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzGetCounterModelResult.from_model(async_result.result), null)


func list_counter_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDescribeCounterModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_counter_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzListCounterModelsResult.from_model(async_result.result), null)


func get_mission_group_model(namespace_name, mission_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionGetMissionGroupModelRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        return await _rest_client.get_mission_group_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzGetMissionGroupModelResult.from_model(async_result.result), null)


func list_mission_group_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDescribeMissionGroupModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_mission_group_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzListMissionGroupModelsResult.from_model(async_result.result), null)


func get_mission_task_model(namespace_name, mission_group_name, mission_task_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionGetMissionTaskModelRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        request.mission_task_name = mission_task_name
        return await _rest_client.get_mission_task_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzGetMissionTaskModelResult.from_model(async_result.result), null)


func list_mission_task_models(namespace_name, mission_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MissionDescribeMissionTaskModelsRequest.new()
        request.namespace_name = namespace_name
        request.mission_group_name = mission_group_name
        return await _rest_client.describe_mission_task_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MissionEzListMissionTaskModelsResult.from_model(async_result.result), null)