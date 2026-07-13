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
class_name Gs2GuildIgnoreUser
extends RefCounted


var user_id = null
var created_at = null


func with_user_id(v) -> Gs2GuildIgnoreUser:
    user_id = v
    return self


func with_created_at(v) -> Gs2GuildIgnoreUser:
    created_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+):ignore:user")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+):ignore:user")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+):ignore:user")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_guild_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+):ignore:user")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("guildModelName")


static func get_guild_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):guild:(?<namespaceName>.+):guild:(?<guildModelName>.+):(?<guildName>.+):ignore:user")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("guildName")


static func from_dict(data) -> Gs2GuildIgnoreUser:
    if data == null:
        return null
    var ret = Gs2GuildIgnoreUser.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["createdAt"] = created_at
    return ret