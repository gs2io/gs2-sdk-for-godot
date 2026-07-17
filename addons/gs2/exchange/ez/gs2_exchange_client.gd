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
class_name Gs2ExchangeClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2ExchangeRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2ExchangeRestClient.new(connection.rest_session)


func acquire(game_session, namespace_name, await_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeAcquireRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.await_name = await_name
        return await _rest_client.acquire(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzAcquireResult.from_model(async_result.result), null)


func delete_await(game_session, namespace_name, await_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeDeleteAwaitRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.await_name = await_name
        return await _rest_client.delete_await(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzDeleteAwaitResult.from_model(async_result.result), null)


func get_await(game_session, namespace_name, await_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeGetAwaitRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.await_name = await_name
        return await _rest_client.get_await(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzGetAwaitResult.from_model(async_result.result), null)


func list_awaits(game_session, namespace_name, rate_name = null, page_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeDescribeAwaitsRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        return await _rest_client.describe_awaits(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzListAwaitsResult.from_model(async_result.result), null)


func get_rate_model(namespace_name, rate_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeGetRateModelRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        return await _rest_client.get_rate_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzGetRateModelResult.from_model(async_result.result), null)


func list_rate_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeDescribeRateModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_rate_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzListRateModelsResult.from_model(async_result.result), null)


func get_incremental_rate_model(namespace_name, rate_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeGetIncrementalRateModelRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        return await _rest_client.get_incremental_rate_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzGetIncrementalRateModelResult.from_model(async_result.result), null)


func list_incremental_rate_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeDescribeIncrementalRateModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_incremental_rate_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzListIncrementalRateModelsResult.from_model(async_result.result), null)


func exchange(game_session, namespace_name, rate_name, count, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeExchangeRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        request.access_token = game_session.access_token.token
        request.count = count
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.exchange(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzExchangeResult.from_model(async_result.result), null)


func incremental_exchange(game_session, namespace_name, rate_name, count, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2ExchangeIncrementalExchangeRequest.new()
        request.namespace_name = namespace_name
        request.rate_name = rate_name
        request.access_token = game_session.access_token.token
        request.count = count
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.incremental_exchange(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2ExchangeEzIncrementalExchangeResult.from_model(async_result.result), null)