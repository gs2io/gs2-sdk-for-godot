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
class_name Gs2GuildUpdateGuildByGuildNameRequest
extends Gs2Request


var namespace_name = null
var guild_name = null
var guild_model_name = null
var display_name = null
var attribute1 = null
var attribute2 = null
var attribute3 = null
var attribute4 = null
var attribute5 = null
var metadata = null
var join_policy = null
var custom_roles = null
var guild_member_default_role = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    namespace_name = v
    return self


func with_guild_name(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    guild_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    guild_model_name = v
    return self


func with_display_name(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    display_name = v
    return self


func with_attribute1(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    attribute1 = v
    return self


func with_attribute2(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    attribute2 = v
    return self


func with_attribute3(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    attribute3 = v
    return self


func with_attribute4(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    attribute4 = v
    return self


func with_attribute5(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    attribute5 = v
    return self


func with_metadata(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    metadata = v
    return self


func with_join_policy(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    join_policy = v
    return self


func with_custom_roles(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    custom_roles = v
    return self


func with_guild_member_default_role(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    guild_member_default_role = v
    return self


func with_duplication_avoider(v) -> Gs2GuildUpdateGuildByGuildNameRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildUpdateGuildByGuildNameRequest:
    if data == null:
        return null
    var ret = Gs2GuildUpdateGuildByGuildNameRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_name = null if data.get("guildName") == null else str(data.get("guildName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.display_name = null if data.get("displayName") == null else str(data.get("displayName"))
    ret.attribute1 = null if data.get("attribute1") == null else int(data.get("attribute1"))
    ret.attribute2 = null if data.get("attribute2") == null else int(data.get("attribute2"))
    ret.attribute3 = null if data.get("attribute3") == null else int(data.get("attribute3"))
    ret.attribute4 = null if data.get("attribute4") == null else int(data.get("attribute4"))
    ret.attribute5 = null if data.get("attribute5") == null else int(data.get("attribute5"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.join_policy = null if data.get("joinPolicy") == null else str(data.get("joinPolicy"))
    ret.custom_roles = null if data.get("customRoles") == null else data.get("customRoles").map(func(v): return Gs2GuildRoleModel.from_dict(v))
    ret.guild_member_default_role = null if data.get("guildMemberDefaultRole") == null else str(data.get("guildMemberDefaultRole"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildName"] = guild_name
    ret["guildModelName"] = guild_model_name
    ret["displayName"] = display_name
    ret["attribute1"] = attribute1
    ret["attribute2"] = attribute2
    ret["attribute3"] = attribute3
    ret["attribute4"] = attribute4
    ret["attribute5"] = attribute5
    ret["metadata"] = metadata
    ret["joinPolicy"] = join_policy
    ret["customRoles"] = null if custom_roles == null else custom_roles.map(func(v): return null if v == null else v.to_dict())
    ret["guildMemberDefaultRole"] = guild_member_default_role
    return ret