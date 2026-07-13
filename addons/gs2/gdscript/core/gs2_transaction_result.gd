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
class_name Gs2TransactionResult
extends RefCounted


var transaction_id: Variant = null
var verify_results: Variant = null
var consume_results: Variant = null
var acquire_results: Variant = null
var has_error: Variant = null


func with_transaction_id(v) -> Gs2TransactionResult:
    transaction_id = v
    return self


func with_verify_results(v) -> Gs2TransactionResult:
    verify_results = v
    return self


func with_consume_results(v) -> Gs2TransactionResult:
    consume_results = v
    return self


func with_acquire_results(v) -> Gs2TransactionResult:
    acquire_results = v
    return self


func with_has_error(v) -> Gs2TransactionResult:
    has_error = v
    return self


static func from_dict(data) -> Gs2TransactionResult:
    if data == null:
        return null
    var ret = Gs2TransactionResult.new()
    ret.transaction_id = data.get("transactionId")
    ret.verify_results = null if data.get("verifyResults") == null else data.get("verifyResults").map(func(v): return Gs2VerifyActionResult.from_dict(v))
    ret.consume_results = null if data.get("consumeResults") == null else data.get("consumeResults").map(func(v): return Gs2ConsumeActionResult.from_dict(v))
    ret.acquire_results = null if data.get("acquireResults") == null else data.get("acquireResults").map(func(v): return Gs2AcquireActionResult.from_dict(v))
    ret.has_error = null if data.get("hasError") == null else bool(data.get("hasError"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["transactionId"] = transaction_id
    ret["verifyResults"] = null if verify_results == null else verify_results.map(func(v): return null if v == null else v.to_dict())
    ret["consumeResults"] = null if consume_results == null else consume_results.map(func(v): return null if v == null else v.to_dict())
    ret["acquireResults"] = null if acquire_results == null else acquire_results.map(func(v): return null if v == null else v.to_dict())
    ret["hasError"] = has_error
    return ret
