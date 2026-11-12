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
class_name Gs2Ranking2SubscribeRankingSeasonDomain
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


func put_subscribe_ranking_score(
    request: Gs2Ranking2PutSubscribeRankingScoreByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Ranking2PutSubscribeRankingScoreByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.put_subscribe_ranking_score_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2SubscribeRankingScoreDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.ranking_name),
        (null if ref == null else ref.season),
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func subscribe_ranking_scores(
    time_offset_token = null
) -> Gs2Ranking2DescribeSubscribeRankingScoresByUserIdIterator:
    return Gs2Ranking2DescribeSubscribeRankingScoresByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        time_offset_token
    )


func subscribe_subscribe_ranking_scores(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2SubscribeRankingScore",
        Gs2Ranking2SubscribeRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback
    )


func unsubscribe_subscribe_ranking_scores(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2SubscribeRankingScore",
        Gs2Ranking2SubscribeRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback_id
    )


func invalidate_subscribe_ranking_scores(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2SubscribeRankingScore",
        Gs2Ranking2SubscribeRankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        )
    )
func subscribe_ranking_score(
) -> Gs2Ranking2SubscribeRankingScoreDomain:
    return Gs2Ranking2SubscribeRankingScoreDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        season,
        user_id
    )


func subscribe_rankings(
    time_offset_token = null
) -> Gs2Ranking2DescribeSubscribeRankingsByUserIdIterator:
    return Gs2Ranking2DescribeSubscribeRankingsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        season,
        time_offset_token
    )


func subscribe_subscribe_rankings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2SubscribeRankingData",
        Gs2Ranking2SubscribeRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_subscribe_rankings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2SubscribeRankingData",
        Gs2Ranking2SubscribeRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_subscribe_rankings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2SubscribeRankingData",
        Gs2Ranking2SubscribeRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            null
        )
    )
func subscribe_ranking_data(
    scorer_user_id
) -> Gs2Ranking2SubscribeRankingDataDomain:
    return Gs2Ranking2SubscribeRankingDataDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        season,
        user_id,
        scorer_user_id
    )