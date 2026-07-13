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
class_name Gs2GuildEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2GuildUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2GuildUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2GuildEzGuildGameSessionDomain)  # diff ---
# 戻り値: Gs2AsyncResult (result = Gs2GuildEzGuildDomain)  # diff +++
func create_guild(
    guild_model_name,
    display_name,
    join_policy,
    attribute1 = null,
    attribute2 = null,
    attribute3 = null,
    attribute4 = null,
    attribute5 = null,
    metadata = null,
    member_metadata = null,
    custom_roles = null,
    guild_member_default_role = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.create_guild(
            Gs2GuildCreateGuildRequest.new()
                .with_guild_model_name(guild_model_name)
                .with_display_name(display_name)
                .with_attribute1(attribute1)
                .with_attribute2(attribute2)
                .with_attribute3(attribute3)
                .with_attribute4(attribute4)
                .with_attribute5(attribute5)
                .with_metadata(metadata)
                .with_member_metadata(member_metadata)
                .with_join_policy(join_policy)
                .with_custom_roles(null if custom_roles == null else custom_roles.map(func(v): return null if v == null else v.to_model()))
                .with_guild_member_default_role(guild_member_default_role)
        )
    )
    if async_result.error != null:
        return async_result
    # diff --- start
    # return Gs2AsyncResult.new(Gs2GuildEzGuildGameSessionDomain.new(
    #     async_result.result,
    #     _game_session,
    #     _connection
    # ), null)
    # diff --- end
    # diff +++ start
    return Gs2AsyncResult.new(Gs2GuildEzGuildDomain.new(
        async_result.result,
        _connection
    ), null)
    # diff +++ end
# diff --- start
# # 戻り値: Gs2AsyncResult (result = Gs2GuildEzUserGameSessionDomain)
# func assume(
#     guild_model_name,
#     guild_name = null
# ) -> Gs2AsyncResult:
#     var async_result = await _connection.run(
#         _game_session,
#         func(): return await _domain.assume(
#             Gs2GuildAssumeRequest.new()
#                 .with_guild_model_name(guild_model_name)
#                 .with_guild_name(guild_name)
#         )
#     )
#     if async_result.error != null:
#         return async_result
#     return Gs2AsyncResult.new(Gs2GuildEzUserGameSessionDomain.new(
#         async_result.result,
#         _game_session,
#         _connection
#     ), null)
# diff --- end
# diff +++ start
# Unity EzUserGameSessionDomainExt.Assume parity.
# 戻り値: Gs2AsyncResult (result = GuildGameSession)
func assume(
    gateway_namespace_name,
    allow_concurrent_access,
    guild_model_name,
    guild_name = null
) -> Gs2AsyncResult:
    var game_session = GuildGameSession.new(
        Gs2GuildGuildAuthenticator.new(
            namespace_name,
            guild_model_name,
            gateway_namespace_name,
            allow_concurrent_access
        ),
        _connection,
        _game_session,
        guild_name
    )
    var refresh_result = await game_session.refresh()
    if refresh_result.error != null:
        return refresh_result
    return Gs2AsyncResult.new(game_session, null)
# diff +++ end
# 戻り値: Gs2AsyncResult (result = Gs2GuildEzGuildGameSessionDomain)
func send_request(
    guild_model_name,
    target_guild_name,
    metadata = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.send_request(
            Gs2GuildSendRequestRequest.new()
                .with_guild_model_name(guild_model_name)
                .with_target_guild_name(target_guild_name)
                .with_metadata(metadata)
        )
    )
    if async_result.error != null:
        return async_result
    # diff --- start
    # return Gs2AsyncResult.new(Gs2GuildEzGuildGameSessionDomain.new(
    #     async_result.result,
    #     _game_session,
    #     _connection
    # ), null)
    # diff --- end
    # diff +++ start
    return Gs2AsyncResult.new(Gs2GuildEzGuildDomain.new(
        async_result.result,
        _connection
    ), null)
    # diff +++ end
# 戻り値: Gs2AsyncResult (result = Gs2GuildEzSendMemberRequestGameSessionDomain)
func cancel_request(
    guild_model_name,
    target_guild_name
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.delete(
            Gs2GuildDeleteRequestRequest.new()
                .with_guild_model_name(guild_model_name)
                .with_target_guild_name(target_guild_name)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzSendMemberRequestGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


# diff +++ start
func search_guilds(
    guild_model_name,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> Gs2GuildEzListGuildsIterator:
    return Gs2GuildEzListGuildsIterator.new(
        _domain,
        _game_session,
        _connection,
        guild_model_name,
        display_name,
        attributes1,
        attributes2,
        attributes3,
        attributes4,
        attributes5,
        join_policies,
        include_full_members_guild,
        order_by
    )
# diff +++ end


func send_requests(
    guild_model_name
) -> Gs2GuildEzListSendRequestsIterator:
    return Gs2GuildEzListSendRequestsIterator.new(
        _domain,
        _game_session,
        _connection,
        guild_model_name
    )


func subscribe_send_requests(
    callback: Callable,
    guild_model_name
) -> int:
    return _domain.subscribe_send_requests(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GuildEzSendMemberRequest.from_model(v))),
        guild_model_name
    )


func unsubscribe_send_requests(
    callback_id: int,
    guild_model_name
) -> void:
    _domain.unsubscribe_send_requests(
        callback_id,
        guild_model_name
    )


func joined_guilds(
    guild_model_name = null
) -> Gs2GuildEzListJoinedGuildsIterator:
    return Gs2GuildEzListJoinedGuildsIterator.new(
        _domain,
        _game_session,
        _connection,
        guild_model_name
    )


func subscribe_joined_guilds(
    callback: Callable,
    guild_model_name = null
) -> int:
    return _domain.subscribe_joined_guilds(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GuildEzJoinedGuild.from_model(v))),
        guild_model_name
    )


func unsubscribe_joined_guilds(
    callback_id: int,
    guild_model_name = null
) -> void:
    _domain.unsubscribe_joined_guilds(
        callback_id,
        guild_model_name
    )


func send_member_request(
    guild_model_name,
    guild_name
) -> Gs2GuildEzSendMemberRequestGameSessionDomain:
    return Gs2GuildEzSendMemberRequestGameSessionDomain.new(
        _domain.send_member_request(
            guild_model_name,
            guild_name
        ),
        _game_session,
        _connection
    )


func joined_guild(
    guild_model_name,
    guild_name
) -> Gs2GuildEzJoinedGuildGameSessionDomain:
    return Gs2GuildEzJoinedGuildGameSessionDomain.new(
        _domain.joined_guild(
            guild_model_name,
            guild_name
        ),
        _game_session,
        _connection
    )
