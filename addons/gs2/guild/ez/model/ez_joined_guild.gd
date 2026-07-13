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
class_name Gs2GuildEzJoinedGuild
extends RefCounted


var guild_model_name = null
var guild_name = null
var user_id = null
var created_at = 0


func with_guild_model_name(v) -> Gs2GuildEzJoinedGuild:
    guild_model_name = v
    return self


func with_guild_name(v) -> Gs2GuildEzJoinedGuild:
    guild_name = v
    return self


func with_user_id(v) -> Gs2GuildEzJoinedGuild:
    user_id = v
    return self


func with_created_at(v) -> Gs2GuildEzJoinedGuild:
    created_at = v
    return self


func to_model() -> Gs2GuildJoinedGuild:
    var ret = Gs2GuildJoinedGuild.new()
    ret.guild_model_name = guild_model_name
    ret.guild_name = guild_name
    ret.user_id = user_id
    ret.created_at = created_at
    return ret


static func from_model(model) -> Gs2GuildEzJoinedGuild:
    var ret = Gs2GuildEzJoinedGuild.new()
    ret.guild_model_name = model.guild_model_name
    ret.guild_name = model.guild_name
    ret.user_id = model.user_id
    ret.created_at = 0 if model.created_at == null else model.created_at
    return ret