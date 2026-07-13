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
class_name Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest
extends Gs2Request


var namespace_name = null
var currency = null
var year = null
var month = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    namespace_name = v
    return self


func with_currency(v) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    currency = v
    return self


func with_year(v) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    year = v
    return self


func with_month(v) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    month = v
    return self


func with_page_token(v) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest:
    if data == null:
        return null
    var ret = Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.year = null if data.get("year") == null else int(data.get("year"))
    ret.month = null if data.get("month") == null else int(data.get("month"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["currency"] = currency
    ret["year"] = year
    ret["month"] = month
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret