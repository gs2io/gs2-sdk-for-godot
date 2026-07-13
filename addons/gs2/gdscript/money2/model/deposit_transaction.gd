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
class_name Gs2Money2DepositTransaction
extends RefCounted


var price = null
var currency = null
var count = null
var deposited_at = null


func with_price(v) -> Gs2Money2DepositTransaction:
    price = v
    return self


func with_currency(v) -> Gs2Money2DepositTransaction:
    currency = v
    return self


func with_count(v) -> Gs2Money2DepositTransaction:
    count = v
    return self


func with_deposited_at(v) -> Gs2Money2DepositTransaction:
    deposited_at = v
    return self


static func from_dict(data) -> Gs2Money2DepositTransaction:
    if data == null:
        return null
    var ret = Gs2Money2DepositTransaction.new()
    ret.price = null if data.get("price") == null else float(data.get("price"))
    ret.currency = null if data.get("currency") == null else str(data.get("currency"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.deposited_at = null if data.get("depositedAt") == null else int(data.get("depositedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["price"] = price
    ret["currency"] = currency
    ret["count"] = count
    ret["depositedAt"] = deposited_at
    return ret