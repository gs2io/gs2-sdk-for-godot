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
class_name Gs2GuildJoinedGuildDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var guild_model_name: Variant = null
var guild_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    guild_model_name_,
    guild_name_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    guild_model_name = guild_model_name_
    guild_name = guild_name_


func get_(
    request: Gs2GuildGetJoinedGuildByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildGetJoinedGuildByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_joined_guild_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update_member_metadata(
    request: Gs2GuildUpdateMemberMetadataByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GuildUpdateMemberMetadataByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.update_member_metadata_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2GuildGuildDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.guild_model_name),
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func withdrawal(
    request: Gs2GuildWithdrawalByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildWithdrawalByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.withdrawal_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2GuildJoinedGuildCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        guild_model_name,
        guild_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GuildJoinedGuildCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        guild_model_name,
        guild_name,
        null,
        func():
            var get_result = await get_(Gs2GuildGetJoinedGuildByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2GuildJoinedGuildCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        guild_model_name,
        guild_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GuildJoinedGuild",
        Gs2GuildJoinedGuildCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2GuildJoinedGuildCache.cache_key(
            guild_model_name,
            guild_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GuildJoinedGuild",
        Gs2GuildJoinedGuildCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2GuildJoinedGuildCache.cache_key(
            guild_model_name,
            guild_name
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