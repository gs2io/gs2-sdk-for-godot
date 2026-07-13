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
class_name Gs2GuildDescribeJoinedGuildsRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var guild_model_name = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2GuildDescribeJoinedGuildsRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2GuildDescribeJoinedGuildsRequest:
    access_token = v
    return self


func with_guild_model_name(v) -> Gs2GuildDescribeJoinedGuildsRequest:
    guild_model_name = v
    return self


func with_page_token(v) -> Gs2GuildDescribeJoinedGuildsRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2GuildDescribeJoinedGuildsRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2GuildDescribeJoinedGuildsRequest:
    if data == null:
        return null
    var ret = Gs2GuildDescribeJoinedGuildsRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.guild_model_name = null if data.get("guildModelName") == null else str(data.get("guildModelName"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["guildModelName"] = guild_model_name
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret