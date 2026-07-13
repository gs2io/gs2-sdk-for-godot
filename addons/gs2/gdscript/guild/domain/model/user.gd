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
class_name Gs2GuildUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func guild(
    guild_model_name,
    guild_name
) -> Gs2GuildGuildDomain:
    return Gs2GuildGuildDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        guild_name
    )


func search_guilds(
    guild_model_name,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null,
    time_offset_token = null
) -> Gs2GuildSearchGuildsByUserIdIterator:
    return Gs2GuildSearchGuildsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        guild_model_name,
        user_id,
        display_name,
        attributes1,
        attributes2,
        attributes3,
        attributes4,
        attributes5,
        join_policies,
        include_full_members_guild,
        order_by,
        time_offset_token
    )


func create_guild(
    request: Gs2GuildCreateGuildByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GuildCreateGuildByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.create_guild_by_user_id(request)
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


func assume(
    request: Gs2GuildAssumeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GuildAssumeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.assume_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = Gs2Auth.new(_gs2).access_token()
    domain.token = null if result == null else result.token
    domain.user_id = null if result == null else result.user_id
    domain.expire = null if result == null else result.expire
    return Gs2AsyncResult.new(domain, null)


func send_request(
    request: Gs2GuildSendRequestByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GuildSendRequestByUserIdMethodCache.invoke(
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
    var domain = Gs2GuildGuildDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.guild_model_name),
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2GuildDeleteRequestByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2GuildDeleteRequestByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_request_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2GuildSendMemberRequestDomain.new(
        _gs2,
        namespace_name,
        user_id,
        request.guild_model_name,
        request.target_guild_name
    )
    return Gs2AsyncResult.new(domain, null)


func send_requests(
    guild_model_name,
    time_offset_token = null
) -> Gs2GuildDescribeSendRequestsByUserIdIterator:
    return Gs2GuildDescribeSendRequestsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        guild_model_name,
        time_offset_token
    )


func subscribe_send_requests(
    callback: Callable,
    guild_model_name
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildSendMemberRequest",
        Gs2GuildSendMemberRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_send_requests(
    callback_id: int,
    guild_model_name
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildSendMemberRequest",
        Gs2GuildSendMemberRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_send_requests(
    guild_model_name
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildSendMemberRequest",
        Gs2GuildSendMemberRequestCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func send_member_request(
    guild_model_name,
    guild_name
) -> Gs2GuildSendMemberRequestDomain:
    return Gs2GuildSendMemberRequestDomain.new(
        _gs2,
        namespace_name,
        user_id,
        guild_model_name,
        guild_name
    )


func joined_guilds(
    guild_model_name = null,
    time_offset_token = null
) -> Gs2GuildDescribeJoinedGuildsByUserIdIterator:
    return Gs2GuildDescribeJoinedGuildsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        guild_model_name,
        time_offset_token
    )


func subscribe_joined_guilds(
    callback: Callable,
    guild_model_name = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildJoinedGuild",
        Gs2GuildJoinedGuildCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_joined_guilds(
    callback_id: int,
    guild_model_name = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildJoinedGuild",
        Gs2GuildJoinedGuildCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_joined_guilds(
    guild_model_name = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildJoinedGuild",
        Gs2GuildJoinedGuildCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func joined_guild(
    guild_model_name,
    guild_name
) -> Gs2GuildJoinedGuildDomain:
    return Gs2GuildJoinedGuildDomain.new(
        _gs2,
        namespace_name,
        user_id,
        guild_model_name,
        guild_name
    )