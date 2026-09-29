
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
class_name Gs2GuildSearchGuildsByUserIdIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2GuildRestClient
var namespace_name: Variant = null
var guild_model_name: Variant = null
var user_id: Variant = null
var display_name: Variant = null
var attributes1: Variant = null
var attributes2: Variant = null
var attributes3: Variant = null
var attributes4: Variant = null
var attributes5: Variant = null
var join_policies: Variant = null
var include_full_members_guild: Variant = null
var order_by: Variant = null
var time_offset_token: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    guild_model_name_,
    user_id_,
    display_name_ = null,
    attributes1_ = null,
    attributes2_ = null,
    attributes3_ = null,
    attributes4_ = null,
    attributes5_ = null,
    join_policies_ = null,
    include_full_members_guild_ = null,
    order_by_ = null,
    time_offset_token_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    guild_model_name = guild_model_name_
    user_id = user_id_
    display_name = display_name_
    attributes1 = attributes1_
    attributes2 = attributes2_
    attributes3 = attributes3_
    attributes4 = attributes4_
    attributes5 = attributes5_
    join_policies = join_policies_
    include_full_members_guild = include_full_members_guild_
    order_by = order_by_
    time_offset_token = time_offset_token_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2GuildGuild",
        
        Gs2GuildGuildCache.cache_parent_key(
            namespace_name,
            null
        )
    )
    if cached[1]:
        return Gs2AsyncResult.new(cached[0], null)
    while not _last:
        var request = Gs2GuildSearchGuildsByUserIdRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_guild_model_name(guild_model_name)
        request = request.with_user_id(user_id)
        request = request.with_display_name(display_name)
        request = request.with_attributes1(attributes1)
        request = request.with_attributes2(attributes2)
        request = request.with_attributes3(attributes3)
        request = request.with_attributes4(attributes4)
        request = request.with_attributes5(attributes5)
        request = request.with_join_policies(join_policies)
        request = request.with_include_full_members_guild(include_full_members_guild)
        request = request.with_order_by(order_by)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.search_guilds_by_user_id(request)
        if r.error != null:
            return r
        result.append_array(r.result.items if r.result.items != null else [])
        _page_token = r.result.next_page_token
        _last = _page_token == null
        Gs2GuildSearchGuildsByUserIdMethodCache.put_cache(
            r.result,
            _gs2.cache,
            user_id,
            null,
            request
        )
    return Gs2AsyncResult.new(result, null)