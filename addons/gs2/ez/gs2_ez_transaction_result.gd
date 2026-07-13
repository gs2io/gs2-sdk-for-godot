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
class_name Gs2EzTransactionResult
extends RefCounted


var transaction_id: Variant = null
var verify_results: Array = []
var consume_results: Array = []
var acquire_results: Array = []


func to_model() -> Gs2TransactionResult:
    var ret = Gs2TransactionResult.new()
    ret.transaction_id = transaction_id
    ret.verify_results = null if verify_results == null else verify_results.map(func(v): return null if v == null else v.to_model())
    ret.consume_results = null if consume_results == null else consume_results.map(func(v): return null if v == null else v.to_model())
    ret.acquire_results = null if acquire_results == null else acquire_results.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2EzTransactionResult:
    var ret = Gs2EzTransactionResult.new()
    ret.transaction_id = model.transaction_id
    ret.verify_results = [] if model.verify_results == null else model.verify_results.map(func(v): return Gs2EzVerifyActionResult.from_model(v))
    ret.consume_results = [] if model.consume_results == null else model.consume_results.map(func(v): return Gs2EzConsumeActionResult.from_model(v))
    ret.acquire_results = [] if model.acquire_results == null else model.acquire_results.map(func(v): return Gs2EzAcquireActionResult.from_model(v))
    return ret
