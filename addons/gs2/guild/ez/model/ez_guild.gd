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
class_name Gs2GuildEzGuild
extends RefCounted


var guild_model_name = null
var name = null
var display_name = null
var attribute1 = 0
var attribute2 = 0
var attribute3 = 0
var attribute4 = 0
var attribute5 = 0
var metadata = null
var join_policy = null
var custom_roles = []
var members = []


func with_guild_model_name(v) -> Gs2GuildEzGuild:
    guild_model_name = v
    return self


func with_name(v) -> Gs2GuildEzGuild:
    name = v
    return self


func with_display_name(v) -> Gs2GuildEzGuild:
    display_name = v
    return self


func with_attribute1(v) -> Gs2GuildEzGuild:
    attribute1 = v
    return self


func with_attribute2(v) -> Gs2GuildEzGuild:
    attribute2 = v
    return self


func with_attribute3(v) -> Gs2GuildEzGuild:
    attribute3 = v
    return self


func with_attribute4(v) -> Gs2GuildEzGuild:
    attribute4 = v
    return self


func with_attribute5(v) -> Gs2GuildEzGuild:
    attribute5 = v
    return self


func with_metadata(v) -> Gs2GuildEzGuild:
    metadata = v
    return self


func with_join_policy(v) -> Gs2GuildEzGuild:
    join_policy = v
    return self


func with_custom_roles(v) -> Gs2GuildEzGuild:
    custom_roles = v
    return self


func with_members(v) -> Gs2GuildEzGuild:
    members = v
    return self


func to_model() -> Gs2GuildGuild:
    var ret = Gs2GuildGuild.new()
    ret.guild_model_name = guild_model_name
    ret.name = name
    ret.display_name = display_name
    ret.attribute1 = attribute1
    ret.attribute2 = attribute2
    ret.attribute3 = attribute3
    ret.attribute4 = attribute4
    ret.attribute5 = attribute5
    ret.metadata = metadata
    ret.join_policy = join_policy
    ret.custom_roles = null if custom_roles == null else custom_roles.map(func(v): return null if v == null else v.to_model())
    ret.members = null if members == null else members.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2GuildEzGuild:
    var ret = Gs2GuildEzGuild.new()
    ret.guild_model_name = model.guild_model_name
    ret.name = model.name
    ret.display_name = model.display_name
    ret.attribute1 = 0 if model.attribute1 == null else model.attribute1
    ret.attribute2 = 0 if model.attribute2 == null else model.attribute2
    ret.attribute3 = 0 if model.attribute3 == null else model.attribute3
    ret.attribute4 = 0 if model.attribute4 == null else model.attribute4
    ret.attribute5 = 0 if model.attribute5 == null else model.attribute5
    ret.metadata = model.metadata
    ret.join_policy = model.join_policy
    ret.custom_roles = [] if model.custom_roles == null else model.custom_roles.map(func(v): return Gs2GuildEzRoleModel.from_model(v))
    ret.members = [] if model.members == null else model.members.map(func(v): return Gs2GuildEzMember.from_model(v))
    return ret