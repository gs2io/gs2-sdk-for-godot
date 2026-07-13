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
class_name Gs2GuildSearchGuildsByUserIdRequest
extends Gs2Request


var namespace_name = null
var guild_model_name = null
var user_id = null
var display_name = null
var attributes1 = null
var attributes2 = null
var attributes3 = null
var attributes4 = null
var attributes5 = null
var join_policies = null
var include_full_members_guild = null
var order_by = null
var page_token = null
var limit = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    guild_model_name = v
    return self


func with_user_id(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    user_id = v
    return self


func with_display_name(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    display_name = v
    return self


func with_attributes1(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    attributes1 = v
    return self


func with_attributes2(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    attributes2 = v
    return self


func with_attributes3(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    attributes3 = v
    return self


func with_attributes4(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    attributes4 = v
    return self


func with_attributes5(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    attributes5 = v
    return self


func with_join_policies(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    join_policies = v
    return self


func with_include_full_members_guild(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    include_full_members_guild = v
    return self


func with_order_by(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    order_by = v
    return self


func with_page_token(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    limit = v
    return self


func with_time_offset_token(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2GuildSearchGuildsByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildSearchGuildsByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2GuildSearchGuildsByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.display_name = null if data.get("displayName") == null else str(data.get("displayName"))
    ret.attributes1 = null if data.get("attributes1") == null else data.get("attributes1").map(func(v): return int(v))
    ret.attributes2 = null if data.get("attributes2") == null else data.get("attributes2").map(func(v): return int(v))
    ret.attributes3 = null if data.get("attributes3") == null else data.get("attributes3").map(func(v): return int(v))
    ret.attributes4 = null if data.get("attributes4") == null else data.get("attributes4").map(func(v): return int(v))
    ret.attributes5 = null if data.get("attributes5") == null else data.get("attributes5").map(func(v): return int(v))
    ret.join_policies = null if data.get("joinPolicies") == null else data.get("joinPolicies").map(func(v): return str(v))
    ret.include_full_members_guild = null if data.get("includeFullMembersGuild") == null else bool(data.get("includeFullMembersGuild"))
    ret.order_by = null if data.get("orderBy") == null else str(data.get("orderBy"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildModelName"] = guild_model_name
    ret["userId"] = user_id
    ret["displayName"] = display_name
    ret["attributes1"] = attributes1
    ret["attributes2"] = attributes2
    ret["attributes3"] = attributes3
    ret["attributes4"] = attributes4
    ret["attributes5"] = attributes5
    ret["joinPolicies"] = join_policies
    ret["includeFullMembersGuild"] = include_full_members_guild
    ret["orderBy"] = order_by
    ret["pageToken"] = page_token
    ret["limit"] = limit
    ret["timeOffsetToken"] = time_offset_token
    return ret