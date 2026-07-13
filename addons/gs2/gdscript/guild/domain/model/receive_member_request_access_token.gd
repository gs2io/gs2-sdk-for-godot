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
class_name Gs2GuildReceiveMemberRequestAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var guild_model_name: Variant = null
var access_token: Gs2AuthAccessToken
var guild_name: Variant:
    get:
        return null if access_token == null else access_token.user_id
var from_user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    guild_model_name_,
    access_token_,
    from_user_id_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    guild_model_name = guild_model_name_
    access_token = access_token_
    from_user_id = from_user_id_


func get_(
    request: Gs2GuildGetReceiveRequestRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_from_user_id(from_user_id)
    var async_result = await Gs2GuildGetReceiveRequestMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_receive_request(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func accept(
    request: Gs2GuildAcceptRequestRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_from_user_id(from_user_id)
    var async_result = await Gs2GuildAcceptRequestMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.accept_request(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func reject(
    request: Gs2GuildRejectRequestRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_from_user_id(from_user_id)
    var async_result = await Gs2GuildRejectRequestMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.reject_request(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2GuildReceiveMemberRequestCache.get_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        from_user_id,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GuildReceiveMemberRequestCache.fetch(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        from_user_id,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2GuildGetReceiveRequestRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2GuildReceiveMemberRequestCache.delete_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        from_user_id,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GuildReceiveMemberRequestCache.cache_key(
            from_user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GuildReceiveMemberRequestCache.cache_key(
            from_user_id
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