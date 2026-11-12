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
class_name Gs2Ranking2GlobalRankingSeasonDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var ranking_name: Variant = null
var season: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    ranking_name_,
    season_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    ranking_name = ranking_name_
    season = season_
    user_id = user_id_


func put_global_ranking_score(
    request: Gs2Ranking2PutGlobalRankingScoreByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Ranking2PutGlobalRankingScoreByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.put_global_ranking_score_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2GlobalRankingScoreDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.ranking_name),
        (null if ref == null else ref.season),
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func get_global_ranking(
    request: Gs2Ranking2GetGlobalRankingByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_user_id(user_id)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2GetGlobalRankingByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_global_ranking_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2GlobalRankingDataDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.ranking_name),
        (null if ref == null else ref.season),
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func global_ranking_scores(
    time_offset_token = null
) -> Gs2Ranking2DescribeGlobalRankingScoresByUserIdIterator:
    return Gs2Ranking2DescribeGlobalRankingScoresByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        time_offset_token
    )


func subscribe_global_ranking_scores(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2GlobalRankingScore",
        Gs2Ranking2GlobalRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback
    )


func unsubscribe_global_ranking_scores(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2GlobalRankingScore",
        Gs2Ranking2GlobalRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback_id
    )


func invalidate_global_ranking_scores(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2GlobalRankingScore",
        Gs2Ranking2GlobalRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        )
    )
func global_ranking_score(
) -> Gs2Ranking2GlobalRankingScoreDomain:
    return Gs2Ranking2GlobalRankingScoreDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        season,
        user_id
    )


func global_rankings(
    time_offset_token = null
) -> Gs2Ranking2DescribeGlobalRankingsByUserIdIterator:
    return Gs2Ranking2DescribeGlobalRankingsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        season,
        time_offset_token
    )


func subscribe_global_rankings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2GlobalRankingData",
        Gs2Ranking2GlobalRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_global_rankings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2GlobalRankingData",
        Gs2Ranking2GlobalRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_global_rankings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2GlobalRankingData",
        Gs2Ranking2GlobalRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            null
        )
    )
func global_ranking_data(
    scorer_user_id
) -> Gs2Ranking2GlobalRankingDataDomain:
    return Gs2Ranking2GlobalRankingDataDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        season,
        user_id,
        scorer_user_id
    )


func global_ranking_received_rewards(
    time_offset_token = null
) -> Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdIterator:
    return Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        season,
        time_offset_token
    )


func subscribe_global_ranking_received_rewards(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2GlobalRankingReceivedReward",
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback
    )


func unsubscribe_global_ranking_received_rewards(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2GlobalRankingReceivedReward",
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback_id
    )


func invalidate_global_ranking_received_rewards(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2GlobalRankingReceivedReward",
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        )
    )
func global_ranking_received_reward(
) -> Gs2Ranking2GlobalRankingReceivedRewardDomain:
    return Gs2Ranking2GlobalRankingReceivedRewardDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        season,
        user_id
    )