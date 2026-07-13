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
class_name Gs2GuildReceiveMemberRequestDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var guild_model_name: Variant = null
var guild_name: Variant = null
var from_user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    guild_model_name_,
    guild_name_,
    from_user_id_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    guild_model_name = guild_model_name_
    guild_name = guild_name_
    from_user_id = from_user_id_


func get_receive_request(
    request: Gs2GuildGetReceiveRequestByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    request = request.with_from_user_id(from_user_id)
    var async_result = await Gs2GuildGetReceiveRequestByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.get_receive_request_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func accept(
    request: Gs2GuildAcceptRequestByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    request = request.with_from_user_id(from_user_id)
    var async_result = await Gs2GuildAcceptRequestByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.accept_request_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func reject(
    request: Gs2GuildRejectRequestByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    request = request.with_from_user_id(from_user_id)
    var async_result = await Gs2GuildRejectRequestByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.reject_request_by_guild_name(request)
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
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2GuildReceiveMemberRequestCache.delete_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        from_user_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
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
            null
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