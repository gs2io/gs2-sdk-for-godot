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
class_name Gs2GuildGuild
extends RefCounted


var guild_id = null
var guild_model_name = null
var name = null
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
var current_maximum_member_count = null
var members = null
var created_at = null
var updated_at = null
var revision = null


func with_guild_id(v) -> Gs2GuildGuild:
    guild_id = v
    return self


func with_guild_model_name(v) -> Gs2GuildGuild:
    guild_model_name = v
    return self


func with_name(v) -> Gs2GuildGuild:
    name = v
    return self


func with_display_name(v) -> Gs2GuildGuild:
    display_name = v
    return self


func with_attribute1(v) -> Gs2GuildGuild:
    attribute1 = v
    return self


func with_attribute2(v) -> Gs2GuildGuild:
    attribute2 = v
    return self


func with_attribute3(v) -> Gs2GuildGuild:
    attribute3 = v
    return self


func with_attribute4(v) -> Gs2GuildGuild:
    attribute4 = v
    return self


func with_attribute5(v) -> Gs2GuildGuild:
    attribute5 = v
    return self


func with_metadata(v) -> Gs2GuildGuild:
    metadata = v
    return self


func with_join_policy(v) -> Gs2GuildGuild:
    join_policy = v
    return self


func with_custom_roles(v) -> Gs2GuildGuild:
    custom_roles = v
    return self


func with_guild_member_default_role(v) -> Gs2GuildGuild:
    guild_member_default_role = v
    return self


func with_current_maximum_member_count(v) -> Gs2GuildGuild:
    current_maximum_member_count = v
    return self


func with_members(v) -> Gs2GuildGuild:
    members = v
    return self


func with_created_at(v) -> Gs2GuildGuild:
    created_at = v
    return self


func with_updated_at(v) -> Gs2GuildGuild:
    updated_at = v
    return self


func with_revision(v) -> Gs2GuildGuild:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_guild_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("guildModelName")


static func get_guild_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("guildName")


static func from_dict(data) -> Gs2GuildGuild:
    if data == null:
        return null
    var ret = Gs2GuildGuild.new()
    ret.guild_id = null if data.get("guildId") == null else str(data.get("guildId"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
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
    ret.current_maximum_member_count = null if data.get("currentMaximumMemberCount") == null else int(data.get("currentMaximumMemberCount"))
    ret.members = null if data.get("members") == null else data.get("members").map(func(v): return Gs2GuildMember.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["guildId"] = guild_id
    ret["guildModelName"] = guild_model_name
    ret["name"] = name
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
    ret["currentMaximumMemberCount"] = current_maximum_member_count
    ret["members"] = null if members == null else members.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret