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
# deny overwrite
class_name Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdSpeculativeExecutor
extends RefCounted


static func action() -> String:
    return "Gs2Ranking2:CreateClusterRankingReceivedRewardByUserId"


static func execute(
    gs2: Gs2Domain,
    access_token,
    request: Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdRequest
) -> Gs2AsyncResult:
    # diff --- start
    #var model_result = await Gs2Ranking2.new(gs2).namespace_(request.namespace_name).cluster_ranking_model(request.ranking_name).cluster_ranking_season(request.cluster_name, request.season, request.user_id).cluster_ranking_received_reward().model()
    # diff --- end
    # diff +++ start
    var model_result = await Gs2Ranking2.new(gs2).namespace_(request.namespace_name).cluster_ranking_model(request.ranking_name).cluster_ranking_season(request.cluster_name, request.season, access_token).cluster_ranking_received_reward().model()
    # diff +++ end
    if model_result.error != null:
        return model_result
    var item = model_result.result
    if item == null:
        return Gs2AsyncResult.new(null, null)
    item = Gs2Ranking2ClusterRankingReceivedRewardCreateClusterRankingReceivedRewardByUserIdExecutable.speculative_execution(item, request)
    var commit = func():
        Gs2Ranking2ClusterRankingReceivedRewardCache.put_cache(
            item,
            gs2.cache,
            request.namespace_name,
            request.ranking_name,
            request.cluster_name,
            request.season,
            access_token.user_id,
            null if access_token == null else access_token.time_offset
        )
        # diff +++ start
        Gs2Ranking2ClusterRankingReceivedRewardCache.put_cache(
            item,
            gs2.cache,
            request.namespace_name,
            request.ranking_name,
            request.cluster_name,
            null,
            access_token.user_id,
            null if access_token == null else access_token.time_offset
        )
        # diff +++ end
    return Gs2AsyncResult.new(commit, null)