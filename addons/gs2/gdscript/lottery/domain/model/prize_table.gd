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
class_name Gs2LotteryPrizeTableDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LotteryRestClient
var namespace_name: Variant = null
var prize_table_name: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    prize_table_name_
):
    _gs2 = gs2
    _client = Gs2LotteryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    prize_table_name = prize_table_name_


func get_(
    request: Gs2LotteryGetPrizeTableRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_prize_table_name(prize_table_name)
    var async_result = await Gs2LotteryGetPrizeTableMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_prize_table(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func prize_limits(
) -> Gs2LotteryDescribePrizeLimitsIterator:
    return Gs2LotteryDescribePrizeLimitsIterator.new(
        _gs2,
        _client,
        namespace_name,
        prize_table_name
    )


func subscribe_prize_limits(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LotteryPrizeLimit",
        Gs2LotteryPrizeLimitCache.cache_parent_key(
            namespace_name,
            prize_table_name,
            null
        ),
        callback
    )


func unsubscribe_prize_limits(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LotteryPrizeLimit",
        Gs2LotteryPrizeLimitCache.cache_parent_key(
            namespace_name,
            prize_table_name,
            null
        ),
        callback_id
    )


func invalidate_prize_limits(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LotteryPrizeLimit",
        Gs2LotteryPrizeLimitCache.cache_parent_key(
            namespace_name,
            prize_table_name,
            null
        )
    )
func prize_limit(
    prize_id
) -> Gs2LotteryPrizeLimitDomain:
    return Gs2LotteryPrizeLimitDomain.new(
        _gs2,
        namespace_name,
        prize_table_name,
        prize_id
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2LotteryPrizeTableCache.get_cache(
        _gs2.cache,
        namespace_name,
        prize_table_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2LotteryPrizeTableCache.fetch(
        _gs2.cache,
        namespace_name,
        prize_table_name,
        null,
        func():
            var get_result = await get_(Gs2LotteryGetPrizeTableRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2LotteryPrizeTableCache.delete_cache(
        _gs2.cache,
        namespace_name,
        prize_table_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LotteryPrizeTable",
        Gs2LotteryPrizeTableCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2LotteryPrizeTableCache.cache_key(
            prize_table_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LotteryPrizeTable",
        Gs2LotteryPrizeTableCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2LotteryPrizeTableCache.cache_key(
            prize_table_name
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