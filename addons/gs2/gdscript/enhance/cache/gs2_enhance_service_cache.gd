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
class_name Gs2EnhanceServiceCache
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
    if kind == "progress":
        var item = Gs2EnhanceProgress.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2EnhanceProgressCache.put_user_data(
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
    if kind == "progress":
        cache.set_list_cached("Gs2EnhanceProgress", parent_key)
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
        Gs2EnhanceDescribeNamespacesMethodCache.put_cache(
            Gs2EnhanceDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2EnhanceCreateNamespaceMethodCache.put_cache(
            Gs2EnhanceCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2EnhanceGetNamespaceStatusMethodCache.put_cache(
            Gs2EnhanceGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2EnhanceGetNamespaceMethodCache.put_cache(
            Gs2EnhanceGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2EnhanceUpdateNamespaceMethodCache.put_cache(
            Gs2EnhanceUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2EnhanceDeleteNamespaceMethodCache.put_cache(
            Gs2EnhanceDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2EnhanceGetServiceVersionMethodCache.put_cache(
            Gs2EnhanceGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2EnhanceDumpUserDataByUserIdMethodCache.put_cache(
            Gs2EnhanceDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2EnhanceCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2EnhanceCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2EnhanceCleanUserDataByUserIdMethodCache.put_cache(
            Gs2EnhanceCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2EnhanceCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2EnhanceCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2EnhancePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2EnhancePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhancePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2EnhanceImportUserDataByUserIdMethodCache.put_cache(
            Gs2EnhanceImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2EnhanceCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2EnhanceCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRateModels":
        Gs2EnhanceDescribeRateModelsMethodCache.put_cache(
            Gs2EnhanceDescribeRateModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDescribeRateModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRateModel":
        Gs2EnhanceGetRateModelMethodCache.put_cache(
            Gs2EnhanceGetRateModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetRateModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRateModelMasters":
        Gs2EnhanceDescribeRateModelMastersMethodCache.put_cache(
            Gs2EnhanceDescribeRateModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDescribeRateModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRateModelMaster":
        Gs2EnhanceCreateRateModelMasterMethodCache.put_cache(
            Gs2EnhanceCreateRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCreateRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRateModelMaster":
        Gs2EnhanceGetRateModelMasterMethodCache.put_cache(
            Gs2EnhanceGetRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRateModelMaster":
        Gs2EnhanceUpdateRateModelMasterMethodCache.put_cache(
            Gs2EnhanceUpdateRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUpdateRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRateModelMaster":
        Gs2EnhanceDeleteRateModelMasterMethodCache.put_cache(
            Gs2EnhanceDeleteRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDeleteRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeUnleashRateModels":
        Gs2EnhanceDescribeUnleashRateModelsMethodCache.put_cache(
            Gs2EnhanceDescribeUnleashRateModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDescribeUnleashRateModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getUnleashRateModel":
        Gs2EnhanceGetUnleashRateModelMethodCache.put_cache(
            Gs2EnhanceGetUnleashRateModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetUnleashRateModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeUnleashRateModelMasters":
        Gs2EnhanceDescribeUnleashRateModelMastersMethodCache.put_cache(
            Gs2EnhanceDescribeUnleashRateModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDescribeUnleashRateModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createUnleashRateModelMaster":
        Gs2EnhanceCreateUnleashRateModelMasterMethodCache.put_cache(
            Gs2EnhanceCreateUnleashRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCreateUnleashRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getUnleashRateModelMaster":
        Gs2EnhanceGetUnleashRateModelMasterMethodCache.put_cache(
            Gs2EnhanceGetUnleashRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetUnleashRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateUnleashRateModelMaster":
        Gs2EnhanceUpdateUnleashRateModelMasterMethodCache.put_cache(
            Gs2EnhanceUpdateUnleashRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUpdateUnleashRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteUnleashRateModelMaster":
        Gs2EnhanceDeleteUnleashRateModelMasterMethodCache.put_cache(
            Gs2EnhanceDeleteUnleashRateModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDeleteUnleashRateModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "directEnhance":
        Gs2EnhanceDirectEnhanceMethodCache.put_cache(
            Gs2EnhanceDirectEnhanceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDirectEnhanceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "directEnhanceByUserId":
        Gs2EnhanceDirectEnhanceByUserIdMethodCache.put_cache(
            Gs2EnhanceDirectEnhanceByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDirectEnhanceByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unleash":
        Gs2EnhanceUnleashMethodCache.put_cache(
            Gs2EnhanceUnleashResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUnleashRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unleashByUserId":
        Gs2EnhanceUnleashByUserIdMethodCache.put_cache(
            Gs2EnhanceUnleashByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUnleashByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createProgressByUserId":
        Gs2EnhanceCreateProgressByUserIdMethodCache.put_cache(
            Gs2EnhanceCreateProgressByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceCreateProgressByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProgress":
        Gs2EnhanceGetProgressMethodCache.put_cache(
            Gs2EnhanceGetProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProgressByUserId":
        Gs2EnhanceGetProgressByUserIdMethodCache.put_cache(
            Gs2EnhanceGetProgressByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetProgressByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "start":
        Gs2EnhanceStartMethodCache.put_cache(
            Gs2EnhanceStartResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceStartRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "startByUserId":
        Gs2EnhanceStartByUserIdMethodCache.put_cache(
            Gs2EnhanceStartByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceStartByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "end":
        Gs2EnhanceEndMethodCache.put_cache(
            Gs2EnhanceEndResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceEndRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "endByUserId":
        Gs2EnhanceEndByUserIdMethodCache.put_cache(
            Gs2EnhanceEndByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceEndByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteProgress":
        Gs2EnhanceDeleteProgressMethodCache.put_cache(
            Gs2EnhanceDeleteProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDeleteProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteProgressByUserId":
        Gs2EnhanceDeleteProgressByUserIdMethodCache.put_cache(
            Gs2EnhanceDeleteProgressByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceDeleteProgressByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2EnhanceExportMasterMethodCache.put_cache(
            Gs2EnhanceExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentRateMaster":
        Gs2EnhanceGetCurrentRateMasterMethodCache.put_cache(
            Gs2EnhanceGetCurrentRateMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceGetCurrentRateMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentRateMaster":
        Gs2EnhancePreUpdateCurrentRateMasterMethodCache.put_cache(
            Gs2EnhancePreUpdateCurrentRateMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhancePreUpdateCurrentRateMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRateMaster":
        Gs2EnhanceUpdateCurrentRateMasterMethodCache.put_cache(
            Gs2EnhanceUpdateCurrentRateMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUpdateCurrentRateMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRateMasterFromGitHub":
        Gs2EnhanceUpdateCurrentRateMasterFromGitHubMethodCache.put_cache(
            Gs2EnhanceUpdateCurrentRateMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnhanceUpdateCurrentRateMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass