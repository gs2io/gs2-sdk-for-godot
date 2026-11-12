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
class_name Gs2GuildNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2GuildRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2GuildGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2GuildGetNamespaceStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2GuildGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2GuildGetNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2GuildUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2GuildUpdateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2GuildDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2GuildDeleteNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_namespace(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_guild_model_master(
    request: Gs2GuildCreateGuildModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2GuildCreateGuildModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_guild_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2GuildGuildModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_guild_master(
) -> Gs2GuildCurrentGuildMasterDomain:
    return Gs2GuildCurrentGuildMasterDomain.new(
        _gs2,
        namespace_name
    )


func guild_models(
) -> Gs2GuildDescribeGuildModelsIterator:
    return Gs2GuildDescribeGuildModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_guild_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildGuildModel",
        Gs2GuildGuildModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_guild_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildGuildModel",
        Gs2GuildGuildModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_guild_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildGuildModel",
        Gs2GuildGuildModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func guild_model(
    guild_model_name
) -> Gs2GuildGuildModelDomain:
    return Gs2GuildGuildModelDomain.new(
        _gs2,
        namespace_name,
        guild_model_name
    )


func guild_model_masters(
    name_prefix = null
) -> Gs2GuildDescribeGuildModelMastersIterator:
    return Gs2GuildDescribeGuildModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_guild_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildGuildModelMaster",
        Gs2GuildGuildModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_guild_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildGuildModelMaster",
        Gs2GuildGuildModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_guild_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildGuildModelMaster",
        Gs2GuildGuildModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func guild_model_master(
    guild_model_name
) -> Gs2GuildGuildModelMasterDomain:
    return Gs2GuildGuildModelMasterDomain.new(
        _gs2,
        namespace_name,
        guild_model_name
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
        null,
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


func subscribe_search_guilds(
    callback: Callable,
    guild_model_name,
    user_id,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_search_guilds(
    callback_id: int,
    guild_model_name,
    user_id,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_search_guilds(
    guild_model_name,
    user_id,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func user(
    user_id
) -> Gs2GuildUserDomain:
    return Gs2GuildUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2GuildUserAccessTokenDomain:
    return Gs2GuildUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func search_guilds_by_user_id(
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
        null,
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


func subscribe_search_guilds_by_user_id(
    callback: Callable,
    guild_model_name,
    user_id,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_search_guilds_by_user_id(
    callback_id: int,
    guild_model_name,
    user_id,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_search_guilds_by_user_id(
    guild_model_name,
    user_id,
    display_name = null,
    attributes1 = null,
    attributes2 = null,
    attributes3 = null,
    attributes4 = null,
    attributes5 = null,
    join_policies = null,
    include_full_members_guild = null,
    order_by = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GuildGuild",
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        )
    )
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


func guild_access_token(
    guild_model_name,
    access_token_
) -> Gs2GuildGuildAccessTokenDomain:
    return Gs2GuildGuildAccessTokenDomain.new(
        _gs2,
        namespace_name,
        guild_model_name,
        access_token_
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2GuildNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2GuildNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2GuildGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2GuildNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2GuildNamespace",
        Gs2GuildNamespaceCache.cache_parent_key(
            null
        ),
        Gs2GuildNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2GuildNamespace",
        Gs2GuildNamespaceCache.cache_parent_key(
            null
        ),
        Gs2GuildNamespaceCache.cache_key(
            namespace_name
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