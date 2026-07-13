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
class_name Gs2MatchmakingEzSeasonGathering
extends RefCounted


var season_gathering_id = null
var season_name = null
var season = 0
var tier = 0
var name = null
var participants = []


func with_season_gathering_id(v) -> Gs2MatchmakingEzSeasonGathering:
    season_gathering_id = v
    return self


func with_season_name(v) -> Gs2MatchmakingEzSeasonGathering:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingEzSeasonGathering:
    season = v
    return self


func with_tier(v) -> Gs2MatchmakingEzSeasonGathering:
    tier = v
    return self


func with_name(v) -> Gs2MatchmakingEzSeasonGathering:
    name = v
    return self


func with_participants(v) -> Gs2MatchmakingEzSeasonGathering:
    participants = v
    return self


func to_model() -> Gs2MatchmakingSeasonGathering:
    var ret = Gs2MatchmakingSeasonGathering.new()
    ret.season_gathering_id = season_gathering_id
    ret.season_name = season_name
    ret.season = season
    ret.tier = tier
    ret.name = name
    ret.participants = null if participants == null else participants.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2MatchmakingEzSeasonGathering:
    var ret = Gs2MatchmakingEzSeasonGathering.new()
    ret.season_gathering_id = model.season_gathering_id
    ret.season_name = model.season_name
    ret.season = 0 if model.season == null else model.season
    ret.tier = 0 if model.tier == null else model.tier
    ret.name = model.name
    ret.participants = [] if model.participants == null else model.participants.map(func(v): return v)
    return ret