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
class_name Gs2ScriptInvokeByStampSheetResult
extends RefCounted


var code = null
var result = null
var transaction = null
var random_status = null
var atomic_commit = null
var transaction_result = null
var execute_time = null
var charged = null
var output = null
var metadata = null


func with_code(v) -> Gs2ScriptInvokeByStampSheetResult:
    code = v
    return self


func with_result(v) -> Gs2ScriptInvokeByStampSheetResult:
    result = v
    return self


func with_transaction(v) -> Gs2ScriptInvokeByStampSheetResult:
    transaction = v
    return self


func with_random_status(v) -> Gs2ScriptInvokeByStampSheetResult:
    random_status = v
    return self


func with_atomic_commit(v) -> Gs2ScriptInvokeByStampSheetResult:
    atomic_commit = v
    return self


func with_transaction_result(v) -> Gs2ScriptInvokeByStampSheetResult:
    transaction_result = v
    return self


func with_execute_time(v) -> Gs2ScriptInvokeByStampSheetResult:
    execute_time = v
    return self


func with_charged(v) -> Gs2ScriptInvokeByStampSheetResult:
    charged = v
    return self


func with_output(v) -> Gs2ScriptInvokeByStampSheetResult:
    output = v
    return self


func with_metadata(v) -> Gs2ScriptInvokeByStampSheetResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2ScriptInvokeByStampSheetResult:
    if data == null:
        return null
    var ret = Gs2ScriptInvokeByStampSheetResult.new()
    ret.code = null if data.get("code") == null else int(data.get("code"))
    ret.result = null if data.get("result") == null else str(data.get("result"))
    ret.transaction = null if data.get("transaction") == null else Gs2ScriptTransaction.from_dict(data.get("transaction"))
    ret.random_status = null if data.get("randomStatus") == null else Gs2ScriptRandomStatus.from_dict(data.get("randomStatus"))
    ret.atomic_commit = null if data.get("atomicCommit") == null else bool(data.get("atomicCommit"))
    ret.transaction_result = null if data.get("transactionResult") == null else Gs2TransactionResult.from_dict(data.get("transactionResult"))
    ret.execute_time = null if data.get("executeTime") == null else int(data.get("executeTime"))
    ret.charged = null if data.get("charged") == null else int(data.get("charged"))
    ret.output = null if data.get("output") == null else data.get("output").map(func(v): return str(v))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["code"] = code
    ret["result"] = result
    ret["transaction"] = null if transaction == null else transaction.to_dict()
    ret["randomStatus"] = null if random_status == null else random_status.to_dict()
    ret["atomicCommit"] = atomic_commit
    ret["transactionResult"] = null if transaction_result == null else transaction_result.to_dict()
    ret["executeTime"] = execute_time
    ret["charged"] = charged
    ret["output"] = output
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret