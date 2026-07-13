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
# deny overwrite
class_name Gs2GuildEzGuildDomain
extends RefCounted


var _domain: Gs2GuildGuildDomain
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var guild_model_name: Variant:
    get:
        return null if _domain == null else _domain.guild_model_name
var guild_name: Variant:
    get:
        return null if _domain == null else _domain.guild_name


func _init(
    domain: Gs2GuildGuildDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func receive_member_request(
    from_user_id
) -> Gs2GuildEzReceiveMemberRequestDomain:
    return Gs2GuildEzReceiveMemberRequestDomain.new(
        _domain.receive_member_request(
            from_user_id
        ),
        _connection
    )


func ignore_user(
) -> Gs2GuildEzIgnoreUserDomain:
    return Gs2GuildEzIgnoreUserDomain.new(
        _domain.ignore_user(
        ),
        _connection
    )


func last_guild_master_activity(
) -> Gs2GuildEzLastGuildMasterActivityDomain:
    return Gs2GuildEzLastGuildMasterActivityDomain.new(
        _domain.last_guild_master_activity(
        ),
        _connection
    )


# diff +++ start
# Unity EzGuildDomain parity. A regular GameSession supplies the access token
# required by the raw GuildDomain model operation.
# 戻り値: Gs2AsyncResult (result = Gs2GuildEzGuild)
func model(game_session) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.model(
            null if game_session == null else game_session.access_token
        )
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2GuildEzGuild.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(game_session, callback: Callable) -> int:
    return _domain.subscribe_model(
        null if game_session == null else game_session.access_token,
        func(item): callback.call(null if item == null else Gs2GuildEzGuild.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(game_session, callback: Callable) -> Gs2AsyncResult:
    var model_result = await model(game_session)
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(game_session, callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)
# diff +++ end
