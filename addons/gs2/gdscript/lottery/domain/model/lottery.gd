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
class_name Gs2LotteryLotteryDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2LotteryRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var lottery_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    lottery_name_
):
    _gs2 = gs2
    _client = Gs2LotteryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    lottery_name = lottery_name_


func draw(
    request: Gs2LotteryDrawByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_lottery_name(lottery_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2LotteryDrawByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.draw_by_user_id(request)
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


func prediction(
    request: Gs2LotteryPredictionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_lottery_name(lottery_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2LotteryPredictionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.prediction_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.items, null)


func draw_with_random_seed(
    request: Gs2LotteryDrawWithRandomSeedByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_lottery_name(lottery_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2LotteryDrawWithRandomSeedByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.draw_with_random_seed_by_user_id(request)
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


func probabilities(
    time_offset_token = null
) -> Gs2LotteryDescribeProbabilitiesByUserIdIterator:
    return Gs2LotteryDescribeProbabilitiesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        lottery_name,
        user_id,
        time_offset_token
    )


func subscribe_probabilities(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryProbability",
        Gs2LotteryProbabilityCache.cache_parent_key(
            namespace_name,
            user_id,
            lottery_name,
            null
        ),
        callback
    )


func unsubscribe_probabilities(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryProbability",
        Gs2LotteryProbabilityCache.cache_parent_key(
            namespace_name,
            user_id,
            lottery_name,
            null
        ),
        callback_id
    )


func invalidate_probabilities(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryProbability",
        Gs2LotteryProbabilityCache.cache_parent_key(
            namespace_name,
            user_id,
            lottery_name,
            null
        )
    )
func probability(
    prize_id
) -> Gs2LotteryProbabilityDomain:
    return Gs2LotteryProbabilityDomain.new(
        _gs2,
        namespace_name,
        user_id,
        lottery_name,
        prize_id
    )