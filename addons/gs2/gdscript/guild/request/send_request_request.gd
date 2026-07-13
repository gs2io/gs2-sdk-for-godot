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
class_name Gs2GuildSendRequestRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var guild_model_name = null
var target_guild_name = null
var metadata = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GuildSendRequestRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2GuildSendRequestRequest:
    access_token = v
    return self


func with_guild_model_name(v) -> Gs2GuildSendRequestRequest:
    guild_model_name = v
    return self


func with_target_guild_name(v) -> Gs2GuildSendRequestRequest:
    target_guild_name = v
    return self


func with_metadata(v) -> Gs2GuildSendRequestRequest:
    metadata = v
    return self


func with_duplication_avoider(v) -> Gs2GuildSendRequestRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GuildSendRequestRequest:
    if data == null:
        return null
    var ret = Gs2GuildSendRequestRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.target_guild_name = null if data.get("targetGuildName") == null else str(data.get("targetGuildName"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["guildModelName"] = guild_model_name
    ret["targetGuildName"] = target_guild_name
    ret["metadata"] = metadata
    return ret