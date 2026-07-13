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
class_name Gs2VersionClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2VersionWebSocketClient
var _rest_client: Gs2VersionRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2VersionWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2VersionRestClient.new(connection.rest_session)


func get_version_model(namespace_name, version_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionGetVersionModelRequest.new()
        request.namespace_name = namespace_name
        request.version_name = version_name
        return await _web_socket_client.get_version_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzGetVersionModelResult.from_model(async_result.result), null)


func list_version_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionDescribeVersionModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_version_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzListVersionModelsResult.from_model(async_result.result), null)


func accept(game_session, namespace_name, version_name, version = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionAcceptRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.version_name = version_name
        request.version = null if version == null else version.to_model()
        return await _web_socket_client.accept(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzAcceptResult.from_model(async_result.result), null)


func delete(game_session, namespace_name, version_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionDeleteAcceptVersionRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.version_name = version_name
        return await _web_socket_client.delete_accept_version(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzDeleteResult.from_model(async_result.result), null)


func list(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionDescribeAcceptVersionsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_accept_versions(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzListResult.from_model(async_result.result), null)


func reject(game_session, namespace_name, version_name, version = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionRejectRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.version_name = version_name
        request.version = null if version == null else version.to_model()
        return await _web_socket_client.reject(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzRejectResult.from_model(async_result.result), null)


func check_version(game_session, namespace_name, target_versions = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2VersionCheckVersionRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.target_versions = null if target_versions == null else target_versions.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.check_version(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2VersionEzCheckVersionResult.from_model(async_result.result), null)