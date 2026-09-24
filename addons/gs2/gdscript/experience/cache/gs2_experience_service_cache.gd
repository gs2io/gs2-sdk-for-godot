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
class_name Gs2ExperienceServiceCache
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
        var item = Gs2ExperienceStatus.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2ExperienceStatusCache.put_user_data(
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
        cache.set_list_cached("Gs2ExperienceStatus", parent_key)
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
        Gs2ExperienceDescribeNamespacesMethodCache.put_cache(
            Gs2ExperienceDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2ExperienceCreateNamespaceMethodCache.put_cache(
            Gs2ExperienceCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2ExperienceGetNamespaceStatusMethodCache.put_cache(
            Gs2ExperienceGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2ExperienceGetNamespaceMethodCache.put_cache(
            Gs2ExperienceGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2ExperienceUpdateNamespaceMethodCache.put_cache(
            Gs2ExperienceUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2ExperienceDeleteNamespaceMethodCache.put_cache(
            Gs2ExperienceDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ExperienceGetServiceVersionMethodCache.put_cache(
            Gs2ExperienceGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2ExperienceDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ExperienceDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2ExperienceCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ExperienceCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2ExperienceCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ExperienceCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2ExperienceCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ExperienceCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2ExperiencePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2ExperiencePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperiencePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2ExperienceImportUserDataByUserIdMethodCache.put_cache(
            Gs2ExperienceImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2ExperienceCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2ExperienceCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeExperienceModelMasters":
        Gs2ExperienceDescribeExperienceModelMastersMethodCache.put_cache(
            Gs2ExperienceDescribeExperienceModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDescribeExperienceModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createExperienceModelMaster":
        Gs2ExperienceCreateExperienceModelMasterMethodCache.put_cache(
            Gs2ExperienceCreateExperienceModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCreateExperienceModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getExperienceModelMaster":
        Gs2ExperienceGetExperienceModelMasterMethodCache.put_cache(
            Gs2ExperienceGetExperienceModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetExperienceModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateExperienceModelMaster":
        Gs2ExperienceUpdateExperienceModelMasterMethodCache.put_cache(
            Gs2ExperienceUpdateExperienceModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceUpdateExperienceModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteExperienceModelMaster":
        Gs2ExperienceDeleteExperienceModelMasterMethodCache.put_cache(
            Gs2ExperienceDeleteExperienceModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDeleteExperienceModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeExperienceModels":
        Gs2ExperienceDescribeExperienceModelsMethodCache.put_cache(
            Gs2ExperienceDescribeExperienceModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDescribeExperienceModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getExperienceModel":
        Gs2ExperienceGetExperienceModelMethodCache.put_cache(
            Gs2ExperienceGetExperienceModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetExperienceModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeThresholdMasters":
        Gs2ExperienceDescribeThresholdMastersMethodCache.put_cache(
            Gs2ExperienceDescribeThresholdMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDescribeThresholdMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createThresholdMaster":
        Gs2ExperienceCreateThresholdMasterMethodCache.put_cache(
            Gs2ExperienceCreateThresholdMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceCreateThresholdMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getThresholdMaster":
        Gs2ExperienceGetThresholdMasterMethodCache.put_cache(
            Gs2ExperienceGetThresholdMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetThresholdMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateThresholdMaster":
        Gs2ExperienceUpdateThresholdMasterMethodCache.put_cache(
            Gs2ExperienceUpdateThresholdMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceUpdateThresholdMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteThresholdMaster":
        Gs2ExperienceDeleteThresholdMasterMethodCache.put_cache(
            Gs2ExperienceDeleteThresholdMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDeleteThresholdMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2ExperienceExportMasterMethodCache.put_cache(
            Gs2ExperienceExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentExperienceMaster":
        Gs2ExperienceGetCurrentExperienceMasterMethodCache.put_cache(
            Gs2ExperienceGetCurrentExperienceMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetCurrentExperienceMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentExperienceMaster":
        Gs2ExperiencePreUpdateCurrentExperienceMasterMethodCache.put_cache(
            Gs2ExperiencePreUpdateCurrentExperienceMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperiencePreUpdateCurrentExperienceMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentExperienceMaster":
        Gs2ExperienceUpdateCurrentExperienceMasterMethodCache.put_cache(
            Gs2ExperienceUpdateCurrentExperienceMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceUpdateCurrentExperienceMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentExperienceMasterFromGitHub":
        Gs2ExperienceUpdateCurrentExperienceMasterFromGitHubMethodCache.put_cache(
            Gs2ExperienceUpdateCurrentExperienceMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceUpdateCurrentExperienceMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatuses":
        Gs2ExperienceDescribeStatusesMethodCache.put_cache(
            Gs2ExperienceDescribeStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDescribeStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatusesByUserId":
        Gs2ExperienceDescribeStatusesByUserIdMethodCache.put_cache(
            Gs2ExperienceDescribeStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDescribeStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatus":
        Gs2ExperienceGetStatusMethodCache.put_cache(
            Gs2ExperienceGetStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusByUserId":
        Gs2ExperienceGetStatusByUserIdMethodCache.put_cache(
            Gs2ExperienceGetStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusWithSignature":
        Gs2ExperienceGetStatusWithSignatureMethodCache.put_cache(
            Gs2ExperienceGetStatusWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetStatusWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusWithSignatureByUserId":
        Gs2ExperienceGetStatusWithSignatureByUserIdMethodCache.put_cache(
            Gs2ExperienceGetStatusWithSignatureByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceGetStatusWithSignatureByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addExperienceByUserId":
        Gs2ExperienceAddExperienceByUserIdMethodCache.put_cache(
            Gs2ExperienceAddExperienceByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceAddExperienceByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subExperience":
        Gs2ExperienceSubExperienceMethodCache.put_cache(
            Gs2ExperienceSubExperienceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceSubExperienceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subExperienceByUserId":
        Gs2ExperienceSubExperienceByUserIdMethodCache.put_cache(
            Gs2ExperienceSubExperienceByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceSubExperienceByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setExperienceByUserId":
        Gs2ExperienceSetExperienceByUserIdMethodCache.put_cache(
            Gs2ExperienceSetExperienceByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceSetExperienceByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addRankCapByUserId":
        Gs2ExperienceAddRankCapByUserIdMethodCache.put_cache(
            Gs2ExperienceAddRankCapByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceAddRankCapByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subRankCap":
        Gs2ExperienceSubRankCapMethodCache.put_cache(
            Gs2ExperienceSubRankCapResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceSubRankCapRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subRankCapByUserId":
        Gs2ExperienceSubRankCapByUserIdMethodCache.put_cache(
            Gs2ExperienceSubRankCapByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceSubRankCapByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setRankCapByUserId":
        Gs2ExperienceSetRankCapByUserIdMethodCache.put_cache(
            Gs2ExperienceSetRankCapByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceSetRankCapByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStatusByUserId":
        Gs2ExperienceDeleteStatusByUserIdMethodCache.put_cache(
            Gs2ExperienceDeleteStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceDeleteStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyRank":
        Gs2ExperienceVerifyRankMethodCache.put_cache(
            Gs2ExperienceVerifyRankResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceVerifyRankRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyRankByUserId":
        Gs2ExperienceVerifyRankByUserIdMethodCache.put_cache(
            Gs2ExperienceVerifyRankByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceVerifyRankByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyRankCap":
        Gs2ExperienceVerifyRankCapMethodCache.put_cache(
            Gs2ExperienceVerifyRankCapResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceVerifyRankCapRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyRankCapByUserId":
        Gs2ExperienceVerifyRankCapByUserIdMethodCache.put_cache(
            Gs2ExperienceVerifyRankCapByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceVerifyRankCapByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "multiplyAcquireActionsByUserId":
        Gs2ExperienceMultiplyAcquireActionsByUserIdMethodCache.put_cache(
            Gs2ExperienceMultiplyAcquireActionsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ExperienceMultiplyAcquireActionsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass