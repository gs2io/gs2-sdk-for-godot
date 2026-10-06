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
class_name Gs2Ranking2ErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "ReceiveGlobalRankingReceivedReward", "ReceiveGlobalRankingReceivedRewardByUserId", "ReceiveClusterRankingReceivedReward", "ReceiveClusterRankingReceivedRewardByUserId":
            if error.has_error_code("ranking2.rankingReward.inSchedule"):
                return Gs2Ranking2SeasonNotEndedException.new(error)
            elif error.has_error_code("ranking2.rankingReward.alreadyReceived"):
                return Gs2Ranking2RewardAlreadyReceivedException.new(error)
            elif error.has_error_code("ranking2.rankingReward.noRewards"):
                return Gs2Ranking2NoRankingRewardException.new(error)
            elif error.has_error_code("ranking2.rankingReward.outOfSchedule"):
                return Gs2Ranking2SeasonNotStartedException.new(error)
        "PutClusterRankingScore", "PutClusterRankingScoreByUserId":
            if error.has_error_code("ranking2.cluster.notInclude"):
                return Gs2Ranking2NotIncludedInClusterException.new(error)
    return error