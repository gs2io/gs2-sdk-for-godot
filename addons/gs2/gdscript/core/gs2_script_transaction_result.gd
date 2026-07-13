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
class_name Gs2ScriptTransactionResult
extends RefCounted


var script_id: Variant = null
var transaction_id: Variant = null
var transaction_result: Variant = null


func with_script_id(v) -> Gs2ScriptTransactionResult:
    script_id = v
    return self


func with_transaction_id(v) -> Gs2ScriptTransactionResult:
    transaction_id = v
    return self


func with_transaction_result(v) -> Gs2ScriptTransactionResult:
    transaction_result = v
    return self


static func from_dict(data) -> Gs2ScriptTransactionResult:
    if data == null:
        return null
    var ret = Gs2ScriptTransactionResult.new()
    ret.script_id = data.get("scriptId")
    ret.transaction_id = data.get("transactionId")
    ret.transaction_result = Gs2TransactionResult.from_dict(data.get("transactionResult"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["scriptId"] = script_id
    ret["transactionId"] = transaction_id
    ret["transactionResult"] = null if transaction_result == null else transaction_result.to_dict()
    return ret
