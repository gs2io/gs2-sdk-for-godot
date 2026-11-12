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
class_name Gs2GuildGuildAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var guild_model_name: Variant = null
var access_token: Gs2AuthAccessToken
var guild_name: Variant:
    get:
        return null if access_token == null else access_token.user_id


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    guild_model_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    guild_model_name = guild_model_name_
    access_token = access_token_


func get_(
    request: Gs2GuildGetGuildRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildGetGuildMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_guild(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2GuildUpdateGuildRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_guild_model_name(guild_model_name)
    var async_result = await Gs2GuildUpdateGuildMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.update_guild(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_member(
    request: Gs2GuildDeleteMemberRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildDeleteMemberMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_member(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func update_member_role(
    request: Gs2GuildUpdateMemberRoleRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildUpdateMemberRoleMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.update_member_role(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func batch_update_member_role(
    request: Gs2GuildBatchUpdateMemberRoleRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildBatchUpdateMemberRoleMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.batch_update_member_role(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2GuildDeleteGuildRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildDeleteGuildMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.delete_guild(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_include_member(
    request: Gs2GuildVerifyIncludeMemberRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildVerifyIncludeMemberMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_include_member(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func add_ignore_user(
    request: Gs2GuildAddIgnoreUserRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildAddIgnoreUserMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.add_ignore_user(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2GuildIgnoreUserAccessTokenDomain.new(
        _gs2,
        request.namespace_name,
        request.guild_model_name,
        access_token
    )
    return Gs2AsyncResult.new(domain, null)


func promote_senior_member(
    request: Gs2GuildPromoteSeniorMemberRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2GuildPromoteSeniorMemberMethodCache.invoke(
        _gs2.cache,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.promote_senior_member(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2GuildLastGuildMasterActivityAccessTokenDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        access_token
    )
    return Gs2AsyncResult.new(domain, null)


func receive_requests(
) -> Gs2GuildDescribeReceiveRequestsIterator:
    return Gs2GuildDescribeReceiveRequestsIterator.new(
        _gs2,
        _client,
        namespace_name,
        guild_model_name,
        access_token
    )


func subscribe_receive_requests(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_receive_requests(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_receive_requests(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null if access_token == null else access_token.time_offset
        )
    )
func receive_member_request(
    from_user_id
) -> Gs2GuildReceiveMemberRequestAccessTokenDomain:
    return Gs2GuildReceiveMemberRequestAccessTokenDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        access_token,
        from_user_id
    )


func ignore_users(
) -> Gs2GuildDescribeIgnoreUsersIterator:
    return Gs2GuildDescribeIgnoreUsersIterator.new(
        _gs2,
        _client,
        namespace_name,
        guild_model_name,
        access_token
    )


func subscribe_ignore_users(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildIgnoreUser",
        Gs2GuildIgnoreUserCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_ignore_users(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildIgnoreUser",
        Gs2GuildIgnoreUserCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_ignore_users(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildIgnoreUser",
        Gs2GuildIgnoreUserCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null if access_token == null else access_token.time_offset
        )
    )
func ignore_user(
) -> Gs2GuildIgnoreUserAccessTokenDomain:
    return Gs2GuildIgnoreUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        access_token
    )
func last_guild_master_activity(
) -> Gs2GuildLastGuildMasterActivityAccessTokenDomain:
    return Gs2GuildLastGuildMasterActivityAccessTokenDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        access_token
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2GuildGuildCache.get_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GuildGuildCache.fetch(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2GuildGetGuildRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2GuildGuildCache.delete_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GuildGuildCache.cache_key(
            guild_model_name,
            guild_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2GuildGuildCache.cache_key(
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