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
class_name Gs2MatchmakingGetJoinedSeasonGatheringRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var season_name = null
var season = null


func with_namespace_name(v) -> Gs2MatchmakingGetJoinedSeasonGatheringRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2MatchmakingGetJoinedSeasonGatheringRequest:
    access_token = v
    return self


func with_season_name(v) -> Gs2MatchmakingGetJoinedSeasonGatheringRequest:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingGetJoinedSeasonGatheringRequest:
    season = v
    return self


static func from_dict(data) -> Gs2MatchmakingGetJoinedSeasonGatheringRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingGetJoinedSeasonGatheringRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["seasonName"] = season_name
    ret["season"] = season
    return ret