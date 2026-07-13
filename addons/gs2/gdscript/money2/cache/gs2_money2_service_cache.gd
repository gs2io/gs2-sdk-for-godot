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
class_name Gs2Money2ServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2Money2DescribeNamespacesMethodCache.put_cache(
            Gs2Money2DescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2Money2CreateNamespaceMethodCache.put_cache(
            Gs2Money2CreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2Money2GetNamespaceStatusMethodCache.put_cache(
            Gs2Money2GetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2Money2GetNamespaceMethodCache.put_cache(
            Gs2Money2GetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2Money2UpdateNamespaceMethodCache.put_cache(
            Gs2Money2UpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2UpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2Money2DeleteNamespaceMethodCache.put_cache(
            Gs2Money2DeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2Money2GetServiceVersionMethodCache.put_cache(
            Gs2Money2GetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2Money2DumpUserDataByUserIdMethodCache.put_cache(
            Gs2Money2DumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2Money2CheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2Money2CheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2Money2CleanUserDataByUserIdMethodCache.put_cache(
            Gs2Money2CleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2Money2CheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2Money2CheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2Money2PrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2Money2PrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2PrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2Money2ImportUserDataByUserIdMethodCache.put_cache(
            Gs2Money2ImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2ImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2Money2CheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2Money2CheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeWallets":
        Gs2Money2DescribeWalletsMethodCache.put_cache(
            Gs2Money2DescribeWalletsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeWalletsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeWalletsByUserId":
        Gs2Money2DescribeWalletsByUserIdMethodCache.put_cache(
            Gs2Money2DescribeWalletsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeWalletsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getWallet":
        Gs2Money2GetWalletMethodCache.put_cache(
            Gs2Money2GetWalletResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetWalletRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getWalletByUserId":
        Gs2Money2GetWalletByUserIdMethodCache.put_cache(
            Gs2Money2GetWalletByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetWalletByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "depositByUserId":
        Gs2Money2DepositByUserIdMethodCache.put_cache(
            Gs2Money2DepositByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DepositByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "withdraw":
        Gs2Money2WithdrawMethodCache.put_cache(
            Gs2Money2WithdrawResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2WithdrawRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "withdrawByUserId":
        Gs2Money2WithdrawByUserIdMethodCache.put_cache(
            Gs2Money2WithdrawByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2WithdrawByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEventsByUserId":
        Gs2Money2DescribeEventsByUserIdMethodCache.put_cache(
            Gs2Money2DescribeEventsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeEventsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEventByTransactionId":
        Gs2Money2GetEventByTransactionIdMethodCache.put_cache(
            Gs2Money2GetEventByTransactionIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetEventByTransactionIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyReceipt":
        Gs2Money2VerifyReceiptMethodCache.put_cache(
            Gs2Money2VerifyReceiptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2VerifyReceiptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyReceiptByUserId":
        Gs2Money2VerifyReceiptByUserIdMethodCache.put_cache(
            Gs2Money2VerifyReceiptByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2VerifyReceiptByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscriptionStatuses":
        Gs2Money2DescribeSubscriptionStatusesMethodCache.put_cache(
            Gs2Money2DescribeSubscriptionStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeSubscriptionStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscriptionStatusesByUserId":
        Gs2Money2DescribeSubscriptionStatusesByUserIdMethodCache.put_cache(
            Gs2Money2DescribeSubscriptionStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeSubscriptionStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscriptionStatus":
        Gs2Money2GetSubscriptionStatusMethodCache.put_cache(
            Gs2Money2GetSubscriptionStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetSubscriptionStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscriptionStatusByUserId":
        Gs2Money2GetSubscriptionStatusByUserIdMethodCache.put_cache(
            Gs2Money2GetSubscriptionStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetSubscriptionStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "allocateSubscriptionStatus":
        Gs2Money2AllocateSubscriptionStatusMethodCache.put_cache(
            Gs2Money2AllocateSubscriptionStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2AllocateSubscriptionStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "allocateSubscriptionStatusByUserId":
        Gs2Money2AllocateSubscriptionStatusByUserIdMethodCache.put_cache(
            Gs2Money2AllocateSubscriptionStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2AllocateSubscriptionStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "takeoverSubscriptionStatus":
        Gs2Money2TakeoverSubscriptionStatusMethodCache.put_cache(
            Gs2Money2TakeoverSubscriptionStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2TakeoverSubscriptionStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "takeoverSubscriptionStatusByUserId":
        Gs2Money2TakeoverSubscriptionStatusByUserIdMethodCache.put_cache(
            Gs2Money2TakeoverSubscriptionStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2TakeoverSubscriptionStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRefundHistoriesByUserId":
        Gs2Money2DescribeRefundHistoriesByUserIdMethodCache.put_cache(
            Gs2Money2DescribeRefundHistoriesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeRefundHistoriesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRefundHistoriesByDate":
        Gs2Money2DescribeRefundHistoriesByDateMethodCache.put_cache(
            Gs2Money2DescribeRefundHistoriesByDateResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeRefundHistoriesByDateRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRefundHistory":
        Gs2Money2GetRefundHistoryMethodCache.put_cache(
            Gs2Money2GetRefundHistoryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetRefundHistoryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStoreContentModels":
        Gs2Money2DescribeStoreContentModelsMethodCache.put_cache(
            Gs2Money2DescribeStoreContentModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeStoreContentModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStoreContentModel":
        Gs2Money2GetStoreContentModelMethodCache.put_cache(
            Gs2Money2GetStoreContentModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetStoreContentModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStoreContentModelMasters":
        Gs2Money2DescribeStoreContentModelMastersMethodCache.put_cache(
            Gs2Money2DescribeStoreContentModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeStoreContentModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createStoreContentModelMaster":
        Gs2Money2CreateStoreContentModelMasterMethodCache.put_cache(
            Gs2Money2CreateStoreContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CreateStoreContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStoreContentModelMaster":
        Gs2Money2GetStoreContentModelMasterMethodCache.put_cache(
            Gs2Money2GetStoreContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetStoreContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStoreContentModelMaster":
        Gs2Money2UpdateStoreContentModelMasterMethodCache.put_cache(
            Gs2Money2UpdateStoreContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2UpdateStoreContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStoreContentModelMaster":
        Gs2Money2DeleteStoreContentModelMasterMethodCache.put_cache(
            Gs2Money2DeleteStoreContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DeleteStoreContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStoreSubscriptionContentModels":
        Gs2Money2DescribeStoreSubscriptionContentModelsMethodCache.put_cache(
            Gs2Money2DescribeStoreSubscriptionContentModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeStoreSubscriptionContentModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStoreSubscriptionContentModel":
        Gs2Money2GetStoreSubscriptionContentModelMethodCache.put_cache(
            Gs2Money2GetStoreSubscriptionContentModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetStoreSubscriptionContentModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStoreSubscriptionContentModelMasters":
        Gs2Money2DescribeStoreSubscriptionContentModelMastersMethodCache.put_cache(
            Gs2Money2DescribeStoreSubscriptionContentModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeStoreSubscriptionContentModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createStoreSubscriptionContentModelMaster":
        Gs2Money2CreateStoreSubscriptionContentModelMasterMethodCache.put_cache(
            Gs2Money2CreateStoreSubscriptionContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2CreateStoreSubscriptionContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStoreSubscriptionContentModelMaster":
        Gs2Money2GetStoreSubscriptionContentModelMasterMethodCache.put_cache(
            Gs2Money2GetStoreSubscriptionContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetStoreSubscriptionContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStoreSubscriptionContentModelMaster":
        Gs2Money2UpdateStoreSubscriptionContentModelMasterMethodCache.put_cache(
            Gs2Money2UpdateStoreSubscriptionContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2UpdateStoreSubscriptionContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStoreSubscriptionContentModelMaster":
        Gs2Money2DeleteStoreSubscriptionContentModelMasterMethodCache.put_cache(
            Gs2Money2DeleteStoreSubscriptionContentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DeleteStoreSubscriptionContentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2Money2ExportMasterMethodCache.put_cache(
            Gs2Money2ExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2ExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentModelMaster":
        Gs2Money2GetCurrentModelMasterMethodCache.put_cache(
            Gs2Money2GetCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentModelMaster":
        Gs2Money2PreUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2Money2PreUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2PreUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMaster":
        Gs2Money2UpdateCurrentModelMasterMethodCache.put_cache(
            Gs2Money2UpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2UpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMasterFromGitHub":
        Gs2Money2UpdateCurrentModelMasterFromGitHubMethodCache.put_cache(
            Gs2Money2UpdateCurrentModelMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2UpdateCurrentModelMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDailyTransactionHistoriesByCurrency":
        Gs2Money2DescribeDailyTransactionHistoriesByCurrencyMethodCache.put_cache(
            Gs2Money2DescribeDailyTransactionHistoriesByCurrencyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeDailyTransactionHistoriesByCurrencyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDailyTransactionHistories":
        Gs2Money2DescribeDailyTransactionHistoriesMethodCache.put_cache(
            Gs2Money2DescribeDailyTransactionHistoriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeDailyTransactionHistoriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDailyTransactionHistory":
        Gs2Money2GetDailyTransactionHistoryMethodCache.put_cache(
            Gs2Money2GetDailyTransactionHistoryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetDailyTransactionHistoryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeUnusedBalances":
        Gs2Money2DescribeUnusedBalancesMethodCache.put_cache(
            Gs2Money2DescribeUnusedBalancesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2DescribeUnusedBalancesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getUnusedBalance":
        Gs2Money2GetUnusedBalanceMethodCache.put_cache(
            Gs2Money2GetUnusedBalanceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Money2GetUnusedBalanceRequest.from_dict(_parse(request_payload))
        )
        return
    pass