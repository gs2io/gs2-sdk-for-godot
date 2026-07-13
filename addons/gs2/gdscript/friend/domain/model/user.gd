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
class_name Gs2FriendUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2FriendRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2FriendRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func send_request(
    request: Gs2FriendSendRequestByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2FriendSendRequestByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.send_request_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2FriendFriendRequestDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.target_user_id)
    )
    return Gs2AsyncResult.new(domain, null)
func profile(
) -> Gs2FriendProfileDomain:
    return Gs2FriendProfileDomain.new(
        _gs2,
        namespace_name,
        user_id
    )
func public_profile(
) -> Gs2FriendPublicProfileDomain:
    return Gs2FriendPublicProfileDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func black_list_users(
    time_offset_token = null
) -> Gs2FriendDescribeBlackListByUserIdIterator:
    return Gs2FriendDescribeBlackListByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )
func black_list(
) -> Gs2FriendBlackListDomain:
    return Gs2FriendBlackListDomain.new(
        _gs2,
        namespace_name,
        user_id
    )
func follow(
    with_profile
) -> Gs2FriendFollowDomain:
    return Gs2FriendFollowDomain.new(
        _gs2,
        namespace_name,
        user_id,
        with_profile
    )


func friends(
    with_profile = null,
    time_offset_token = null
) -> Gs2FriendDescribeFriendsByUserIdIterator:
    return Gs2FriendDescribeFriendsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        with_profile,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func friend(
    with_profile
) -> Gs2FriendFriendDomain:
    return Gs2FriendFriendDomain.new(
        _gs2,
        namespace_name,
        user_id,
        with_profile
    )


func send_requests(
    with_profile = null,
    time_offset_token = null
) -> Gs2FriendDescribeSendRequestsByUserIdIterator:
    return Gs2FriendDescribeSendRequestsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        with_profile,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func send_friend_request(
    target_user_id
) -> Gs2FriendSendFriendRequestDomain:
    return Gs2FriendSendFriendRequestDomain.new(
        _gs2,
        namespace_name,
        user_id,
        target_user_id
    )


func receive_requests(
    with_profile = null,
    time_offset_token = null
) -> Gs2FriendDescribeReceiveRequestsByUserIdIterator:
    return Gs2FriendDescribeReceiveRequestsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        with_profile,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func receive_friend_request(
    from_user_id
) -> Gs2FriendReceiveFriendRequestDomain:
    return Gs2FriendReceiveFriendRequestDomain.new(
        _gs2,
        namespace_name,
        user_id,
        from_user_id
    )