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
class_name Gs2Ranking2SubscribeRankingDataAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var ranking_name: Variant = null
var season: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var scorer_user_id: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    ranking_name_,
    season_,
    access_token_,
    scorer_user_id_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    ranking_name = ranking_name_
    season = season_
    access_token = access_token_
    scorer_user_id = scorer_user_id_


func get_subscribe_ranking(
    request: Gs2Ranking2GetSubscribeRankingRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_season(season)
    request = request.with_scorer_user_id(scorer_user_id)
    var async_result = await Gs2Ranking2GetSubscribeRankingMethodCache.invoke(
        _gs2.cache,
        # diff --- start
        #null,
        # diff --- end
        user_id,  # diff +++
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_subscribe_ranking(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    # diff --- start
    #var domain = self
    #return Gs2AsyncResult.new(domain, null)
    # diff --- end
    # diff +++ start
    var domain = Gs2Ranking2SubscribeRankingDataAccessTokenDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        (null if result == null or result.item == null else result.item.season),
        access_token,
        (null if result == null or result.item == null else result.item.scorer_user_id)
    )
    return Gs2AsyncResult.new(domain, null)
    # diff +++ end


func model() -> Gs2AsyncResult:
    var pair = Gs2Ranking2SubscribeRankingDataCache.get_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        season,
        scorer_user_id,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2Ranking2SubscribeRankingDataCache.delete_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        season,
        scorer_user_id,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Ranking2SubscribeRankingData",
        Gs2Ranking2SubscribeRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2Ranking2SubscribeRankingDataCache.cache_key(
            ranking_name,
            scorer_user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Ranking2SubscribeRankingData",
        Gs2Ranking2SubscribeRankingDataCache.cache_parent_key(
            namespace_name,
            ranking_name,
            season,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2Ranking2SubscribeRankingDataCache.cache_key(
            ranking_name,
            scorer_user_id
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)