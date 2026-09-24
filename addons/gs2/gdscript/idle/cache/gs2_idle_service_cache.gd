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
class_name Gs2IdleServiceCache
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
    if kind == "status":
        var item = Gs2IdleStatus.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2IdleStatusCache.put_user_data(
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
    if kind == "status":
        cache.set_list_cached("Gs2IdleStatus", parent_key)
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
        Gs2IdleDescribeNamespacesMethodCache.put_cache(
            Gs2IdleDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2IdleCreateNamespaceMethodCache.put_cache(
            Gs2IdleCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2IdleGetNamespaceStatusMethodCache.put_cache(
            Gs2IdleGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2IdleGetNamespaceMethodCache.put_cache(
            Gs2IdleGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2IdleUpdateNamespaceMethodCache.put_cache(
            Gs2IdleUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2IdleDeleteNamespaceMethodCache.put_cache(
            Gs2IdleDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2IdleGetServiceVersionMethodCache.put_cache(
            Gs2IdleGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2IdleDumpUserDataByUserIdMethodCache.put_cache(
            Gs2IdleDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2IdleCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2IdleCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2IdleCleanUserDataByUserIdMethodCache.put_cache(
            Gs2IdleCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2IdleCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2IdleCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2IdlePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2IdlePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdlePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2IdleImportUserDataByUserIdMethodCache.put_cache(
            Gs2IdleImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2IdleCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2IdleCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCategoryModelMasters":
        Gs2IdleDescribeCategoryModelMastersMethodCache.put_cache(
            Gs2IdleDescribeCategoryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDescribeCategoryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createCategoryModelMaster":
        Gs2IdleCreateCategoryModelMasterMethodCache.put_cache(
            Gs2IdleCreateCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleCreateCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCategoryModelMaster":
        Gs2IdleGetCategoryModelMasterMethodCache.put_cache(
            Gs2IdleGetCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCategoryModelMaster":
        Gs2IdleUpdateCategoryModelMasterMethodCache.put_cache(
            Gs2IdleUpdateCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleUpdateCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCategoryModelMaster":
        Gs2IdleDeleteCategoryModelMasterMethodCache.put_cache(
            Gs2IdleDeleteCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDeleteCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCategoryModels":
        Gs2IdleDescribeCategoryModelsMethodCache.put_cache(
            Gs2IdleDescribeCategoryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDescribeCategoryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCategoryModel":
        Gs2IdleGetCategoryModelMethodCache.put_cache(
            Gs2IdleGetCategoryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetCategoryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatuses":
        Gs2IdleDescribeStatusesMethodCache.put_cache(
            Gs2IdleDescribeStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDescribeStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatusesByUserId":
        Gs2IdleDescribeStatusesByUserIdMethodCache.put_cache(
            Gs2IdleDescribeStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDescribeStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatus":
        Gs2IdleGetStatusMethodCache.put_cache(
            Gs2IdleGetStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusByUserId":
        Gs2IdleGetStatusByUserIdMethodCache.put_cache(
            Gs2IdleGetStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prediction":
        Gs2IdlePredictionMethodCache.put_cache(
            Gs2IdlePredictionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdlePredictionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "predictionByUserId":
        Gs2IdlePredictionByUserIdMethodCache.put_cache(
            Gs2IdlePredictionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdlePredictionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receive":
        Gs2IdleReceiveMethodCache.put_cache(
            Gs2IdleReceiveResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleReceiveRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveByUserId":
        Gs2IdleReceiveByUserIdMethodCache.put_cache(
            Gs2IdleReceiveByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleReceiveByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "increaseMaximumIdleMinutesByUserId":
        Gs2IdleIncreaseMaximumIdleMinutesByUserIdMethodCache.put_cache(
            Gs2IdleIncreaseMaximumIdleMinutesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseMaximumIdleMinutes":
        Gs2IdleDecreaseMaximumIdleMinutesMethodCache.put_cache(
            Gs2IdleDecreaseMaximumIdleMinutesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDecreaseMaximumIdleMinutesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseMaximumIdleMinutesByUserId":
        Gs2IdleDecreaseMaximumIdleMinutesByUserIdMethodCache.put_cache(
            Gs2IdleDecreaseMaximumIdleMinutesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleDecreaseMaximumIdleMinutesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setMaximumIdleMinutesByUserId":
        Gs2IdleSetMaximumIdleMinutesByUserIdMethodCache.put_cache(
            Gs2IdleSetMaximumIdleMinutesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleSetMaximumIdleMinutesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2IdleExportMasterMethodCache.put_cache(
            Gs2IdleExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentCategoryMaster":
        Gs2IdleGetCurrentCategoryMasterMethodCache.put_cache(
            Gs2IdleGetCurrentCategoryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleGetCurrentCategoryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentCategoryMaster":
        Gs2IdlePreUpdateCurrentCategoryMasterMethodCache.put_cache(
            Gs2IdlePreUpdateCurrentCategoryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdlePreUpdateCurrentCategoryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentCategoryMaster":
        Gs2IdleUpdateCurrentCategoryMasterMethodCache.put_cache(
            Gs2IdleUpdateCurrentCategoryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleUpdateCurrentCategoryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentCategoryMasterFromGitHub":
        Gs2IdleUpdateCurrentCategoryMasterFromGitHubMethodCache.put_cache(
            Gs2IdleUpdateCurrentCategoryMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2IdleUpdateCurrentCategoryMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass