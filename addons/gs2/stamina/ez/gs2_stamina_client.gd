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
class_name Gs2StaminaClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2StaminaWebSocketClient
var _rest_client: Gs2StaminaRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2StaminaWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2StaminaRestClient.new(connection.rest_session)


func get_stamina_model(namespace_name, stamina_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaGetStaminaModelRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        return await _web_socket_client.get_stamina_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzGetStaminaModelResult.from_model(async_result.result), null)


func list_stamina_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaDescribeStaminaModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_stamina_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzListStaminaModelsResult.from_model(async_result.result), null)


func apply(game_session, namespace_name, stamina_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaApplyStaminaRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        request.access_token = game_session.access_token.token
        return await _web_socket_client.apply_stamina(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzApplyResult.from_model(async_result.result), null)


func consume(game_session, namespace_name, stamina_name, consume_value) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaConsumeStaminaRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        request.access_token = game_session.access_token.token
        request.consume_value = consume_value
        return await _web_socket_client.consume_stamina(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzConsumeResult.from_model(async_result.result), null)


func get_stamina(game_session, namespace_name, stamina_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaGetStaminaRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        request.access_token = game_session.access_token.token
        return await _web_socket_client.get_stamina(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzGetStaminaResult.from_model(async_result.result), null)


func list_staminas(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaDescribeStaminasRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_staminas(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzListStaminasResult.from_model(async_result.result), null)


func set_max_value(game_session, namespace_name, stamina_name, signed_status_body, signed_status_signature, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaSetMaxValueByStatusRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        request.access_token = game_session.access_token.token
        request.key_id = key_id
        request.signed_status_body = signed_status_body
        request.signed_status_signature = signed_status_signature
        return await _web_socket_client.set_max_value_by_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzSetMaxValueResult.from_model(async_result.result), null)


func set_recover_interval(game_session, namespace_name, stamina_name, signed_status_body, signed_status_signature, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaSetRecoverIntervalByStatusRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        request.access_token = game_session.access_token.token
        request.key_id = key_id
        request.signed_status_body = signed_status_body
        request.signed_status_signature = signed_status_signature
        return await _web_socket_client.set_recover_interval_by_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzSetRecoverIntervalResult.from_model(async_result.result), null)


func set_recover_value(game_session, namespace_name, stamina_name, signed_status_body, signed_status_signature, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2StaminaSetRecoverValueByStatusRequest.new()
        request.namespace_name = namespace_name
        request.stamina_name = stamina_name
        request.access_token = game_session.access_token.token
        request.key_id = key_id
        request.signed_status_body = signed_status_body
        request.signed_status_signature = signed_status_signature
        return await _web_socket_client.set_recover_value_by_status(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2StaminaEzSetRecoverValueResult.from_model(async_result.result), null)