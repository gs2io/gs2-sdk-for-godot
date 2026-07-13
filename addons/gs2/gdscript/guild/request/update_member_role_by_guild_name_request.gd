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
class_name Gs2GuildUpdateMemberRoleByGuildNameRequest
extends Gs2Request


var namespace_name = null
var guild_model_name = null
var guild_name = null
var target_user_id = null
var role_name = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    guild_model_name = v
    return self


func with_guild_name(v) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    guild_name = v
    return self


func with_target_user_id(v) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    target_user_id = v
    return self


func with_role_name(v) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    role_name = v
    return self


func with_duplication_avoider(v) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildUpdateMemberRoleByGuildNameRequest:
    if data == null:
        return null
    var ret = Gs2GuildUpdateMemberRoleByGuildNameRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.guild_name = null if data.get("guildName") == null else str(data.get("guildName"))
    ret.target_user_id = null if data.get("targetUserId") == null else str(data.get("targetUserId"))
    ret.role_name = null if data.get("roleName") == null else str(data.get("roleName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildModelName"] = guild_model_name
    ret["guildName"] = guild_name
    ret["targetUserId"] = target_user_id
    ret["roleName"] = role_name
    return ret