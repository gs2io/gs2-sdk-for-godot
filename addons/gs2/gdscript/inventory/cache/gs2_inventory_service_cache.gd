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
class_name Gs2InventoryServiceCache
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
    if kind == "bigItem":
        var item = Gs2InventoryBigItem.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2InventoryBigItemCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "inventory":
        var item = Gs2InventoryInventory.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2InventoryInventoryCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "itemSet":
        var item = Gs2InventoryItemSet.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2InventoryItemSetCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "simpleItem":
        var item = Gs2InventorySimpleItem.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2InventorySimpleItemCache.put_user_data(
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
    if kind == "bigItem":
        cache.set_list_cached("Gs2InventoryBigItem", parent_key)
        return true
    if kind == "inventory":
        cache.set_list_cached("Gs2InventoryInventory", parent_key)
        return true
    if kind == "itemSet":
        cache.set_list_cached("Gs2InventoryItemSet", parent_key)
        var groups = {}
        for v in cache.list_cache_force("Gs2InventoryItemSet", parent_key):
            if v == null:
                continue
            groups.get_or_add(v.item_name, []).append(v)
        for item_name in groups:
            var first = groups[item_name][0]
            Gs2InventoryItemSetCache.put_cache_list(
                groups[item_name],
                cache,
                Gs2InventoryItemSet.get_namespace_name_from_grn(first.item_set_id),
                first.user_id,
                first.inventory_name,
                item_name,
                time_offset
            )
        return true
    if kind == "simpleItem":
        cache.set_list_cached("Gs2InventorySimpleItem", parent_key)
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
        Gs2InventoryDescribeNamespacesMethodCache.put_cache(
            Gs2InventoryDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2InventoryCreateNamespaceMethodCache.put_cache(
            Gs2InventoryCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2InventoryGetNamespaceStatusMethodCache.put_cache(
            Gs2InventoryGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2InventoryGetNamespaceMethodCache.put_cache(
            Gs2InventoryGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2InventoryUpdateNamespaceMethodCache.put_cache(
            Gs2InventoryUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2InventoryDeleteNamespaceMethodCache.put_cache(
            Gs2InventoryDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2InventoryGetServiceVersionMethodCache.put_cache(
            Gs2InventoryGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2InventoryDumpUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2InventoryCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2InventoryCleanUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2InventoryCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2InventoryPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2InventoryImportUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2InventoryCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2InventoryCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeInventoryModelMasters":
        Gs2InventoryDescribeInventoryModelMastersMethodCache.put_cache(
            Gs2InventoryDescribeInventoryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeInventoryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createInventoryModelMaster":
        Gs2InventoryCreateInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryCreateInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getInventoryModelMaster":
        Gs2InventoryGetInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryGetInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateInventoryModelMaster":
        Gs2InventoryUpdateInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteInventoryModelMaster":
        Gs2InventoryDeleteInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryDeleteInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeInventoryModels":
        Gs2InventoryDescribeInventoryModelsMethodCache.put_cache(
            Gs2InventoryDescribeInventoryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeInventoryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getInventoryModel":
        Gs2InventoryGetInventoryModelMethodCache.put_cache(
            Gs2InventoryGetInventoryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetInventoryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeItemModelMasters":
        Gs2InventoryDescribeItemModelMastersMethodCache.put_cache(
            Gs2InventoryDescribeItemModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeItemModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createItemModelMaster":
        Gs2InventoryCreateItemModelMasterMethodCache.put_cache(
            Gs2InventoryCreateItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getItemModelMaster":
        Gs2InventoryGetItemModelMasterMethodCache.put_cache(
            Gs2InventoryGetItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateItemModelMaster":
        Gs2InventoryUpdateItemModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteItemModelMaster":
        Gs2InventoryDeleteItemModelMasterMethodCache.put_cache(
            Gs2InventoryDeleteItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeItemModels":
        Gs2InventoryDescribeItemModelsMethodCache.put_cache(
            Gs2InventoryDescribeItemModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeItemModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getItemModel":
        Gs2InventoryGetItemModelMethodCache.put_cache(
            Gs2InventoryGetItemModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetItemModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSimpleInventoryModelMasters":
        Gs2InventoryDescribeSimpleInventoryModelMastersMethodCache.put_cache(
            Gs2InventoryDescribeSimpleInventoryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeSimpleInventoryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSimpleInventoryModelMaster":
        Gs2InventoryCreateSimpleInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryCreateSimpleInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateSimpleInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleInventoryModelMaster":
        Gs2InventoryGetSimpleInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryGetSimpleInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSimpleInventoryModelMaster":
        Gs2InventoryUpdateSimpleInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateSimpleInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateSimpleInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSimpleInventoryModelMaster":
        Gs2InventoryDeleteSimpleInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryDeleteSimpleInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteSimpleInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSimpleInventoryModels":
        Gs2InventoryDescribeSimpleInventoryModelsMethodCache.put_cache(
            Gs2InventoryDescribeSimpleInventoryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeSimpleInventoryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleInventoryModel":
        Gs2InventoryGetSimpleInventoryModelMethodCache.put_cache(
            Gs2InventoryGetSimpleInventoryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleInventoryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSimpleItemModelMasters":
        Gs2InventoryDescribeSimpleItemModelMastersMethodCache.put_cache(
            Gs2InventoryDescribeSimpleItemModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeSimpleItemModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSimpleItemModelMaster":
        Gs2InventoryCreateSimpleItemModelMasterMethodCache.put_cache(
            Gs2InventoryCreateSimpleItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateSimpleItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleItemModelMaster":
        Gs2InventoryGetSimpleItemModelMasterMethodCache.put_cache(
            Gs2InventoryGetSimpleItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSimpleItemModelMaster":
        Gs2InventoryUpdateSimpleItemModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateSimpleItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateSimpleItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSimpleItemModelMaster":
        Gs2InventoryDeleteSimpleItemModelMasterMethodCache.put_cache(
            Gs2InventoryDeleteSimpleItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteSimpleItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSimpleItemModels":
        Gs2InventoryDescribeSimpleItemModelsMethodCache.put_cache(
            Gs2InventoryDescribeSimpleItemModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeSimpleItemModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleItemModel":
        Gs2InventoryGetSimpleItemModelMethodCache.put_cache(
            Gs2InventoryGetSimpleItemModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleItemModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBigInventoryModelMasters":
        Gs2InventoryDescribeBigInventoryModelMastersMethodCache.put_cache(
            Gs2InventoryDescribeBigInventoryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeBigInventoryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createBigInventoryModelMaster":
        Gs2InventoryCreateBigInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryCreateBigInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateBigInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBigInventoryModelMaster":
        Gs2InventoryGetBigInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryGetBigInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetBigInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBigInventoryModelMaster":
        Gs2InventoryUpdateBigInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateBigInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateBigInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBigInventoryModelMaster":
        Gs2InventoryDeleteBigInventoryModelMasterMethodCache.put_cache(
            Gs2InventoryDeleteBigInventoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteBigInventoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBigInventoryModels":
        Gs2InventoryDescribeBigInventoryModelsMethodCache.put_cache(
            Gs2InventoryDescribeBigInventoryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeBigInventoryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBigInventoryModel":
        Gs2InventoryGetBigInventoryModelMethodCache.put_cache(
            Gs2InventoryGetBigInventoryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetBigInventoryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBigItemModelMasters":
        Gs2InventoryDescribeBigItemModelMastersMethodCache.put_cache(
            Gs2InventoryDescribeBigItemModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeBigItemModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createBigItemModelMaster":
        Gs2InventoryCreateBigItemModelMasterMethodCache.put_cache(
            Gs2InventoryCreateBigItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryCreateBigItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBigItemModelMaster":
        Gs2InventoryGetBigItemModelMasterMethodCache.put_cache(
            Gs2InventoryGetBigItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetBigItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBigItemModelMaster":
        Gs2InventoryUpdateBigItemModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateBigItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateBigItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBigItemModelMaster":
        Gs2InventoryDeleteBigItemModelMasterMethodCache.put_cache(
            Gs2InventoryDeleteBigItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteBigItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBigItemModels":
        Gs2InventoryDescribeBigItemModelsMethodCache.put_cache(
            Gs2InventoryDescribeBigItemModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeBigItemModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBigItemModel":
        Gs2InventoryGetBigItemModelMethodCache.put_cache(
            Gs2InventoryGetBigItemModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetBigItemModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2InventoryExportMasterMethodCache.put_cache(
            Gs2InventoryExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentItemModelMaster":
        Gs2InventoryGetCurrentItemModelMasterMethodCache.put_cache(
            Gs2InventoryGetCurrentItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetCurrentItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentItemModelMaster":
        Gs2InventoryPreUpdateCurrentItemModelMasterMethodCache.put_cache(
            Gs2InventoryPreUpdateCurrentItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryPreUpdateCurrentItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentItemModelMaster":
        Gs2InventoryUpdateCurrentItemModelMasterMethodCache.put_cache(
            Gs2InventoryUpdateCurrentItemModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateCurrentItemModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentItemModelMasterFromGitHub":
        Gs2InventoryUpdateCurrentItemModelMasterFromGitHubMethodCache.put_cache(
            Gs2InventoryUpdateCurrentItemModelMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryUpdateCurrentItemModelMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeInventories":
        Gs2InventoryDescribeInventoriesMethodCache.put_cache(
            Gs2InventoryDescribeInventoriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeInventoriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeInventoriesByUserId":
        Gs2InventoryDescribeInventoriesByUserIdMethodCache.put_cache(
            Gs2InventoryDescribeInventoriesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeInventoriesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getInventory":
        Gs2InventoryGetInventoryMethodCache.put_cache(
            Gs2InventoryGetInventoryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetInventoryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getInventoryByUserId":
        Gs2InventoryGetInventoryByUserIdMethodCache.put_cache(
            Gs2InventoryGetInventoryByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetInventoryByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addCapacityByUserId":
        Gs2InventoryAddCapacityByUserIdMethodCache.put_cache(
            Gs2InventoryAddCapacityByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAddCapacityByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setCapacityByUserId":
        Gs2InventorySetCapacityByUserIdMethodCache.put_cache(
            Gs2InventorySetCapacityByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventorySetCapacityByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteInventoryByUserId":
        Gs2InventoryDeleteInventoryByUserIdMethodCache.put_cache(
            Gs2InventoryDeleteInventoryByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteInventoryByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyInventoryCurrentMaxCapacity":
        Gs2InventoryVerifyInventoryCurrentMaxCapacityMethodCache.put_cache(
            Gs2InventoryVerifyInventoryCurrentMaxCapacityResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyInventoryCurrentMaxCapacityRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyInventoryCurrentMaxCapacityByUserId":
        Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdMethodCache.put_cache(
            Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyInventoryCurrentMaxCapacityByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeItemSets":
        Gs2InventoryDescribeItemSetsMethodCache.put_cache(
            Gs2InventoryDescribeItemSetsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeItemSetsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeItemSetsByUserId":
        Gs2InventoryDescribeItemSetsByUserIdMethodCache.put_cache(
            Gs2InventoryDescribeItemSetsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeItemSetsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getItemSet":
        Gs2InventoryGetItemSetMethodCache.put_cache(
            Gs2InventoryGetItemSetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetItemSetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getItemSetByUserId":
        Gs2InventoryGetItemSetByUserIdMethodCache.put_cache(
            Gs2InventoryGetItemSetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetItemSetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getItemWithSignature":
        Gs2InventoryGetItemWithSignatureMethodCache.put_cache(
            Gs2InventoryGetItemWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetItemWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getItemWithSignatureByUserId":
        Gs2InventoryGetItemWithSignatureByUserIdMethodCache.put_cache(
            Gs2InventoryGetItemWithSignatureByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetItemWithSignatureByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireItemSetByUserId":
        Gs2InventoryAcquireItemSetByUserIdMethodCache.put_cache(
            Gs2InventoryAcquireItemSetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAcquireItemSetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireItemSetWithGradeByUserId":
        Gs2InventoryAcquireItemSetWithGradeByUserIdMethodCache.put_cache(
            Gs2InventoryAcquireItemSetWithGradeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAcquireItemSetWithGradeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeItemSet":
        Gs2InventoryConsumeItemSetMethodCache.put_cache(
            Gs2InventoryConsumeItemSetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryConsumeItemSetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeItemSetByUserId":
        Gs2InventoryConsumeItemSetByUserIdMethodCache.put_cache(
            Gs2InventoryConsumeItemSetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryConsumeItemSetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteItemSetByUserId":
        Gs2InventoryDeleteItemSetByUserIdMethodCache.put_cache(
            Gs2InventoryDeleteItemSetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteItemSetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyItemSet":
        Gs2InventoryVerifyItemSetMethodCache.put_cache(
            Gs2InventoryVerifyItemSetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyItemSetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyItemSetByUserId":
        Gs2InventoryVerifyItemSetByUserIdMethodCache.put_cache(
            Gs2InventoryVerifyItemSetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyItemSetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReferenceOf":
        Gs2InventoryDescribeReferenceOfMethodCache.put_cache(
            Gs2InventoryDescribeReferenceOfResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeReferenceOfRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReferenceOfByUserId":
        Gs2InventoryDescribeReferenceOfByUserIdMethodCache.put_cache(
            Gs2InventoryDescribeReferenceOfByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeReferenceOfByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReferenceOf":
        Gs2InventoryGetReferenceOfMethodCache.put_cache(
            Gs2InventoryGetReferenceOfResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetReferenceOfRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReferenceOfByUserId":
        Gs2InventoryGetReferenceOfByUserIdMethodCache.put_cache(
            Gs2InventoryGetReferenceOfByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetReferenceOfByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyReferenceOf":
        Gs2InventoryVerifyReferenceOfMethodCache.put_cache(
            Gs2InventoryVerifyReferenceOfResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyReferenceOfRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyReferenceOfByUserId":
        Gs2InventoryVerifyReferenceOfByUserIdMethodCache.put_cache(
            Gs2InventoryVerifyReferenceOfByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyReferenceOfByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addReferenceOf":
        Gs2InventoryAddReferenceOfMethodCache.put_cache(
            Gs2InventoryAddReferenceOfResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAddReferenceOfRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addReferenceOfByUserId":
        Gs2InventoryAddReferenceOfByUserIdMethodCache.put_cache(
            Gs2InventoryAddReferenceOfByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAddReferenceOfByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteReferenceOf":
        Gs2InventoryDeleteReferenceOfMethodCache.put_cache(
            Gs2InventoryDeleteReferenceOfResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteReferenceOfRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteReferenceOfByUserId":
        Gs2InventoryDeleteReferenceOfByUserIdMethodCache.put_cache(
            Gs2InventoryDeleteReferenceOfByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteReferenceOfByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSimpleItems":
        Gs2InventoryDescribeSimpleItemsMethodCache.put_cache(
            Gs2InventoryDescribeSimpleItemsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeSimpleItemsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSimpleItemsByUserId":
        Gs2InventoryDescribeSimpleItemsByUserIdMethodCache.put_cache(
            Gs2InventoryDescribeSimpleItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeSimpleItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleItem":
        Gs2InventoryGetSimpleItemMethodCache.put_cache(
            Gs2InventoryGetSimpleItemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleItemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleItemByUserId":
        Gs2InventoryGetSimpleItemByUserIdMethodCache.put_cache(
            Gs2InventoryGetSimpleItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleItemWithSignature":
        Gs2InventoryGetSimpleItemWithSignatureMethodCache.put_cache(
            Gs2InventoryGetSimpleItemWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleItemWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSimpleItemWithSignatureByUserId":
        Gs2InventoryGetSimpleItemWithSignatureByUserIdMethodCache.put_cache(
            Gs2InventoryGetSimpleItemWithSignatureByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetSimpleItemWithSignatureByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireSimpleItemsByUserId":
        Gs2InventoryAcquireSimpleItemsByUserIdMethodCache.put_cache(
            Gs2InventoryAcquireSimpleItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAcquireSimpleItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeSimpleItems":
        Gs2InventoryConsumeSimpleItemsMethodCache.put_cache(
            Gs2InventoryConsumeSimpleItemsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryConsumeSimpleItemsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeSimpleItemsByUserId":
        Gs2InventoryConsumeSimpleItemsByUserIdMethodCache.put_cache(
            Gs2InventoryConsumeSimpleItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryConsumeSimpleItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setSimpleItemsByUserId":
        Gs2InventorySetSimpleItemsByUserIdMethodCache.put_cache(
            Gs2InventorySetSimpleItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventorySetSimpleItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSimpleItemsByUserId":
        Gs2InventoryDeleteSimpleItemsByUserIdMethodCache.put_cache(
            Gs2InventoryDeleteSimpleItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteSimpleItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifySimpleItem":
        Gs2InventoryVerifySimpleItemMethodCache.put_cache(
            Gs2InventoryVerifySimpleItemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifySimpleItemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifySimpleItemByUserId":
        Gs2InventoryVerifySimpleItemByUserIdMethodCache.put_cache(
            Gs2InventoryVerifySimpleItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifySimpleItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBigItems":
        Gs2InventoryDescribeBigItemsMethodCache.put_cache(
            Gs2InventoryDescribeBigItemsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeBigItemsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBigItemsByUserId":
        Gs2InventoryDescribeBigItemsByUserIdMethodCache.put_cache(
            Gs2InventoryDescribeBigItemsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDescribeBigItemsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBigItem":
        Gs2InventoryGetBigItemMethodCache.put_cache(
            Gs2InventoryGetBigItemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetBigItemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBigItemByUserId":
        Gs2InventoryGetBigItemByUserIdMethodCache.put_cache(
            Gs2InventoryGetBigItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryGetBigItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquireBigItemByUserId":
        Gs2InventoryAcquireBigItemByUserIdMethodCache.put_cache(
            Gs2InventoryAcquireBigItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryAcquireBigItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeBigItem":
        Gs2InventoryConsumeBigItemMethodCache.put_cache(
            Gs2InventoryConsumeBigItemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryConsumeBigItemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeBigItemByUserId":
        Gs2InventoryConsumeBigItemByUserIdMethodCache.put_cache(
            Gs2InventoryConsumeBigItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryConsumeBigItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setBigItemByUserId":
        Gs2InventorySetBigItemByUserIdMethodCache.put_cache(
            Gs2InventorySetBigItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventorySetBigItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBigItemByUserId":
        Gs2InventoryDeleteBigItemByUserIdMethodCache.put_cache(
            Gs2InventoryDeleteBigItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryDeleteBigItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyBigItem":
        Gs2InventoryVerifyBigItemMethodCache.put_cache(
            Gs2InventoryVerifyBigItemResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyBigItemRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyBigItemByUserId":
        Gs2InventoryVerifyBigItemByUserIdMethodCache.put_cache(
            Gs2InventoryVerifyBigItemByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InventoryVerifyBigItemByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass