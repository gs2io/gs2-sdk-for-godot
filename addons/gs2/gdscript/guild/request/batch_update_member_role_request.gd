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
class_name Gs2GuildBatchUpdateMemberRoleRequest
extends Gs2Request


var namespace_name = null
var guild_model_name = null
var access_token = null
var members = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildBatchUpdateMemberRoleRequest:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildBatchUpdateMemberRoleRequest:
    guild_model_name = v
    return self


func with_access_token(v) -> Gs2GuildBatchUpdateMemberRoleRequest:
    access_token = v
    return self


func with_members(v) -> Gs2GuildBatchUpdateMemberRoleRequest:
    members = v
    return self


func with_duplication_avoider(v) -> Gs2GuildBatchUpdateMemberRoleRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildBatchUpdateMemberRoleRequest:
    if data == null:
        return null
    var ret = Gs2GuildBatchUpdateMemberRoleRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.members = null if data.get("members") == null else data.get("members").map(func(v): return Gs2GuildMember.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["guildModelName"] = guild_model_name
    ret["accessToken"] = access_token
    ret["members"] = null if members == null else members.map(func(v): return null if v == null else v.to_dict())
    return ret