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
class_name Gs2Money2EzDepositTransaction
extends RefCounted


var price = 0
var currency = null
var count = 0


func with_price(v) -> Gs2Money2EzDepositTransaction:
    price = v
    return self


func with_currency(v) -> Gs2Money2EzDepositTransaction:
    currency = v
    return self


func with_count(v) -> Gs2Money2EzDepositTransaction:
    count = v
    return self


func to_model() -> Gs2Money2DepositTransaction:
    var ret = Gs2Money2DepositTransaction.new()
    ret.price = price
    ret.currency = currency
    ret.count = count
    return ret


static func from_model(model) -> Gs2Money2EzDepositTransaction:
    var ret = Gs2Money2EzDepositTransaction.new()
    ret.price = 0 if model.price == null else model.price
    ret.currency = model.currency
    ret.count = 0 if model.count == null else model.count
    return ret