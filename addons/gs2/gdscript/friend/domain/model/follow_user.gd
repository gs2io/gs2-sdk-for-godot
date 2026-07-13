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
class_name Gs2FriendFollowUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2FriendRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var with_profile: Variant = null
var target_user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    with_profile_,
    target_user_id_
):
    _gs2 = gs2
    _client = Gs2FriendRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    with_profile = with_profile_
    target_user_id = target_user_id_


func get_(
    request: Gs2FriendGetFollowByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_target_user_id(target_user_id)
    request = request.with_with_profile(with_profile)
    var async_result = await Gs2FriendGetFollowByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_follow_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func unfollow(
    request: Gs2FriendUnfollowByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_target_user_id(target_user_id)
    var async_result = await Gs2FriendUnfollowByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.unfollow_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2FriendFollowUserCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        with_profile,
        target_user_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2FriendFollowUserCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        with_profile,
        target_user_id,
        null,
        func():
            var get_result = await get_(Gs2FriendGetFollowByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2FriendFollowUserCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        with_profile,
        target_user_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FriendFollowUser",
        Gs2FriendFollowUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null
        ),
        Gs2FriendFollowUserCache.cache_key(
            target_user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FriendFollowUser",
        Gs2FriendFollowUserCache.cache_parent_key(
            namespace_name,
            user_id,
            with_profile,
            null
        ),
        Gs2FriendFollowUserCache.cache_key(
            target_user_id
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