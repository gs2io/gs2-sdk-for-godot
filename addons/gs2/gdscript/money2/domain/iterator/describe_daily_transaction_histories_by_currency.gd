
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
class_name Gs2Money2DescribeDailyTransactionHistoriesByCurrencyIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var currency: Variant = null
var year: Variant = null
var month: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    currency_,
    year_,
    month_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    currency = currency_
    year = year_
    month = month_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2Money2DailyTransactionHistory",
        
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        )
    )
    if cached[1]:
        var list = []
        for item in cached[0]:
            if not (currency == null or item.currency == currency):
                continue
            if not (year == null or item.year == year):
                continue
            if not (month == null or item.month == month):
                continue
            list.append(item)
        return Gs2AsyncResult.new(list, null)
    while not _last:
        var request = Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_currency(currency)
        request = request.with_year(year)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.describe_daily_transaction_histories_by_currency(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            if not (currency == null or item.currency == currency):
                continue
            if not (year == null or item.year == year):
                continue
            if not (month == null or item.month == month):
                continue
            page.append(item)
        result.append_array(page)
        _page_token = r.result.next_page_token
        _last = _page_token == null
        Gs2Money2DescribeDailyTransactionHistoriesByCurrencyMethodCache.put_cache(
            r.result,
            _gs2.cache,
            null,
            null,
            request
        )
    _gs2.cache.set_list_cached(
        "Gs2Money2DailyTransactionHistory",
        
        Gs2Money2DailyTransactionHistoryCache.cache_parent_key(
            namespace_name,
            null
        )
    )
    return Gs2AsyncResult.new(result, null)