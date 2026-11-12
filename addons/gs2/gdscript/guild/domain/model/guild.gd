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
class_name Gs2GuildGuildDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var guild_model_name: Variant = null
var guild_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    guild_model_name_,
    guild_name_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    guild_model_name = guild_model_name_
    guild_name = guild_name_


func get_(
    request: Gs2GuildGetGuildRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildGetGuildMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.get_guild(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2GuildUpdateGuildByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_name(guild_name)
    request = request.with_guild_model_name(guild_model_name)
    var async_result = await Gs2GuildUpdateGuildByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.update_guild_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_member(
    request: Gs2GuildDeleteMemberByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildDeleteMemberByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.delete_member_by_guild_name(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func update_member_role(
    request: Gs2GuildUpdateMemberRoleByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildUpdateMemberRoleByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.update_member_role_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func batch_update_member_role(
    request: Gs2GuildBatchUpdateMemberRoleByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildBatchUpdateMemberRoleByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.batch_update_member_role_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2GuildDeleteGuildByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildDeleteGuildByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.delete_guild_by_guild_name(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func increase_maximum_current_maximum_member_count(
    request: Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.increase_maximum_current_maximum_member_count_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func decrease_maximum_current_maximum_member_count(
    request: Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.decrease_maximum_current_maximum_member_count_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_current_maximum_member_count(
    request: Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.verify_current_maximum_member_count_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_include_member(
    request: Gs2GuildVerifyIncludeMemberByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_model_name(guild_model_name)
    request = request.with_guild_name(guild_name)
    var async_result = await Gs2GuildVerifyIncludeMemberByUserIdMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.verify_include_member_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_maximum_current_maximum_member_count(
    request: Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_guild_name(guild_name)
    request = request.with_guild_model_name(guild_model_name)
    var async_result = await Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameMethodCache.invoke(
        _gs2.cache,
        guild_name,
        null,
        request,
        func(): return await _client.set_maximum_current_maximum_member_count_by_guild_name(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func receive_requests_by_guild_name(
) -> Gs2GuildDescribeReceiveRequestsByGuildNameIterator:
    return Gs2GuildDescribeReceiveRequestsByGuildNameIterator.new(
        _gs2,
        _client,
        namespace_name,
        guild_model_name,
        guild_name
    )


func subscribe_receive_requests_by_guild_name(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
        ),
        callback
    )


func unsubscribe_receive_requests_by_guild_name(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
        ),
        callback_id
    )


func invalidate_receive_requests_by_guild_name(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildReceiveMemberRequest",
        Gs2GuildReceiveMemberRequestCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
        )
    )
func receive_member_request(
    from_user_id
) -> Gs2GuildReceiveMemberRequestDomain:
    return Gs2GuildReceiveMemberRequestDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        guild_name,
        from_user_id
    )


func ignore_users_by_guild_name(
) -> Gs2GuildDescribeIgnoreUsersByGuildNameIterator:
    return Gs2GuildDescribeIgnoreUsersByGuildNameIterator.new(
        _gs2,
        _client,
        namespace_name,
        guild_model_name,
        guild_name
    )


func subscribe_ignore_users_by_guild_name(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildIgnoreUser",
        Gs2GuildIgnoreUserCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
        ),
        callback
    )


func unsubscribe_ignore_users_by_guild_name(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildIgnoreUser",
        Gs2GuildIgnoreUserCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
        ),
        callback_id
    )


func invalidate_ignore_users_by_guild_name(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildIgnoreUser",
        Gs2GuildIgnoreUserCache.cache_parent_key(
            namespace_name,
            guild_model_name,
            guild_name,
            null
        )
    )
func ignore_user(
) -> Gs2GuildIgnoreUserDomain:
    return Gs2GuildIgnoreUserDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        guild_name
    )
func last_guild_master_activity(
) -> Gs2GuildLastGuildMasterActivityDomain:
    return Gs2GuildLastGuildMasterActivityDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        guild_name
    )


func model(
    access_token
) -> Gs2AsyncResult:
    var pair = Gs2GuildGuildCache.get_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GuildGuildCache.fetch(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        null,
        func():
            var get_result = await get_(
                Gs2GuildGetGuildRequest.new()
                    .with_access_token(null if access_token == null else access_token.token)
            )
            return get_result
    )


func invalidate() -> void:
    Gs2GuildGuildCache.delete_cache(
        _gs2.cache,
        namespace_name,
        guild_model_name,
        guild_name,
        null
    )


func subscribe_model(access_token, callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2GuildGuildCache.cache_key(
            guild_model_name,
            guild_name
        ),
        callback,
        func(): await model(access_token)
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2GuildGuildCache.cache_key(
            guild_model_name,
            guild_name
        ),
        callback_id
    )


func subscribe_model_with_initial_call(access_token, callback: Callable) -> Gs2AsyncResult:
    var model_result = await model(access_token)
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(access_token, callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)