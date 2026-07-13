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
class_name Gs2GuildEzGuildModel
extends RefCounted


var name = null
var metadata = null
var default_maximum_member_count = 0
var maximum_member_count = 0
var roles = []
var rejoin_cool_time_minutes = 0


func with_name(v) -> Gs2GuildEzGuildModel:
    name = v
    return self


func with_metadata(v) -> Gs2GuildEzGuildModel:
    metadata = v
    return self


func with_default_maximum_member_count(v) -> Gs2GuildEzGuildModel:
    default_maximum_member_count = v
    return self


func with_maximum_member_count(v) -> Gs2GuildEzGuildModel:
    maximum_member_count = v
    return self


func with_roles(v) -> Gs2GuildEzGuildModel:
    roles = v
    return self


func with_rejoin_cool_time_minutes(v) -> Gs2GuildEzGuildModel:
    rejoin_cool_time_minutes = v
    return self


func to_model() -> Gs2GuildGuildModel:
    var ret = Gs2GuildGuildModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.default_maximum_member_count = default_maximum_member_count
    ret.maximum_member_count = maximum_member_count
    ret.roles = null if roles == null else roles.map(func(v): return null if v == null else v.to_model())
    ret.rejoin_cool_time_minutes = rejoin_cool_time_minutes
    return ret


static func from_model(model) -> Gs2GuildEzGuildModel:
    var ret = Gs2GuildEzGuildModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.default_maximum_member_count = 0 if model.default_maximum_member_count == null else model.default_maximum_member_count
    ret.maximum_member_count = 0 if model.maximum_member_count == null else model.maximum_member_count
    ret.roles = [] if model.roles == null else model.roles.map(func(v): return Gs2GuildEzRoleModel.from_model(v))
    ret.rejoin_cool_time_minutes = 0 if model.rejoin_cool_time_minutes == null else model.rejoin_cool_time_minutes
    return ret