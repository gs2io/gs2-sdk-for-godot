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
class_name Gs2AccountAuthenticator
extends RefCounted


var need_re_authentication: bool = false

var _account_namespace_name: Variant = null
var _key_id: Variant = null
var _gateway_namespace_name: Variant = null
var _allow_concurrent_access: bool = false
var _version_namespace_name: Variant = null
var _target_versions: Variant = null


func _init(
    account_namespace_name,
    key_id,
    gateway_namespace_name = null,
    allow_concurrent_access = false,
    version_namespace_name = null,
    target_versions = null
):
    _account_namespace_name = account_namespace_name
    _key_id = key_id
    _gateway_namespace_name = gateway_namespace_name
    _allow_concurrent_access = allow_concurrent_access
    _version_namespace_name = version_namespace_name
    _target_versions = target_versions


func authentication(connection: Gs2Connection, user_id: String, password: String) -> Gs2AsyncResult:
    if connection.is_disconnected():
        var connect_result = await connection.connect_session()
        if connect_result.error != null:
            return Gs2AsyncResult.new(null, connect_result.error)

    var account_client = Gs2AccountRestClient.new(connection.rest_session)
    var authentication_request = Gs2AccountAuthenticationRequest.new()
    authentication_request.namespace_name = _account_namespace_name
    authentication_request.user_id = user_id
    authentication_request.key_id = _key_id
    authentication_request.password = password
    var authentication_result = await account_client.authentication(authentication_request)
    if authentication_result.error != null:
        return Gs2AsyncResult.new(null, authentication_result.error)

    var body = authentication_result.result.body
    var signature = authentication_result.result.signature
    if body == null or signature == null:
        return Gs2AsyncResult.new(null, Gs2Exception.extract_error("account.authentication.error.failed", 401))

    var auth_client = Gs2AuthRestClient.new(connection.rest_session)
    var login_request = Gs2AuthLoginBySignatureRequest.new()
    login_request.key_id = _key_id
    login_request.body = body
    login_request.signature = signature
    var login_result = await auth_client.login_by_signature(login_request)
    if login_result.error != null:
        return Gs2AsyncResult.new(null, login_result.error)

    var access_token = Gs2AuthAccessToken.new()
    access_token.token = login_result.result.token
    access_token.user_id = login_result.result.user_id
    access_token.expire = login_result.result.expire

    if _version_namespace_name != null:
        var version_result = await Gs2VersionRestClient.new(connection.rest_session).check_version(
            Gs2VersionCheckVersionRequest.new()
                .with_namespace_name(_version_namespace_name)
                .with_access_token(access_token.token)
                .with_target_versions(
                    null if _target_versions == null else _target_versions.map(
                        func(v): return null if v == null else v.to_model()
                    )
                )
        )
        if version_result.error != null:
            return Gs2AsyncResult.new(null, version_result.error)
        if version_result.result != null and version_result.result.errors != null \
                and not version_result.result.errors.is_empty():
            var version_error = Gs2UnauthorizedException.new()
            version_error.status_code = 401
            var request_error = Gs2RequestError.new()
            request_error.component = "version"
            request_error.message = "version.version.check.error.failed"
            version_error.errors.append(request_error)
            return Gs2AsyncResult.new(null, version_error)
        if version_result.result != null and version_result.result.project_token != null:
            connection.update_project_token(version_result.result.project_token)

    if _gateway_namespace_name != null:
        var gateway_client = Gs2GatewayWebSocketClient.new(connection.web_socket_session)
        var set_user_id_request = Gs2GatewaySetUserIdRequest.new()
        set_user_id_request.namespace_name = _gateway_namespace_name
        set_user_id_request.access_token = access_token.token
        set_user_id_request.allow_concurrent_access = _allow_concurrent_access
        var set_user_id_result = await gateway_client.set_user_id(set_user_id_request)
        if set_user_id_result.error != null:
            if set_user_id_result.error is Gs2ConflictException:
                pass
            elif set_user_id_result.error is Gs2NotFoundException:
                push_warning("The GS2-Gateway namespace does not exist and could not be configured to receive notifications from the server.")
            else:
                return Gs2AsyncResult.new(null, set_user_id_result.error)
        if not connection.web_socket_session.disconnected.is_connected(_on_disconnect):
            connection.web_socket_session.disconnected.connect(_on_disconnect)

    need_re_authentication = false
    return Gs2AsyncResult.new(access_token, null)


## Callback adapter corresponding to Unity's coroutine callback surface.
func authentication_with_callback(
    connection: Gs2Connection, user_id: String, password: String, callback: Callable
) -> void:
    callback.call(await authentication(connection, user_id, password))


func _on_disconnect():
    need_re_authentication = true
