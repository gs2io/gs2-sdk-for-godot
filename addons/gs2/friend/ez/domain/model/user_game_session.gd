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
class_name Gs2FriendEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2FriendUserAccessTokenDomain
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


func _init(
    domain: Gs2FriendUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2FriendEzFriendRequestGameSessionDomain)
func send_request(
    target_user_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.send_request(
            Gs2FriendSendRequestRequest.new()
                .with_target_user_id(target_user_id)
        )
    )
    if async_result.error != null:
        return async_result
    return async_result


func friends(
    with_profile = null
) -> Gs2FriendEzDescribeFriendsIterator:
    return Gs2FriendEzDescribeFriendsIterator.new(
        _domain,
        _game_session,
        _connection,
        with_profile
    )


func subscribe_friends(
    callback: Callable,
    with_profile = null
) -> int:
    return _domain.subscribe_friends(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2FriendEzFriendUser.from_model(v))),
        with_profile
    )


func unsubscribe_friends(
    callback_id: int,
    with_profile = null
) -> void:
    _domain.unsubscribe_friends(
        callback_id,
        with_profile
    )


func send_requests(
    with_profile = null
) -> Gs2FriendEzDescribeSendRequestsIterator:
    return Gs2FriendEzDescribeSendRequestsIterator.new(
        _domain,
        _game_session,
        _connection,
        with_profile
    )


func subscribe_send_requests(
    callback: Callable,
    with_profile = null
) -> int:
    return _domain.subscribe_send_requests(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2FriendEzFriendRequest.from_model(v))),
        with_profile
    )


func unsubscribe_send_requests(
    callback_id: int,
    with_profile = null
) -> void:
    _domain.unsubscribe_send_requests(
        callback_id,
        with_profile
    )


func receive_requests(
    with_profile = null
) -> Gs2FriendEzDescribeReceiveRequestsIterator:
    return Gs2FriendEzDescribeReceiveRequestsIterator.new(
        _domain,
        _game_session,
        _connection,
        with_profile
    )


func subscribe_receive_requests(
    callback: Callable,
    with_profile = null
) -> int:
    return _domain.subscribe_receive_requests(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2FriendEzFriendRequest.from_model(v))),
        with_profile
    )


func unsubscribe_receive_requests(
    callback_id: int,
    with_profile = null
) -> void:
    _domain.unsubscribe_receive_requests(
        callback_id,
        with_profile
    )


func profile(
) -> Gs2FriendEzProfileGameSessionDomain:
    return Gs2FriendEzProfileGameSessionDomain.new(
        _domain.profile(
        ),
        _game_session,
        _connection
    )


func black_list(
) -> Gs2FriendEzBlackListGameSessionDomain:
    return Gs2FriendEzBlackListGameSessionDomain.new(
        _domain.black_list(
        ),
        _game_session,
        _connection
    )


# diff +++ start
# Unity EzUserGameSessionDomain.BlackListUsers parity.
func black_list_users(
) -> Gs2FriendEzGetBlackListIterator:
    return Gs2FriendEzGetBlackListIterator.new(
        _domain,
        _game_session,
        _connection
    )
# diff +++ end


func follow(
    with_profile
) -> Gs2FriendEzFollowGameSessionDomain:
    return Gs2FriendEzFollowGameSessionDomain.new(
        _domain.follow(
            with_profile
        ),
        _game_session,
        _connection
    )


func friend(
    with_profile
) -> Gs2FriendEzFriendGameSessionDomain:
    return Gs2FriendEzFriendGameSessionDomain.new(
        _domain.friend(
            with_profile
        ),
        _game_session,
        _connection
    )


func send_friend_request(
    target_user_id
) -> Gs2FriendEzSendFriendRequestGameSessionDomain:
    return Gs2FriendEzSendFriendRequestGameSessionDomain.new(
        _domain.send_friend_request(
            target_user_id
        ),
        _game_session,
        _connection
    )


func receive_friend_request(
    from_user_id
) -> Gs2FriendEzReceiveFriendRequestGameSessionDomain:
    return Gs2FriendEzReceiveFriendRequestGameSessionDomain.new(
        _domain.receive_friend_request(
            from_user_id
        ),
        _game_session,
        _connection
    )
