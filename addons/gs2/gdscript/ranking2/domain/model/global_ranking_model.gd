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
class_name Gs2Ranking2GlobalRankingModelDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var ranking_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    ranking_name_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    ranking_name = ranking_name_


func get_(
    request: Gs2Ranking2GetGlobalRankingModelRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    var async_result = await Gs2Ranking2GetGlobalRankingModelMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_global_ranking_model(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)
func global_ranking_season(
    season,
    user_id
# diff --- start
#) -> Gs2Ranking2GlobalRankingSeasonDomain:
# diff --- end
):  # diff +++
    # diff +++ start
    if user_id is Gs2AuthAccessToken:
        return Gs2Ranking2GlobalRankingSeasonAccessTokenDomain.new(
            _gs2,
            namespace_name,
            ranking_name,
            season,
            user_id
        )
    # diff +++ end
    return Gs2Ranking2GlobalRankingSeasonDomain.new(
        _gs2,
        namespace_name,
        ranking_name,
        season,
        user_id
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2Ranking2GlobalRankingModelCache.get_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Ranking2GlobalRankingModelCache.fetch(
        _gs2.cache,
        namespace_name,
        ranking_name,
        null,
        func():
            var get_result = await get_(Gs2Ranking2GetGlobalRankingModelRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Ranking2GlobalRankingModelCache.delete_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Ranking2GlobalRankingModel",
        Gs2Ranking2GlobalRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2Ranking2GlobalRankingModelCache.cache_key(
            ranking_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Ranking2GlobalRankingModel",
        Gs2Ranking2GlobalRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2Ranking2GlobalRankingModelCache.cache_key(
            ranking_name
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