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
class_name Gs2Money2DailyTransactionHistoryDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var year: Variant = null
var month: Variant = null
var day: Variant = null
var currency: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    year_,
    month_,
    day_,
    currency_
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    year = year_
    month = month_
    day = day_
    currency = currency_


func get_(
    request: Gs2Money2GetDailyTransactionHistoryRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_year(year)
    request = request.with_month(month)
    request = request.with_day(day)
    request = request.with_currency(currency)
    var async_result = await Gs2Money2GetDailyTransactionHistoryMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_daily_transaction_history(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2Money2DailyTransactionHistoryCache.get_cache(
        _gs2.cache,
        namespace_name,
        year,
        month,
        day,
        currency,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Money2DailyTransactionHistoryCache.fetch(
        _gs2.cache,
        namespace_name,
        year,
        month,
        day,
        currency,
        null,
        func():
            var get_result = await get_(Gs2Money2GetDailyTransactionHistoryRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Money2DailyTransactionHistoryCache.delete_cache(
        _gs2.cache,
        namespace_name,
        year,
        month,
        day,
        currency,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2Money2DailyTransactionHistoryCache.cache_key(
            year,
            month,
            day,
            currency
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Money2DailyTransactionHistory",
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2Money2DailyTransactionHistoryCache.cache_key(
            year,
            month,
            day,
            currency
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