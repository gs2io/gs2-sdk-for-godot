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
class_name Gs2QuestStartResult
extends RefCounted


var transaction_id = null
var stamp_sheet = null
var stamp_sheet_encryption_key_id = null
var auto_run_stamp_sheet = null
var atomic_commit = null
var transaction = null
var transaction_result = null
var metadata = null


func with_transaction_id(v) -> Gs2QuestStartResult:
    transaction_id = v
    return self


func with_stamp_sheet(v) -> Gs2QuestStartResult:
    stamp_sheet = v
    return self


func with_stamp_sheet_encryption_key_id(v) -> Gs2QuestStartResult:
    stamp_sheet_encryption_key_id = v
    return self


func with_auto_run_stamp_sheet(v) -> Gs2QuestStartResult:
    auto_run_stamp_sheet = v
    return self


func with_atomic_commit(v) -> Gs2QuestStartResult:
    atomic_commit = v
    return self


func with_transaction(v) -> Gs2QuestStartResult:
    transaction = v
    return self


func with_transaction_result(v) -> Gs2QuestStartResult:
    transaction_result = v
    return self


func with_metadata(v) -> Gs2QuestStartResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2QuestStartResult:
    if data == null:
        return null
    var ret = Gs2QuestStartResult.new()
    ret.transaction_id = null if data.get("transactionId") == null else str(data.get("transactionId"))
    ret.stamp_sheet = null if data.get("stampSheet") == null else str(data.get("stampSheet"))
    ret.stamp_sheet_encryption_key_id = null if data.get("stampSheetEncryptionKeyId") == null else str(data.get("stampSheetEncryptionKeyId"))
    ret.auto_run_stamp_sheet = null if data.get("autoRunStampSheet") == null else bool(data.get("autoRunStampSheet"))
    ret.atomic_commit = null if data.get("atomicCommit") == null else bool(data.get("atomicCommit"))
    ret.transaction = null if data.get("transaction") == null else str(data.get("transaction"))
    ret.transaction_result = null if data.get("transactionResult") == null else Gs2TransactionResult.from_dict(data.get("transactionResult"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["transactionId"] = transaction_id
    ret["stampSheet"] = stamp_sheet
    ret["stampSheetEncryptionKeyId"] = stamp_sheet_encryption_key_id
    ret["autoRunStampSheet"] = auto_run_stamp_sheet
    ret["atomicCommit"] = atomic_commit
    ret["transaction"] = transaction
    ret["transactionResult"] = null if transaction_result == null else transaction_result.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret