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
class_name Gs2TransactionDomainFactory
extends RefCounted


static func to_transaction(
    gs2,
    access_token,
    auto_run,
    transaction_id,
    stamp_sheet,
    stamp_sheet_encryption_key_id,
    atomic_commit,
    transaction_result,
    metadata
) -> Gs2TransactionDomain:
    return _to_transaction(gs2, access_token, null, auto_run, transaction_id, stamp_sheet, stamp_sheet_encryption_key_id, atomic_commit, transaction_result, metadata)


static func to_transaction_by_user_id(
    gs2,
    user_id,
    auto_run,
    transaction_id,
    stamp_sheet,
    stamp_sheet_encryption_key_id,
    atomic_commit,
    transaction_result,
    metadata
) -> Gs2TransactionDomain:
    return _to_transaction(gs2, null, user_id, auto_run, transaction_id, stamp_sheet, stamp_sheet_encryption_key_id, atomic_commit, transaction_result, metadata)


static func _to_transaction(
    gs2,
    access_token,
    user_id,
    auto_run,
    transaction_id,
    stamp_sheet,
    stamp_sheet_encryption_key_id,
    atomic_commit,
    transaction_result,
    metadata
) -> Gs2TransactionDomain:
    if auto_run != null and auto_run:
        if atomic_commit != null and atomic_commit:
            if transaction_result != null:
                return Gs2RanTransactionDomain.new(
                    gs2,
                    access_token,
                    user_id,
                    transaction_id,
                    transaction_result,
                    metadata
                )
            return Gs2AutoTransactionDomain.new(
                gs2,
                access_token,
                user_id,
                transaction_id
            )
        return Gs2AutoStampSheetDomain.new(
            gs2,
            access_token,
            user_id,
            transaction_id
        )
    return Gs2ManualStampSheetDomain.new(
        gs2,
        access_token,
        user_id,
        transaction_id,
        stamp_sheet,
        stamp_sheet_encryption_key_id
    )


static func next_from_result_json(
    gs2,
    access_token,
    user_id,
    result_json
) -> Gs2TransactionDomain:
    if result_json == null or not (result_json is Dictionary) or not result_json.has("autoRunStampSheet"):
        return null
    var transaction_result = null
    var raw_transaction_result = result_json.get("transactionResult")
    if raw_transaction_result is String:
        raw_transaction_result = JSON.parse_string(raw_transaction_result)
    if raw_transaction_result != null:
        transaction_result = Gs2TransactionResult.from_dict(raw_transaction_result)
    var metadata = null
    var raw_metadata = result_json.get("metadata")
    if raw_metadata is String:
        raw_metadata = JSON.parse_string(raw_metadata)
    if raw_metadata != null:
        metadata = Gs2ResultMetadata.from_dict(raw_metadata)
    return _to_transaction(
        gs2,
        access_token,
        user_id,
        result_json.get("autoRunStampSheet") == true,
        result_json.get("transactionId"),
        result_json.get("stampSheet"),
        result_json.get("stampSheetEncryptionKeyId"),
        result_json.get("atomicCommit") == true,
        transaction_result,
        metadata
    )


static func recommend_auto_retry(error) -> bool:
    if error == null:
        return false
    return (
        error is Gs2QuotaLimitExceededException
        or error is Gs2ConflictException
        or error is Gs2InternalServerErrorException
        or error is Gs2BadGatewayException
        or error is Gs2ServiceUnavailableException
        or error is Gs2RequestTimeoutException
    )


static func timeout_error(message) -> Gs2Exception:
    var e = Gs2RequestTimeoutException.new()
    e.status_code = 408
    var request_error = Gs2RequestError.new()
    request_error.component = "transaction"
    request_error.message = message
    e.errors.append(request_error)
    return e
