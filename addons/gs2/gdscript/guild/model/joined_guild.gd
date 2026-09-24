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
class_name Gs2GuildJoinedGuild
extends RefCounted


var joined_guild_id = null
var guild_model_name = null
var guild_name = null
var user_id = null
var created_at = null
var revision = null


func with_joined_guild_id(v) -> Gs2GuildJoinedGuild:
    joined_guild_id = v
    return self


func with_guild_model_name(v) -> Gs2GuildJoinedGuild:
    guild_model_name = v
    return self


func with_guild_name(v) -> Gs2GuildJoinedGuild:
    guild_name = v
    return self


func with_user_id(v) -> Gs2GuildJoinedGuild:
    user_id = v
    return self


func with_created_at(v) -> Gs2GuildJoinedGuild:
    created_at = v
    return self


func with_revision(v) -> Gs2GuildJoinedGuild:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):user:(?<userId>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):user:(?<userId>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):user:(?<userId>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):user:(?<userId>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_guild_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):user:(?<userId>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("guildModelName")


static func get_guild_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):user:(?<userId>.+):guild:(?<guildModelName>.+):(?<guildName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("guildName")


static func from_dict(data) -> Gs2GuildJoinedGuild:
    if data == null:
        return null
    var ret = Gs2GuildJoinedGuild.new()
    ret.joined_guild_id = null if data.get("joinedGuildId") == null else str(data.get("joinedGuildId"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.guild_name = null if data.get("guildName") == null else str(data.get("guildName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["joinedGuildId"] = joined_guild_id
    ret["guildModelName"] = guild_model_name
    ret["guildName"] = guild_name
    ret["userId"] = user_id
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret