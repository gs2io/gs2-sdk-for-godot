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
class_name Gs2GuildEzGuildGameSessionDomain
extends RefCounted


var _domain: Gs2GuildGuildAccessTokenDomain
var _game_session: Variant
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
    domain: Gs2GuildGuildAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func update_guild(
    access_token,
    display_name,
    join_policy,
    attribute1 = null,
    attribute2 = null,
    attribute3 = null,
    attribute4 = null,
    attribute5 = null,
    metadata = null,
    custom_roles = null,
    guild_member_default_role = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.update(
            Gs2GuildUpdateGuildRequest.new()
                .with_access_token(access_token)
                .with_display_name(display_name)
                .with_attribute1(attribute1)
                .with_attribute2(attribute2)
                .with_attribute3(attribute3)
                .with_attribute4(attribute4)
                .with_attribute5(attribute5)
                .with_metadata(metadata)
                .with_join_policy(join_policy)
                .with_custom_roles(null if custom_roles == null else custom_roles.map(func(v): return null if v == null else v.to_model()))
                .with_guild_member_default_role(guild_member_default_role)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzGuildGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func delete_member_from_guild(
    access_token,
    target_user_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete_member(
            Gs2GuildDeleteMemberRequest.new()
                .with_access_token(access_token)
                .with_target_user_id(target_user_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzGuildGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func update_guild_member_role(
    access_token,
    target_user_id,
    role_name
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.update_member_role(
            Gs2GuildUpdateMemberRoleRequest.new()
                .with_access_token(access_token)
                .with_target_user_id(target_user_id)
                .with_role_name(role_name)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzGuildGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func delete_guild(
    access_token
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete(
            Gs2GuildDeleteGuildRequest.new()
                .with_access_token(access_token)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzGuildGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func add_ignore_user(
    access_token,
    user_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.add_ignore_user(
            Gs2GuildAddIgnoreUserRequest.new()
                .with_access_token(access_token)
                .with_user_id(user_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzIgnoreUserGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
func promote_senior_member(
    access_token
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.promote_senior_member(
            Gs2GuildPromoteSeniorMemberRequest.new()
                .with_access_token(access_token)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzLastGuildMasterActivityGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func receive_requests(
) -> Gs2GuildEzListReceiveRequestsIterator:
    return Gs2GuildEzListReceiveRequestsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_receive_requests(
    callback: Callable
) -> int:
    return _domain.subscribe_receive_requests(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GuildEzReceiveMemberRequest.from_model(v)))
    )


func unsubscribe_receive_requests(
    callback_id: int
) -> void:
    _domain.unsubscribe_receive_requests(
        callback_id
    )


func ignore_users(
) -> Gs2GuildEzListIgnoreUsersIterator:
    return Gs2GuildEzListIgnoreUsersIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_ignore_users(
    callback: Callable
) -> int:
    return _domain.subscribe_ignore_users(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GuildEzIgnoreUser.from_model(v)))
    )


func unsubscribe_ignore_users(
    callback_id: int
) -> void:
    _domain.unsubscribe_ignore_users(
        callback_id
    )


func receive_member_request(
    from_user_id
) -> Gs2GuildEzReceiveMemberRequestGameSessionDomain:
    return Gs2GuildEzReceiveMemberRequestGameSessionDomain.new(
        _domain.receive_member_request(
            from_user_id
        ),
        _game_session,
        _connection
    )


func ignore_user(
) -> Gs2GuildEzIgnoreUserGameSessionDomain:
    return Gs2GuildEzIgnoreUserGameSessionDomain.new(
        _domain.ignore_user(
        ),
        _game_session,
        _connection
    )


func last_guild_master_activity(
) -> Gs2GuildEzLastGuildMasterActivityGameSessionDomain:
    return Gs2GuildEzLastGuildMasterActivityGameSessionDomain.new(
        _domain.last_guild_master_activity(
        ),
        _game_session,
        _connection
    )


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2GuildEzGuild.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2GuildEzGuild.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)