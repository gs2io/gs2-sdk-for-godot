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
class_name Gs2Ranking2ClusterRankingReceivedRewardDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var ranking_name: Variant = null
var cluster_name: Variant = null
var season: Variant = null
var user_id: Variant = null
var acquire_actions: Variant = null


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


func create(
    request: Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_cluster_name(cluster_name)
    request = request.with_user_id(user_id)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.create_cluster_ranking_received_reward_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func receive(
    request: Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_ranking_name(ranking_name)
    request = request.with_cluster_name(cluster_name)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.receive_cluster_ranking_received_reward_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction_by_user_id(
        _gs2,
        user_id,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)


func get_(
    request: Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_cluster_name(cluster_name)
    request = request.with_user_id(user_id)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2GetClusterRankingReceivedRewardByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_cluster_ranking_received_reward_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_cluster_name(cluster_name)
    request = request.with_user_id(user_id)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_cluster_ranking_received_reward_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2Ranking2ClusterRankingReceivedRewardCache.get_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        cluster_name,
        season,
        user_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Ranking2ClusterRankingReceivedRewardCache.fetch(
        _gs2.cache,
        namespace_name,
        ranking_name,
        cluster_name,
        season,
        user_id,
        null,
        func():
            var get_result = await get_(Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Ranking2ClusterRankingReceivedRewardCache.delete_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        cluster_name,
        season,
        user_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Ranking2ClusterRankingReceivedReward",
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_key(
            cluster_name,
            season,
            user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Ranking2ClusterRankingReceivedReward",
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        Gs2Ranking2ClusterRankingReceivedRewardCache.cache_key(
            cluster_name,
            season,
            user_id
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