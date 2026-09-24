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
class_name Gs2GuildSendMemberRequest
extends RefCounted


var user_id = null
var target_guild_model_name = null
var target_guild_name = null
var metadata = null
var created_at = null


func with_user_id(v) -> Gs2GuildSendMemberRequest:
    user_id = v
    return self


func with_target_guild_model_name(v) -> Gs2GuildSendMemberRequest:
    target_guild_model_name = v
    return self


func with_target_guild_name(v) -> Gs2GuildSendMemberRequest:
    target_guild_name = v
    return self


func with_metadata(v) -> Gs2GuildSendMemberRequest:
    metadata = v
    return self


func with_created_at(v) -> Gs2GuildSendMemberRequest:
    created_at = v
    return self


static func from_dict(data) -> Gs2GuildSendMemberRequest:
    if data == null:
        return null
    var ret = Gs2GuildSendMemberRequest.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_guild_model_name = null if data.get("targetGuildModelName") == null else str(data.get("targetGuildModelName"))
    ret.target_guild_name = null if data.get("targetGuildName") == null else str(data.get("targetGuildName"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["targetGuildModelName"] = target_guild_model_name
    ret["targetGuildName"] = target_guild_name
    ret["metadata"] = metadata
    ret["createdAt"] = created_at
    return ret