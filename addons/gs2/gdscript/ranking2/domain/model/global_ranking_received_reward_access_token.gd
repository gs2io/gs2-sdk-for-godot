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
class_name Gs2Ranking2GlobalRankingReceivedRewardAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var ranking_name: Variant = null
var season: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var acquire_actions: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    ranking_name_,
    season_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    ranking_name = ranking_name_
    season = season_
    access_token = access_token_


func create(
    request: Gs2Ranking2CreateGlobalRankingReceivedRewardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2CreateGlobalRankingReceivedRewardMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.create_global_ranking_received_reward(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func receive(
    request: Gs2Ranking2ReceiveGlobalRankingReceivedRewardRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_ranking_name(ranking_name)
    request = request.with_season(season)
    if speculative_execute:
        var speculative_result = await Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2Ranking2ReceiveGlobalRankingReceivedRewardMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.receive_global_ranking_received_reward(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction(
        _gs2,
        access_token,
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
    request: Gs2Ranking2GetGlobalRankingReceivedRewardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_ranking_name(ranking_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_season(season)
    var async_result = await Gs2Ranking2GetGlobalRankingReceivedRewardMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_global_ranking_received_reward(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2Ranking2GlobalRankingReceivedRewardCache.get_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        season,
        user_id,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Ranking2GlobalRankingReceivedRewardCache.fetch(
        _gs2.cache,
        namespace_name,
        ranking_name,
        season,
        user_id,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2Ranking2GetGlobalRankingReceivedRewardRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Ranking2GlobalRankingReceivedRewardCache.delete_cache(
        _gs2.cache,
        namespace_name,
        ranking_name,
        season,
        user_id,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Ranking2GlobalRankingReceivedReward",
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_key(
            season,
            user_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Ranking2GlobalRankingReceivedReward",
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2Ranking2GlobalRankingReceivedRewardCache.cache_key(
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