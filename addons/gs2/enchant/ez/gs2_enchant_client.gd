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
class_name Gs2EnchantClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2EnchantRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2EnchantRestClient.new(connection.rest_session)


func get_balance_parameter_model(namespace_name, parameter_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantGetBalanceParameterModelRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        return await _rest_client.get_balance_parameter_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzGetBalanceParameterModelResult.from_model(async_result.result), null)


func list_balance_parameter_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantDescribeBalanceParameterModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_balance_parameter_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzListBalanceParameterModelsResult.from_model(async_result.result), null)


func get_balance_parameter_status(game_session, namespace_name, parameter_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantGetBalanceParameterStatusRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.get_balance_parameter_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzGetBalanceParameterStatusResult.from_model(async_result.result), null)


func list_balance_parameter_statuses(game_session, namespace_name, parameter_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantDescribeBalanceParameterStatusesRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_balance_parameter_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzListBalanceParameterStatusesResult.from_model(async_result.result), null)


func get_rarity_parameter_model(namespace_name, parameter_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantGetRarityParameterModelRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        return await _rest_client.get_rarity_parameter_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzGetRarityParameterModelResult.from_model(async_result.result), null)


func list_rarity_parameter_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantDescribeRarityParameterModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_rarity_parameter_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzListRarityParameterModelsResult.from_model(async_result.result), null)


func get_rarity_parameter_status(game_session, namespace_name, parameter_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantGetRarityParameterStatusRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.get_rarity_parameter_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzGetRarityParameterStatusResult.from_model(async_result.result), null)


func list_rarity_parameter_statuses(game_session, namespace_name, parameter_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantDescribeRarityParameterStatusesRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_rarity_parameter_statuses(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzListRarityParameterStatusesResult.from_model(async_result.result), null)


func verify_rarity_parameter_status(game_session, namespace_name, parameter_name, property_id, verify_type, parameter_value_name, parameter_count) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2EnchantVerifyRarityParameterStatusRequest.new()
        request.namespace_name = namespace_name
        request.parameter_name = parameter_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        request.verify_type = verify_type
        request.parameter_value_name = parameter_value_name
        request.parameter_count = parameter_count
        return await _rest_client.verify_rarity_parameter_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EnchantEzVerifyRarityParameterStatusResult.from_model(async_result.result), null)