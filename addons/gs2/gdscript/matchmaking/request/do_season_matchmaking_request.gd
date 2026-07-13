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
class_name Gs2MatchmakingDoSeasonMatchmakingRequest
extends Gs2Request


var namespace_name = null
var season_name = null
var access_token = null
var matchmaking_context_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MatchmakingDoSeasonMatchmakingRequest:
    namespace_name = v
    return self


func with_season_name(v) -> Gs2MatchmakingDoSeasonMatchmakingRequest:
    season_name = v
    return self


func with_access_token(v) -> Gs2MatchmakingDoSeasonMatchmakingRequest:
    access_token = v
    return self


func with_matchmaking_context_token(v) -> Gs2MatchmakingDoSeasonMatchmakingRequest:
    matchmaking_context_token = v
    return self


func with_duplication_avoider(v) -> Gs2MatchmakingDoSeasonMatchmakingRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MatchmakingDoSeasonMatchmakingRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingDoSeasonMatchmakingRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.matchmaking_context_token = null if data.get("matchmakingContextToken") == null else str(data.get("matchmakingContextToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["seasonName"] = season_name
    ret["accessToken"] = access_token
    ret["matchmakingContextToken"] = matchmaking_context_token
    return ret