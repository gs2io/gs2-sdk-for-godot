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
class_name Gs2ShowcaseServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


# Gs2Distributor:DescribeUserData（ユーザーの全データの一括取得）の 1 エントリを、kind に対応するモデルのキャッシュへ入れる。
# 戻り値は親キー（null は知らない kind ＝ SDK が古い / 対応表に無い）。呼び手は全ページを読み終えてから
# set_list_cached(cache, time_offset, kind, parent_key) を呼ぶ。対応表は sdk-gen の type/user_data_cache.py（kind → モデル）。
static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    if kind == "randomDisplayItem":
        var item = Gs2ShowcaseRandomDisplayItem.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2ShowcaseRandomDisplayItemCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    return null


# 一括取得で入れた kind の親キーに「リストが揃った印」を立てる（Describe のイテレータがサーバーへ出なくなる）。
static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    if kind == "randomDisplayItem":
        cache.set_list_cached("Gs2ShowcaseRandomDisplayItem", parent_key)
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
        Gs2ShowcaseDescribeNamespacesMethodCache.put_cache(
            Gs2ShowcaseDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2ShowcaseCreateNamespaceMethodCache.put_cache(
            Gs2ShowcaseCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2ShowcaseGetNamespaceStatusMethodCache.put_cache(
            Gs2ShowcaseGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2ShowcaseGetNamespaceMethodCache.put_cache(
            Gs2ShowcaseGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2ShowcaseUpdateNamespaceMethodCache.put_cache(
            Gs2ShowcaseUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2ShowcaseDeleteNamespaceMethodCache.put_cache(
            Gs2ShowcaseDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ShowcaseGetServiceVersionMethodCache.put_cache(
            Gs2ShowcaseGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2ShowcaseDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcaseDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2ShowcaseCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcaseCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2ShowcaseCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcaseCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2ShowcaseCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcaseCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2ShowcasePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcasePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcasePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2ShowcaseImportUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcaseImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2ShowcaseCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2ShowcaseCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSalesItemMasters":
        Gs2ShowcaseDescribeSalesItemMastersMethodCache.put_cache(
            Gs2ShowcaseDescribeSalesItemMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeSalesItemMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSalesItemMaster":
        Gs2ShowcaseCreateSalesItemMasterMethodCache.put_cache(
            Gs2ShowcaseCreateSalesItemMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCreateSalesItemMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSalesItemMaster":
        Gs2ShowcaseGetSalesItemMasterMethodCache.put_cache(
            Gs2ShowcaseGetSalesItemMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetSalesItemMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSalesItemMaster":
        Gs2ShowcaseUpdateSalesItemMasterMethodCache.put_cache(
            Gs2ShowcaseUpdateSalesItemMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateSalesItemMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSalesItemMaster":
        Gs2ShowcaseDeleteSalesItemMasterMethodCache.put_cache(
            Gs2ShowcaseDeleteSalesItemMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDeleteSalesItemMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSalesItemGroupMasters":
        Gs2ShowcaseDescribeSalesItemGroupMastersMethodCache.put_cache(
            Gs2ShowcaseDescribeSalesItemGroupMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeSalesItemGroupMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSalesItemGroupMaster":
        Gs2ShowcaseCreateSalesItemGroupMasterMethodCache.put_cache(
            Gs2ShowcaseCreateSalesItemGroupMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCreateSalesItemGroupMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSalesItemGroupMaster":
        Gs2ShowcaseGetSalesItemGroupMasterMethodCache.put_cache(
            Gs2ShowcaseGetSalesItemGroupMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetSalesItemGroupMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSalesItemGroupMaster":
        Gs2ShowcaseUpdateSalesItemGroupMasterMethodCache.put_cache(
            Gs2ShowcaseUpdateSalesItemGroupMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateSalesItemGroupMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSalesItemGroupMaster":
        Gs2ShowcaseDeleteSalesItemGroupMasterMethodCache.put_cache(
            Gs2ShowcaseDeleteSalesItemGroupMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDeleteSalesItemGroupMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeShowcaseMasters":
        Gs2ShowcaseDescribeShowcaseMastersMethodCache.put_cache(
            Gs2ShowcaseDescribeShowcaseMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeShowcaseMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createShowcaseMaster":
        Gs2ShowcaseCreateShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseCreateShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCreateShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getShowcaseMaster":
        Gs2ShowcaseGetShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseGetShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateShowcaseMaster":
        Gs2ShowcaseUpdateShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseUpdateShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteShowcaseMaster":
        Gs2ShowcaseDeleteShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseDeleteShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDeleteShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2ShowcaseExportMasterMethodCache.put_cache(
            Gs2ShowcaseExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentShowcaseMaster":
        Gs2ShowcaseGetCurrentShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseGetCurrentShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetCurrentShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentShowcaseMaster":
        Gs2ShowcasePreUpdateCurrentShowcaseMasterMethodCache.put_cache(
            Gs2ShowcasePreUpdateCurrentShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcasePreUpdateCurrentShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentShowcaseMaster":
        Gs2ShowcaseUpdateCurrentShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseUpdateCurrentShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateCurrentShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentShowcaseMasterFromGitHub":
        Gs2ShowcaseUpdateCurrentShowcaseMasterFromGitHubMethodCache.put_cache(
            Gs2ShowcaseUpdateCurrentShowcaseMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateCurrentShowcaseMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeShowcases":
        Gs2ShowcaseDescribeShowcasesMethodCache.put_cache(
            Gs2ShowcaseDescribeShowcasesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeShowcasesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeShowcasesByUserId":
        Gs2ShowcaseDescribeShowcasesByUserIdMethodCache.put_cache(
            Gs2ShowcaseDescribeShowcasesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeShowcasesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getShowcase":
        Gs2ShowcaseGetShowcaseMethodCache.put_cache(
            Gs2ShowcaseGetShowcaseResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetShowcaseRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getShowcaseByUserId":
        Gs2ShowcaseGetShowcaseByUserIdMethodCache.put_cache(
            Gs2ShowcaseGetShowcaseByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetShowcaseByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "buy":
        Gs2ShowcaseBuyMethodCache.put_cache(
            Gs2ShowcaseBuyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseBuyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "buyByUserId":
        Gs2ShowcaseBuyByUserIdMethodCache.put_cache(
            Gs2ShowcaseBuyByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseBuyByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRandomShowcaseMasters":
        Gs2ShowcaseDescribeRandomShowcaseMastersMethodCache.put_cache(
            Gs2ShowcaseDescribeRandomShowcaseMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeRandomShowcaseMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRandomShowcaseMaster":
        Gs2ShowcaseCreateRandomShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseCreateRandomShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseCreateRandomShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRandomShowcaseMaster":
        Gs2ShowcaseGetRandomShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseGetRandomShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetRandomShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRandomShowcaseMaster":
        Gs2ShowcaseUpdateRandomShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseUpdateRandomShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseUpdateRandomShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRandomShowcaseMaster":
        Gs2ShowcaseDeleteRandomShowcaseMasterMethodCache.put_cache(
            Gs2ShowcaseDeleteRandomShowcaseMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDeleteRandomShowcaseMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "incrementPurchaseCount":
        Gs2ShowcaseIncrementPurchaseCountMethodCache.put_cache(
            Gs2ShowcaseIncrementPurchaseCountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseIncrementPurchaseCountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "incrementPurchaseCountByUserId":
        Gs2ShowcaseIncrementPurchaseCountByUserIdMethodCache.put_cache(
            Gs2ShowcaseIncrementPurchaseCountByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseIncrementPurchaseCountByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decrementPurchaseCountByUserId":
        Gs2ShowcaseDecrementPurchaseCountByUserIdMethodCache.put_cache(
            Gs2ShowcaseDecrementPurchaseCountByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDecrementPurchaseCountByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "forceReDrawByUserId":
        Gs2ShowcaseForceReDrawByUserIdMethodCache.put_cache(
            Gs2ShowcaseForceReDrawByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseForceReDrawByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRandomDisplayItems":
        Gs2ShowcaseDescribeRandomDisplayItemsMethodCache.put_cache(
            Gs2ShowcaseDescribeRandomDisplayItemsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeRandomDisplayItemsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRandomDisplayItemsByUserId":
        Gs2ShowcaseDescribeRandomDisplayItemsByUserIdMethodCache.put_cache(
            Gs2ShowcaseDescribeRandomDisplayItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseDescribeRandomDisplayItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRandomDisplayItem":
        Gs2ShowcaseGetRandomDisplayItemMethodCache.put_cache(
            Gs2ShowcaseGetRandomDisplayItemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetRandomDisplayItemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRandomDisplayItemByUserId":
        Gs2ShowcaseGetRandomDisplayItemByUserIdMethodCache.put_cache(
            Gs2ShowcaseGetRandomDisplayItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseGetRandomDisplayItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "randomShowcaseBuy":
        Gs2ShowcaseRandomShowcaseBuyMethodCache.put_cache(
            Gs2ShowcaseRandomShowcaseBuyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseRandomShowcaseBuyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "randomShowcaseBuyByUserId":
        Gs2ShowcaseRandomShowcaseBuyByUserIdMethodCache.put_cache(
            Gs2ShowcaseRandomShowcaseBuyByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ShowcaseRandomShowcaseBuyByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass