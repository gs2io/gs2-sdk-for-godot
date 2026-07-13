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
class_name Gs2GuildLeaveNotification
extends RefCounted


var namespace_name = null
var guild_model_name = null
var guild_name = null
var leaved_user_id = null


func with_namespace_name(v) -> Gs2GuildLeaveNotification:
    namespace_name = v
    return self


func with_guild_model_name(v) -> Gs2GuildLeaveNotification:
    guild_model_name = v
    return self


func with_guild_name(v) -> Gs2GuildLeaveNotification:
    guild_name = v
    return self


func with_leaved_user_id(v) -> Gs2GuildLeaveNotification:
    leaved_user_id = v
    return self


static func from_dict(data) -> Gs2GuildLeaveNotification:
    if data == null:
        return null
    var ret = Gs2GuildLeaveNotification.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.guild_name = null if data.get("guildName") == null else str(data.get("guildName"))
    ret.leaved_user_id = null if data.get("leavedUserId") == null else str(data.get("leavedUserId"))
    return ret