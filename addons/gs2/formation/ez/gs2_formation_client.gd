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
class_name Gs2FormationClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2FormationWebSocketClient
var _rest_client: Gs2FormationRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2FormationWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2FormationRestClient.new(connection.rest_session)


func get_mold_model(namespace_name, mold_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetMoldModelRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        return await _web_socket_client.get_mold_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetMoldModelResult.from_model(async_result.result), null)


func list_mold_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDescribeMoldModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_mold_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzListMoldModelsResult.from_model(async_result.result), null)


func get_mold(game_session, namespace_name, mold_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetMoldRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        request.access_token = game_session.access_token.token
        return await _web_socket_client.get_mold(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetMoldResult.from_model(async_result.result), null)


func list_molds(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDescribeMoldsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_molds(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzListMoldsResult.from_model(async_result.result), null)


func get_form_model(namespace_name, mold_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetFormModelRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        return await _web_socket_client.get_form_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetFormModelResult.from_model(async_result.result), null)


func delete_form(game_session, namespace_name, mold_model_name, index) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDeleteFormRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        request.access_token = game_session.access_token.token
        request.index = index
        return await _rest_client.delete_form(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzDeleteFormResult.from_model(async_result.result), null)


func get_form(game_session, namespace_name, mold_model_name, index) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetFormRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        request.access_token = game_session.access_token.token
        request.index = index
        return await _rest_client.get_form(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetFormResult.from_model(async_result.result), null)


func get_form_with_signature(game_session, namespace_name, mold_model_name, index, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetFormWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        request.access_token = game_session.access_token.token
        request.index = index
        request.key_id = key_id
        return await _rest_client.get_form_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetFormWithSignatureResult.from_model(async_result.result), null)


func list_forms(game_session, namespace_name, mold_model_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDescribeFormsRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_forms(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzListFormsResult.from_model(async_result.result), null)


func set_form(game_session, namespace_name, mold_model_name, index, slots, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationSetFormWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.mold_model_name = mold_model_name
        request.access_token = game_session.access_token.token
        request.index = index
        request.slots = null if slots == null else slots.map(func(v): return null if v == null else v.to_model())
        request.key_id = key_id
        return await _rest_client.set_form_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzSetFormResult.from_model(async_result.result), null)


func get_property_form_model(namespace_name, property_form_model_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetPropertyFormModelRequest.new()
        request.namespace_name = namespace_name
        request.property_form_model_name = property_form_model_name
        return await _web_socket_client.get_property_form_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetPropertyFormModelResult.from_model(async_result.result), null)


func list_property_form_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDescribePropertyFormModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_property_form_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzListPropertyFormModelsResult.from_model(async_result.result), null)


func delete_property_form(game_session, namespace_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDeletePropertyFormRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.delete_property_form(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzDeletePropertyFormResult.from_model(async_result.result), null)


func get_property_form(game_session, namespace_name, property_form_model_name, property_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetPropertyFormRequest.new()
        request.namespace_name = namespace_name
        request.property_form_model_name = property_form_model_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        return await _rest_client.get_property_form(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetPropertyFormResult.from_model(async_result.result), null)


func get_property_form_with_signature(game_session, namespace_name, property_form_model_name, property_id, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationGetPropertyFormWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.property_form_model_name = property_form_model_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        request.key_id = key_id
        return await _rest_client.get_property_form_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzGetPropertyFormWithSignatureResult.from_model(async_result.result), null)


func list_property_forms(game_session, namespace_name, property_form_model_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationDescribePropertyFormsRequest.new()
        request.namespace_name = namespace_name
        request.property_form_model_name = property_form_model_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_property_forms(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzListPropertyFormsResult.from_model(async_result.result), null)


func set_property_form(game_session, namespace_name, property_form_model_name, property_id, slots, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2FormationSetPropertyFormWithSignatureRequest.new()
        request.namespace_name = namespace_name
        request.property_form_model_name = property_form_model_name
        request.access_token = game_session.access_token.token
        request.property_id = property_id
        request.slots = null if slots == null else slots.map(func(v): return null if v == null else v.to_model())
        request.key_id = key_id
        return await _rest_client.set_property_form_with_signature(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2FormationEzSetPropertyFormResult.from_model(async_result.result), null)