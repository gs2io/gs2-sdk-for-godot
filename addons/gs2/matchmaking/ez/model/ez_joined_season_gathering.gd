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
class_name Gs2MatchmakingEzJoinedSeasonGathering
extends RefCounted


var season_name = null
var season = 0
var tier = 0
var season_gathering_name = null


func with_season_name(v) -> Gs2MatchmakingEzJoinedSeasonGathering:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingEzJoinedSeasonGathering:
    season = v
    return self


func with_tier(v) -> Gs2MatchmakingEzJoinedSeasonGathering:
    tier = v
    return self


func with_season_gathering_name(v) -> Gs2MatchmakingEzJoinedSeasonGathering:
    season_gathering_name = v
    return self


func to_model() -> Gs2MatchmakingJoinedSeasonGathering:
    var ret = Gs2MatchmakingJoinedSeasonGathering.new()
    ret.season_name = season_name
    ret.season = season
    ret.tier = tier
    ret.season_gathering_name = season_gathering_name
    return ret


static func from_model(model) -> Gs2MatchmakingEzJoinedSeasonGathering:
    var ret = Gs2MatchmakingEzJoinedSeasonGathering.new()
    ret.season_name = model.season_name
    ret.season = 0 if model.season == null else model.season
    ret.tier = 0 if model.tier == null else model.tier
    ret.season_gathering_name = model.season_gathering_name
    return ret