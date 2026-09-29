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
class_name Gs2GuildEzReceiveMemberRequestGameSessionDomain
extends RefCounted


var _domain: Gs2GuildReceiveMemberRequestAccessTokenDomain
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
var from_user_id: Variant:
    get:
        return null if _domain == null else _domain.from_user_id


func _init(
    domain: Gs2GuildReceiveMemberRequestAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# diff --- start
# func accept_request(
#     access_token
# ) -> Gs2AsyncResult:
# diff --- end
# diff +++ start
func accept_request(
) -> Gs2AsyncResult:
# diff +++ end
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.accept(
            Gs2GuildAcceptRequestRequest.new()
                # diff --- start
                # .with_access_token(access_token)
                # diff --- end
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzReceiveMemberRequestGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# diff --- start
# func reject_request(
#     access_token
# ) -> Gs2AsyncResult:
# diff --- end
# diff +++ start
func reject_request(
) -> Gs2AsyncResult:
# diff +++ end
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.reject(
            Gs2GuildRejectRequestRequest.new()
                # diff --- start
                # .with_access_token(access_token)
                # diff --- end
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2GuildEzReceiveMemberRequestGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2GuildEzReceiveMemberRequest.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2GuildEzReceiveMemberRequest.from_model(item))
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
