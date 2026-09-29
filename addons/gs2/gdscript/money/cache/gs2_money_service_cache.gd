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
class_name Gs2MoneyServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    if kind == "wallet":
        var item = Gs2MoneyWallet.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2MoneyWalletCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    return null


static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    if kind == "wallet":
        cache.set_list_cached("Gs2MoneyWallet", parent_key)
        return true
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2MoneyDescribeNamespacesMethodCache.put_cache(
            Gs2MoneyDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2MoneyCreateNamespaceMethodCache.put_cache(
            Gs2MoneyCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2MoneyGetNamespaceStatusMethodCache.put_cache(
            Gs2MoneyGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2MoneyGetNamespaceMethodCache.put_cache(
            Gs2MoneyGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2MoneyUpdateNamespaceMethodCache.put_cache(
            Gs2MoneyUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2MoneyDeleteNamespaceMethodCache.put_cache(
            Gs2MoneyDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2MoneyGetServiceVersionMethodCache.put_cache(
            Gs2MoneyGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2MoneyDumpUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2MoneyCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2MoneyCleanUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2MoneyCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2MoneyPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2MoneyImportUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2MoneyCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2MoneyCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeWallets":
        Gs2MoneyDescribeWalletsMethodCache.put_cache(
            Gs2MoneyDescribeWalletsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDescribeWalletsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeWalletsByUserId":
        Gs2MoneyDescribeWalletsByUserIdMethodCache.put_cache(
            Gs2MoneyDescribeWalletsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDescribeWalletsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getWallet":
        Gs2MoneyGetWalletMethodCache.put_cache(
            Gs2MoneyGetWalletResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyGetWalletRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getWalletByUserId":
        Gs2MoneyGetWalletByUserIdMethodCache.put_cache(
            Gs2MoneyGetWalletByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyGetWalletByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "depositByUserId":
        Gs2MoneyDepositByUserIdMethodCache.put_cache(
            Gs2MoneyDepositByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDepositByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "withdraw":
        Gs2MoneyWithdrawMethodCache.put_cache(
            Gs2MoneyWithdrawResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyWithdrawRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "withdrawByUserId":
        Gs2MoneyWithdrawByUserIdMethodCache.put_cache(
            Gs2MoneyWithdrawByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyWithdrawByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceipts":
        Gs2MoneyDescribeReceiptsMethodCache.put_cache(
            Gs2MoneyDescribeReceiptsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyDescribeReceiptsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getByUserIdAndTransactionId":
        Gs2MoneyGetByUserIdAndTransactionIdMethodCache.put_cache(
            Gs2MoneyGetByUserIdAndTransactionIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyGetByUserIdAndTransactionIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "recordReceipt":
        Gs2MoneyRecordReceiptMethodCache.put_cache(
            Gs2MoneyRecordReceiptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyRecordReceiptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "revertRecordReceipt":
        Gs2MoneyRevertRecordReceiptMethodCache.put_cache(
            Gs2MoneyRevertRecordReceiptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MoneyRevertRecordReceiptRequest.from_dict(_parse(request_payload))
        )
        return
    pass