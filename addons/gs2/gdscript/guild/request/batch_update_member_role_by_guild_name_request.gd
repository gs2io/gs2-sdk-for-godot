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
class_name Gs2GuildBatchUpdateMemberRoleByGuildNameRequest
extends Gs2Request


var namespace_name = null
var guild_model_name = null
var guild_name = null
var members = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildBatchUpdateMemberRoleByGuildNameRequest:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildBatchUpdateMemberRoleByGuildNameRequest:
    guild_model_name = v
    return self


func with_guild_name(v) -> Gs2GuildBatchUpdateMemberRoleByGuildNameRequest:
    guild_name = v
    return self


func with_members(v) -> Gs2GuildBatchUpdateMemberRoleByGuildNameRequest:
    members = v
    return self


func with_duplication_avoider(v) -> Gs2GuildBatchUpdateMemberRoleByGuildNameRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildBatchUpdateMemberRoleByGuildNameRequest:
    if data == null:
        return null
    var ret = Gs2GuildBatchUpdateMemberRoleByGuildNameRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.guild_name = null if data.get("guildName") == null else str(data.get("guildName"))
    ret.members = null if data.get("members") == null else data.get("members").map(func(v): return Gs2GuildMember.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildModelName"] = guild_model_name
    ret["guildName"] = guild_name
    ret["members"] = null if members == null else members.map(func(v): return null if v == null else v.to_dict())
    return ret