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
class_name Gs2FriendUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2FriendRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2FriendRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func send_request(
    request: Gs2FriendSendRequestRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2FriendSendRequestMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.send_request(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2FriendFriendRequestAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.target_user_id)
    )
    return Gs2AsyncResult.new(domain, null)
func profile(
) -> Gs2FriendProfileAccessTokenDomain:
    return Gs2FriendProfileAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )
func public_profile(
) -> Gs2FriendPublicProfileAccessTokenDomain:
    return Gs2FriendPublicProfileAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )


func black_list_users(
) -> Gs2FriendDescribeBlackListIterator:
    return Gs2FriendDescribeBlackListIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )
func black_list(
) -> Gs2FriendBlackListAccessTokenDomain:
    return Gs2FriendBlackListAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )
func follow(
    with_profile
) -> Gs2FriendFollowAccessTokenDomain:
    return Gs2FriendFollowAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        with_profile
    )


func friends(
    with_profile = null
) -> Gs2FriendDescribeFriendsIterator:
    return Gs2FriendDescribeFriendsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        with_profile
    )


func subscribe_friends(
    callback: Callable,
    with_profile = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FriendFriendUser",
        Gs2FriendFriendUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_friends(
    callback_id: int,
    with_profile = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FriendFriendUser",
        Gs2FriendFriendUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_friends(
    with_profile = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FriendFriendUser",
        Gs2FriendFriendUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null if access_token == null else access_token.time_offset
        )
    )
func friend(
    with_profile
) -> Gs2FriendFriendAccessTokenDomain:
    return Gs2FriendFriendAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        with_profile
    )


func send_requests(
    with_profile = null
) -> Gs2FriendDescribeSendRequestsIterator:
    return Gs2FriendDescribeSendRequestsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        with_profile
    )


func subscribe_send_requests(
    callback: Callable,
    with_profile = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FriendFriendRequest",
        Gs2FriendSendFriendRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_send_requests(
    callback_id: int,
    with_profile = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FriendFriendRequest",
        Gs2FriendSendFriendRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_send_requests(
    with_profile = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FriendFriendRequest",
        Gs2FriendSendFriendRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func send_friend_request(
    target_user_id
) -> Gs2FriendSendFriendRequestAccessTokenDomain:
    return Gs2FriendSendFriendRequestAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        target_user_id
    )


func receive_requests(
    with_profile = null
) -> Gs2FriendDescribeReceiveRequestsIterator:
    return Gs2FriendDescribeReceiveRequestsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        with_profile
    )


func subscribe_receive_requests(
    callback: Callable,
    with_profile = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FriendFriendRequest",
        Gs2FriendReceiveFriendRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_receive_requests(
    callback_id: int,
    with_profile = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FriendFriendRequest",
        Gs2FriendReceiveFriendRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_receive_requests(
    with_profile = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FriendFriendRequest",
        Gs2FriendReceiveFriendRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func receive_friend_request(
    from_user_id
) -> Gs2FriendReceiveFriendRequestAccessTokenDomain:
    return Gs2FriendReceiveFriendRequestAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        from_user_id
    )