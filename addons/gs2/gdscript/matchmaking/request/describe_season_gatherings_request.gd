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
class_name Gs2MatchmakingDescribeSeasonGatheringsRequest
extends Gs2Request


var namespace_name = null
var season_name = null
var season = null
var tier = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    namespace_name = v
    return self


func with_season_name(v) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    season = v
    return self


func with_tier(v) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    tier = v
    return self


func with_page_token(v) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2MatchmakingDescribeSeasonGatheringsRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingDescribeSeasonGatheringsRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.tier = null if data.get("tier") == null else int(data.get("tier"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["seasonName"] = season_name
    ret["season"] = season
    ret["tier"] = tier
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret