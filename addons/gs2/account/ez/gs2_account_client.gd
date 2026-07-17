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
class_name Gs2AccountClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2AccountRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2AccountRestClient.new(connection.rest_session)


func authentication(namespace_name, user_id, password, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountAuthenticationRequest.new()
        request.namespace_name = namespace_name
        request.user_id = user_id
        request.key_id = key_id
        request.password = password
        return await _rest_client.authentication(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzAuthenticationResult.from_model(async_result.result), null)


func create(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountCreateAccountRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.create_account(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzCreateResult.from_model(async_result.result), null)


func add_take_over_setting(game_session, namespace_name, type, user_identifier, password) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountCreateTakeOverRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        request.user_identifier = user_identifier
        request.password = password
        return await _rest_client.create_take_over(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzAddTakeOverSettingResult.from_model(async_result.result), null)


func add_take_over_setting_open_id_connect(game_session, namespace_name, type, id_token) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountCreateTakeOverOpenIdConnectRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        request.id_token = id_token
        return await _rest_client.create_take_over_open_id_connect(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzAddTakeOverSettingOpenIdConnectResult.from_model(async_result.result), null)


func delete_take_over_setting(game_session, namespace_name, type) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountDeleteTakeOverRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        return await _rest_client.delete_take_over(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzDeleteTakeOverSettingResult.from_model(async_result.result), null)


func do_take_over(namespace_name, type, user_identifier, password) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountDoTakeOverRequest.new()
        request.namespace_name = namespace_name
        request.type = type
        request.user_identifier = user_identifier
        request.password = password
        return await _rest_client.do_take_over(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzDoTakeOverResult.from_model(async_result.result), null)


func do_take_over_open_id_connect(namespace_name, type, id_token) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountDoTakeOverOpenIdConnectRequest.new()
        request.namespace_name = namespace_name
        request.type = type
        request.id_token = id_token
        return await _rest_client.do_take_over_open_id_connect(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzDoTakeOverOpenIdConnectResult.from_model(async_result.result), null)


func get_(game_session, namespace_name, type) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountGetTakeOverRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        return await _rest_client.get_take_over(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzGetResult.from_model(async_result.result), null)


func get_authorization_url(namespace_name, type) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountGetAuthorizationUrlRequest.new()
        request.namespace_name = namespace_name
        request.type = type
        return await _rest_client.get_authorization_url(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzGetAuthorizationUrlResult.from_model(async_result.result), null)


func list_take_over_settings(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountDescribeTakeOversRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_take_overs(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzListTakeOverSettingsResult.from_model(async_result.result), null)


func update_take_over_setting(game_session, namespace_name, type, old_password, password) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountUpdateTakeOverRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        request.old_password = old_password
        request.password = password
        return await _rest_client.update_take_over(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzUpdateTakeOverSettingResult.from_model(async_result.result), null)


func add_platform_id_setting(game_session, namespace_name, type, user_identifier) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountCreatePlatformIdRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        request.user_identifier = user_identifier
        return await _rest_client.create_platform_id(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzAddPlatformIdSettingResult.from_model(async_result.result), null)


func delete_platform_id_setting(game_session, namespace_name, type) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountDeletePlatformIdRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        return await _rest_client.delete_platform_id(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzDeletePlatformIdSettingResult.from_model(async_result.result), null)


func find_platform_user(game_session, namespace_name, type, user_identifier) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountFindPlatformIdRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        request.user_identifier = user_identifier
        return await _rest_client.find_platform_id(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzFindPlatformUserResult.from_model(async_result.result), null)


func get_platform_id(game_session, namespace_name, type) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountGetPlatformIdRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.type = type
        return await _rest_client.get_platform_id(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzGetPlatformIdResult.from_model(async_result.result), null)


func list_platform_id_settings(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2AccountDescribePlatformIdsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_platform_ids(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2AccountEzListPlatformIdSettingsResult.from_model(async_result.result), null)