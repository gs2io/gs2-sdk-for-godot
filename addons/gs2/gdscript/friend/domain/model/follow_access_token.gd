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
class_name Gs2FriendFollowAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2FriendRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var with_profile: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    with_profile_
):
    _gs2 = gs2
    _client = Gs2FriendRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    with_profile = with_profile_


func follow(
    request: Gs2FriendFollowRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2FriendFollowMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.follow(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2FriendFollowUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        with_profile,
        request.target_user_id
    )
    return Gs2AsyncResult.new(domain, null)


func follows(
) -> Gs2FriendDescribeFollowsIterator:
    return Gs2FriendDescribeFollowsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        with_profile
    )


func subscribe_follows(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FriendFollowUser",
        Gs2FriendFollowUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_follows(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FriendFollowUser",
        Gs2FriendFollowUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_follows(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FriendFollowUser",
        Gs2FriendFollowUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null if access_token == null else access_token.time_offset
        )
    )
func follow_user(
    target_user_id
) -> Gs2FriendFollowUserAccessTokenDomain:
    return Gs2FriendFollowUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        with_profile,
        target_user_id
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2FriendFollowCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        with_profile,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2FriendFollowCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        with_profile,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FriendFollow",
        Gs2FriendFollowCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2FriendFollowCache.cache_key(
            with_profile
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FriendFollow",
        Gs2FriendFollowCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2FriendFollowCache.cache_key(
            with_profile
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)