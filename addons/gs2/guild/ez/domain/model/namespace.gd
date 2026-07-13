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
class_name Gs2GuildEzNamespaceDomain
extends RefCounted


var _domain: Gs2GuildNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var url: Variant:
    get:
        return _domain.url
var upload_token: Variant:
    get:
        return _domain.upload_token
var upload_url: Variant:
    get:
        return _domain.upload_url
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2GuildNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func guild_models(
) -> Gs2GuildEzListGuildModelsIterator:
    return Gs2GuildEzListGuildModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_guild_models(
    callback: Callable
) -> int:
    return _domain.subscribe_guild_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2GuildEzGuildModel.from_model(v)))
    )


func unsubscribe_guild_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_guild_models(
        callback_id
    )


func guild_model(
    guild_model_name
) -> Gs2GuildEzGuildModelDomain:
    return Gs2GuildEzGuildModelDomain.new(
        _domain.guild_model(
            guild_model_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2GuildEzUserDomain:
    return Gs2GuildEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2GuildEzUserGameSessionDomain:
    return Gs2GuildEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )


func guild(
    guild_model_name,
    guild_name
) -> Gs2GuildEzGuildDomain:
    return Gs2GuildEzGuildDomain.new(
        _domain.guild(
            guild_model_name,
            guild_name
        ),
        _connection
    )


# diff +++ start
# Unity EzNamespaceDomainExt.GuildGameSession parity.
func guild_game_session(
    guild_model_name,
    guild_game_session
) -> Gs2GuildEzGuildGameSessionDomain:
    return Gs2GuildEzGuildGameSessionDomain.new(
        _domain.guild_access_token(
            guild_model_name,
            guild_game_session.access_token
        ),
        guild_game_session,
        _connection
    )
# diff +++ end
