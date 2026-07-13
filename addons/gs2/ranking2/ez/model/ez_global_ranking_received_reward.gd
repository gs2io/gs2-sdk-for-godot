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
class_name Gs2Ranking2EzGlobalRankingReceivedReward
extends RefCounted


var ranking_name = null
var season = 0
var user_id = null
var received_at = 0


func with_ranking_name(v) -> Gs2Ranking2EzGlobalRankingReceivedReward:
    ranking_name = v
    return self


func with_season(v) -> Gs2Ranking2EzGlobalRankingReceivedReward:
    season = v
    return self


func with_user_id(v) -> Gs2Ranking2EzGlobalRankingReceivedReward:
    user_id = v
    return self


func with_received_at(v) -> Gs2Ranking2EzGlobalRankingReceivedReward:
    received_at = v
    return self


func to_model() -> Gs2Ranking2GlobalRankingReceivedReward:
    var ret = Gs2Ranking2GlobalRankingReceivedReward.new()
    ret.ranking_name = ranking_name
    ret.season = season
    ret.user_id = user_id
    ret.received_at = received_at
    return ret


static func from_model(model) -> Gs2Ranking2EzGlobalRankingReceivedReward:
    var ret = Gs2Ranking2EzGlobalRankingReceivedReward.new()
    ret.ranking_name = model.ranking_name
    ret.season = 0 if model.season == null else model.season
    ret.user_id = model.user_id
    ret.received_at = 0 if model.received_at == null else model.received_at
    return ret