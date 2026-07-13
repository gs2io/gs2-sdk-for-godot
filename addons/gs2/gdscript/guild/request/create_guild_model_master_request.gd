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
class_name Gs2GuildCreateGuildModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var default_maximum_member_count = null
var maximum_member_count = null
var inactivity_period_days = null
var roles = null
var guild_master_role = null
var guild_member_default_role = null
var rejoin_cool_time_minutes = null
var max_concurrent_join_guilds = null
var max_concurrent_guild_master_count = null


func with_namespace_name(v) -> Gs2GuildCreateGuildModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2GuildCreateGuildModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2GuildCreateGuildModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2GuildCreateGuildModelMasterRequest:
    metadata = v
    return self


func with_default_maximum_member_count(v) -> Gs2GuildCreateGuildModelMasterRequest:
    default_maximum_member_count = v
    return self


func with_maximum_member_count(v) -> Gs2GuildCreateGuildModelMasterRequest:
    maximum_member_count = v
    return self


func with_inactivity_period_days(v) -> Gs2GuildCreateGuildModelMasterRequest:
    inactivity_period_days = v
    return self


func with_roles(v) -> Gs2GuildCreateGuildModelMasterRequest:
    roles = v
    return self


func with_guild_master_role(v) -> Gs2GuildCreateGuildModelMasterRequest:
    guild_master_role = v
    return self


func with_guild_member_default_role(v) -> Gs2GuildCreateGuildModelMasterRequest:
    guild_member_default_role = v
    return self


func with_rejoin_cool_time_minutes(v) -> Gs2GuildCreateGuildModelMasterRequest:
    rejoin_cool_time_minutes = v
    return self


func with_max_concurrent_join_guilds(v) -> Gs2GuildCreateGuildModelMasterRequest:
    max_concurrent_join_guilds = v
    return self


func with_max_concurrent_guild_master_count(v) -> Gs2GuildCreateGuildModelMasterRequest:
    max_concurrent_guild_master_count = v
    return self


static func from_dict(data) -> Gs2GuildCreateGuildModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2GuildCreateGuildModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.default_maximum_member_count = null if data.get("defaultMaximumMemberCount") == null else int(data.get("defaultMaximumMemberCount"))
    ret.maximum_member_count = null if data.get("maximumMemberCount") == null else int(data.get("maximumMemberCount"))
    ret.inactivity_period_days = null if data.get("inactivityPeriodDays") == null else int(data.get("inactivityPeriodDays"))
    ret.roles = null if data.get("roles") == null else data.get("roles").map(func(v): return Gs2GuildRoleModel.from_dict(v))
    ret.guild_master_role = null if data.get("guildMasterRole") == null else str(data.get("guildMasterRole"))
    ret.guild_member_default_role = null if data.get("guildMemberDefaultRole") == null else str(data.get("guildMemberDefaultRole"))
    ret.rejoin_cool_time_minutes = null if data.get("rejoinCoolTimeMinutes") == null else int(data.get("rejoinCoolTimeMinutes"))
    ret.max_concurrent_join_guilds = null if data.get("maxConcurrentJoinGuilds") == null else int(data.get("maxConcurrentJoinGuilds"))
    ret.max_concurrent_guild_master_count = null if data.get("maxConcurrentGuildMasterCount") == null else int(data.get("maxConcurrentGuildMasterCount"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["defaultMaximumMemberCount"] = default_maximum_member_count
    ret["maximumMemberCount"] = maximum_member_count
    ret["inactivityPeriodDays"] = inactivity_period_days
    ret["roles"] = null if roles == null else roles.map(func(v): return null if v == null else v.to_dict())
    ret["guildMasterRole"] = guild_master_role
    ret["guildMemberDefaultRole"] = guild_member_default_role
    ret["rejoinCoolTimeMinutes"] = rejoin_cool_time_minutes
    ret["maxConcurrentJoinGuilds"] = max_concurrent_join_guilds
    ret["maxConcurrentGuildMasterCount"] = max_concurrent_guild_master_count
    return ret