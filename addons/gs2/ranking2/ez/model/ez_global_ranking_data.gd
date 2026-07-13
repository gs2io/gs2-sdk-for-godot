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
class_name Gs2Ranking2EzGlobalRankingData
extends RefCounted


var ranking_name = null
var season = 0
var user_id = null
var index = 0
var rank = 0
var score = 0
var metadata = null
var updated_at = 0


func with_ranking_name(v) -> Gs2Ranking2EzGlobalRankingData:
    ranking_name = v
    return self


func with_season(v) -> Gs2Ranking2EzGlobalRankingData:
    season = v
    return self


func with_user_id(v) -> Gs2Ranking2EzGlobalRankingData:
    user_id = v
    return self


func with_index(v) -> Gs2Ranking2EzGlobalRankingData:
    index = v
    return self


func with_rank(v) -> Gs2Ranking2EzGlobalRankingData:
    rank = v
    return self


func with_score(v) -> Gs2Ranking2EzGlobalRankingData:
    score = v
    return self


func with_metadata(v) -> Gs2Ranking2EzGlobalRankingData:
    metadata = v
    return self


func with_updated_at(v) -> Gs2Ranking2EzGlobalRankingData:
    updated_at = v
    return self


func to_model() -> Gs2Ranking2GlobalRankingData:
    var ret = Gs2Ranking2GlobalRankingData.new()
    ret.ranking_name = ranking_name
    ret.season = season
    ret.user_id = user_id
    ret.index = index
    ret.rank = rank
    ret.score = score
    ret.metadata = metadata
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2Ranking2EzGlobalRankingData:
    var ret = Gs2Ranking2EzGlobalRankingData.new()
    ret.ranking_name = model.ranking_name
    ret.season = 0 if model.season == null else model.season
    ret.user_id = model.user_id
    ret.index = 0 if model.index == null else model.index
    ret.rank = 0 if model.rank == null else model.rank
    ret.score = 0 if model.score == null else model.score
    ret.metadata = model.metadata
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret