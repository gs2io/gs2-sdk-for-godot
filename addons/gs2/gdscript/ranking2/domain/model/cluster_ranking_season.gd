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
class_name Gs2Ranking2ClusterRankingSeasonDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var ranking_name: Variant = null
var cluster_name: Variant = null
var season: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    ranking_name_,
    cluster_name_,
    season_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    ranking_name = ranking_name_
    cluster_name = cluster_name_
    season = season_
    user_id = user_id_


func get_cluster_ranking(
    request: Gs2Ranking2GetClusterRankingByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_cluster_name(cluster_name)
    request = request.with_user_id(user_id)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2GetClusterRankingByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_cluster_ranking_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2ClusterRankingDataDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.ranking_name),
        (null if ref == null else ref.cluster_name),
        (null if ref == null else ref.season),
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func put_cluster_ranking_score(
    request: Gs2Ranking2PutClusterRankingScoreByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_cluster_name(cluster_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Ranking2PutClusterRankingScoreByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.put_cluster_ranking_score_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2ClusterRankingScoreDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.ranking_name),
        (null if ref == null else ref.cluster_name),
        (null if ref == null else ref.season),
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func cluster_rankings(
    time_offset_token = null
) -> Gs2Ranking2DescribeClusterRankingsByUserIdIterator:
    return Gs2Ranking2DescribeClusterRankingsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        cluster_name,
        season,
        time_offset_token
    )


func subscribe_cluster_rankings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2ClusterRankingData",
        Gs2Ranking2ClusterRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            cluster_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_cluster_rankings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2ClusterRankingData",
        Gs2Ranking2ClusterRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            cluster_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_cluster_rankings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2ClusterRankingData",
        Gs2Ranking2ClusterRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            cluster_name,
            season,
            null
        )
    )
func cluster_ranking_data(
    scorer_user_id
) -> Gs2Ranking2ClusterRankingDataDomain:
    return Gs2Ranking2ClusterRankingDataDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        cluster_name,
        season,
        user_id,
        scorer_user_id
    )


func cluster_ranking_received_rewards(
    time_offset_token = null
) -> Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdIterator:
    return Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        cluster_name,
        season,
        time_offset_token
    )


func subscribe_cluster_ranking_received_rewards(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2ClusterRankingReceivedReward",
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback
    )


func unsubscribe_cluster_ranking_received_rewards(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2ClusterRankingReceivedReward",
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback_id
    )


func invalidate_cluster_ranking_received_rewards(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2ClusterRankingReceivedReward",
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        )
    )
func cluster_ranking_received_reward(
) -> Gs2Ranking2ClusterRankingReceivedRewardDomain:
    return Gs2Ranking2ClusterRankingReceivedRewardDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        cluster_name,
        season,
        user_id
    )


func cluster_ranking_scores(
    time_offset_token = null
) -> Gs2Ranking2DescribeClusterRankingScoresByUserIdIterator:
    return Gs2Ranking2DescribeClusterRankingScoresByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        cluster_name,
        season,
        time_offset_token
    )


func subscribe_cluster_ranking_scores(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2ClusterRankingScore",
        Gs2Ranking2ClusterRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback
    )


func unsubscribe_cluster_ranking_scores(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2ClusterRankingScore",
        Gs2Ranking2ClusterRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback_id
    )


func invalidate_cluster_ranking_scores(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2ClusterRankingScore",
        Gs2Ranking2ClusterRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        )
    )
func cluster_ranking_score(
) -> Gs2Ranking2ClusterRankingScoreDomain:
    return Gs2Ranking2ClusterRankingScoreDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        cluster_name,
        season,
        user_id
    )