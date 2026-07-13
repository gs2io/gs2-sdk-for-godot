# Copyright 2016 Game Server Services, Inc. or its affiliates. All Rights
# Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License").
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
class_name Gs2GuildGuildAuthenticator
extends RefCounted


var need_re_authentication: bool = false

var _guild_namespace_name: Variant = null
var _guild_model_name: Variant = null
var _gateway_namespace_name: Variant = null
var _allow_concurrent_access: bool = true


func _init(
    guild_namespace_name,
    guild_model_name,
    gateway_namespace_name = "default",
    allow_concurrent_access = true
):
    _guild_namespace_name = guild_namespace_name
    _guild_model_name = guild_model_name
    _gateway_namespace_name = gateway_namespace_name
    _allow_concurrent_access = allow_concurrent_access


## GS2-Guild の Assume により、ギルドを主体とするアクセストークンを取得する。
func authentication(
    connection: Gs2Connection,
    user_game_session: Gs2GameSessionBase,
    guild_name: String
) -> Gs2AsyncResult:
    if connection.is_disconnected():
        var connect_result = await connection.connect_session()
        if connect_result.error != null:
            return Gs2AsyncResult.new(null, connect_result.error)

    if user_game_session == null or user_game_session.access_token == null:
        return Gs2AsyncResult.new(null, Gs2Exception.extract_error("guild.assume.error.notAuthenticated", 401))

    var guild_client = Gs2GuildRestClient.new(connection.rest_session)
    var assume_request = Gs2GuildAssumeRequest.new()
    assume_request.namespace_name = _guild_namespace_name
    assume_request.access_token = user_game_session.access_token.token
    assume_request.guild_model_name = _guild_model_name
    assume_request.guild_name = guild_name
    var assume_result = await guild_client.assume(assume_request)
    if assume_result.error != null:
        return Gs2AsyncResult.new(null, assume_result.error)

    var access_token = Gs2AuthAccessToken.new()
    access_token.token = assume_result.result.token
    access_token.user_id = assume_result.result.user_id
    access_token.federation_from_user_id = user_game_session.get_user_id()
    access_token.expire = assume_result.result.expire
    access_token.time_offset = user_game_session.access_token.time_offset

    if _gateway_namespace_name != null:
        var set_user_id_result = await _set_gateway_user_id(connection, access_token)
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


func _set_gateway_user_id(
    connection: Gs2Connection,
    access_token: Gs2AuthAccessToken
) -> Gs2AsyncResult:
    var gateway_client = Gs2GatewayWebSocketClient.new(connection.web_socket_session)
    var request = Gs2GatewaySetUserIdRequest.new()
    request.namespace_name = _gateway_namespace_name
    request.access_token = access_token.token
    request.allow_concurrent_access = _allow_concurrent_access
    var result = await gateway_client.set_user_id(request)
    if result.error == null or not result.error.is_session_not_open():
        return result

    var connect_result = await connection.connect_session()
    if connect_result.error != null:
        return connect_result
    return await gateway_client.set_user_id(request)


func _on_disconnect():
    need_re_authentication = true
