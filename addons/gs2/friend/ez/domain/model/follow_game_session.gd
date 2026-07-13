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
class_name Gs2FriendEzFollowGameSessionDomain
extends RefCounted


var _domain: Gs2FriendFollowAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var with_profile: Variant:
    get:
        return null if _domain == null else _domain.with_profile


func _init(
    domain: Gs2FriendFollowAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2FriendEzFollowUserGameSessionDomain)
func follow(
    target_user_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.follow(
            Gs2FriendFollowRequest.new()
                .with_target_user_id(target_user_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2FriendEzFollowUserGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func follows(
) -> Gs2FriendEzDescribeFollowUsersIterator:
    return Gs2FriendEzDescribeFollowUsersIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_follows(
    callback: Callable
) -> int:
    return _domain.subscribe_follows(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2FriendEzFollowUser.from_model(v)))
    )


func unsubscribe_follows(
    callback_id: int
) -> void:
    _domain.unsubscribe_follows(
        callback_id
    )


func follow_user(
    target_user_id
) -> Gs2FriendEzFollowUserGameSessionDomain:
    return Gs2FriendEzFollowUserGameSessionDomain.new(
        _domain.follow_user(
            target_user_id
        ),
        _game_session,
        _connection
    )