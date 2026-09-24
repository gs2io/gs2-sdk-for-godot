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
class_name Gs2StaminaServiceCache
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
    if kind == "stamina":
        var item = Gs2StaminaStamina.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2StaminaStaminaCache.put_user_data(
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
    if kind == "stamina":
        cache.set_list_cached("Gs2StaminaStamina", parent_key)
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
        Gs2StaminaDescribeNamespacesMethodCache.put_cache(
            Gs2StaminaDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2StaminaCreateNamespaceMethodCache.put_cache(
            Gs2StaminaCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2StaminaGetNamespaceStatusMethodCache.put_cache(
            Gs2StaminaGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2StaminaGetNamespaceMethodCache.put_cache(
            Gs2StaminaGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2StaminaUpdateNamespaceMethodCache.put_cache(
            Gs2StaminaUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2StaminaDeleteNamespaceMethodCache.put_cache(
            Gs2StaminaDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2StaminaGetServiceVersionMethodCache.put_cache(
            Gs2StaminaGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2StaminaDumpUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2StaminaCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2StaminaCleanUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2StaminaCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2StaminaPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2StaminaImportUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2StaminaCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2StaminaCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStaminaModelMasters":
        Gs2StaminaDescribeStaminaModelMastersMethodCache.put_cache(
            Gs2StaminaDescribeStaminaModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeStaminaModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createStaminaModelMaster":
        Gs2StaminaCreateStaminaModelMasterMethodCache.put_cache(
            Gs2StaminaCreateStaminaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCreateStaminaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStaminaModelMaster":
        Gs2StaminaGetStaminaModelMasterMethodCache.put_cache(
            Gs2StaminaGetStaminaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetStaminaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStaminaModelMaster":
        Gs2StaminaUpdateStaminaModelMasterMethodCache.put_cache(
            Gs2StaminaUpdateStaminaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateStaminaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStaminaModelMaster":
        Gs2StaminaDeleteStaminaModelMasterMethodCache.put_cache(
            Gs2StaminaDeleteStaminaModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDeleteStaminaModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMaxStaminaTableMasters":
        Gs2StaminaDescribeMaxStaminaTableMastersMethodCache.put_cache(
            Gs2StaminaDescribeMaxStaminaTableMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeMaxStaminaTableMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createMaxStaminaTableMaster":
        Gs2StaminaCreateMaxStaminaTableMasterMethodCache.put_cache(
            Gs2StaminaCreateMaxStaminaTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCreateMaxStaminaTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMaxStaminaTableMaster":
        Gs2StaminaGetMaxStaminaTableMasterMethodCache.put_cache(
            Gs2StaminaGetMaxStaminaTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetMaxStaminaTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMaxStaminaTableMaster":
        Gs2StaminaUpdateMaxStaminaTableMasterMethodCache.put_cache(
            Gs2StaminaUpdateMaxStaminaTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateMaxStaminaTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMaxStaminaTableMaster":
        Gs2StaminaDeleteMaxStaminaTableMasterMethodCache.put_cache(
            Gs2StaminaDeleteMaxStaminaTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDeleteMaxStaminaTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRecoverIntervalTableMasters":
        Gs2StaminaDescribeRecoverIntervalTableMastersMethodCache.put_cache(
            Gs2StaminaDescribeRecoverIntervalTableMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeRecoverIntervalTableMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRecoverIntervalTableMaster":
        Gs2StaminaCreateRecoverIntervalTableMasterMethodCache.put_cache(
            Gs2StaminaCreateRecoverIntervalTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCreateRecoverIntervalTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRecoverIntervalTableMaster":
        Gs2StaminaGetRecoverIntervalTableMasterMethodCache.put_cache(
            Gs2StaminaGetRecoverIntervalTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetRecoverIntervalTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRecoverIntervalTableMaster":
        Gs2StaminaUpdateRecoverIntervalTableMasterMethodCache.put_cache(
            Gs2StaminaUpdateRecoverIntervalTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateRecoverIntervalTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRecoverIntervalTableMaster":
        Gs2StaminaDeleteRecoverIntervalTableMasterMethodCache.put_cache(
            Gs2StaminaDeleteRecoverIntervalTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDeleteRecoverIntervalTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRecoverValueTableMasters":
        Gs2StaminaDescribeRecoverValueTableMastersMethodCache.put_cache(
            Gs2StaminaDescribeRecoverValueTableMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeRecoverValueTableMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRecoverValueTableMaster":
        Gs2StaminaCreateRecoverValueTableMasterMethodCache.put_cache(
            Gs2StaminaCreateRecoverValueTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaCreateRecoverValueTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRecoverValueTableMaster":
        Gs2StaminaGetRecoverValueTableMasterMethodCache.put_cache(
            Gs2StaminaGetRecoverValueTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetRecoverValueTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRecoverValueTableMaster":
        Gs2StaminaUpdateRecoverValueTableMasterMethodCache.put_cache(
            Gs2StaminaUpdateRecoverValueTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateRecoverValueTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRecoverValueTableMaster":
        Gs2StaminaDeleteRecoverValueTableMasterMethodCache.put_cache(
            Gs2StaminaDeleteRecoverValueTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDeleteRecoverValueTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2StaminaExportMasterMethodCache.put_cache(
            Gs2StaminaExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentStaminaMaster":
        Gs2StaminaGetCurrentStaminaMasterMethodCache.put_cache(
            Gs2StaminaGetCurrentStaminaMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetCurrentStaminaMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentStaminaMaster":
        Gs2StaminaPreUpdateCurrentStaminaMasterMethodCache.put_cache(
            Gs2StaminaPreUpdateCurrentStaminaMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaPreUpdateCurrentStaminaMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentStaminaMaster":
        Gs2StaminaUpdateCurrentStaminaMasterMethodCache.put_cache(
            Gs2StaminaUpdateCurrentStaminaMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateCurrentStaminaMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentStaminaMasterFromGitHub":
        Gs2StaminaUpdateCurrentStaminaMasterFromGitHubMethodCache.put_cache(
            Gs2StaminaUpdateCurrentStaminaMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateCurrentStaminaMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStaminaModels":
        Gs2StaminaDescribeStaminaModelsMethodCache.put_cache(
            Gs2StaminaDescribeStaminaModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeStaminaModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStaminaModel":
        Gs2StaminaGetStaminaModelMethodCache.put_cache(
            Gs2StaminaGetStaminaModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetStaminaModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStaminas":
        Gs2StaminaDescribeStaminasMethodCache.put_cache(
            Gs2StaminaDescribeStaminasResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeStaminasRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStaminasByUserId":
        Gs2StaminaDescribeStaminasByUserIdMethodCache.put_cache(
            Gs2StaminaDescribeStaminasByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDescribeStaminasByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStamina":
        Gs2StaminaGetStaminaMethodCache.put_cache(
            Gs2StaminaGetStaminaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetStaminaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStaminaByUserId":
        Gs2StaminaGetStaminaByUserIdMethodCache.put_cache(
            Gs2StaminaGetStaminaByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaGetStaminaByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateStaminaByUserId":
        Gs2StaminaUpdateStaminaByUserIdMethodCache.put_cache(
            Gs2StaminaUpdateStaminaByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaUpdateStaminaByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeStamina":
        Gs2StaminaConsumeStaminaMethodCache.put_cache(
            Gs2StaminaConsumeStaminaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaConsumeStaminaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumeStaminaByUserId":
        Gs2StaminaConsumeStaminaByUserIdMethodCache.put_cache(
            Gs2StaminaConsumeStaminaByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaConsumeStaminaByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "applyStamina":
        Gs2StaminaApplyStaminaMethodCache.put_cache(
            Gs2StaminaApplyStaminaResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaApplyStaminaRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "applyStaminaByUserId":
        Gs2StaminaApplyStaminaByUserIdMethodCache.put_cache(
            Gs2StaminaApplyStaminaByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaApplyStaminaByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "recoverStaminaByUserId":
        Gs2StaminaRecoverStaminaByUserIdMethodCache.put_cache(
            Gs2StaminaRecoverStaminaByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaRecoverStaminaByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "raiseMaxValueByUserId":
        Gs2StaminaRaiseMaxValueByUserIdMethodCache.put_cache(
            Gs2StaminaRaiseMaxValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaRaiseMaxValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseMaxValue":
        Gs2StaminaDecreaseMaxValueMethodCache.put_cache(
            Gs2StaminaDecreaseMaxValueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDecreaseMaxValueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseMaxValueByUserId":
        Gs2StaminaDecreaseMaxValueByUserIdMethodCache.put_cache(
            Gs2StaminaDecreaseMaxValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDecreaseMaxValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setMaxValueByUserId":
        Gs2StaminaSetMaxValueByUserIdMethodCache.put_cache(
            Gs2StaminaSetMaxValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaSetMaxValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setRecoverIntervalByUserId":
        Gs2StaminaSetRecoverIntervalByUserIdMethodCache.put_cache(
            Gs2StaminaSetRecoverIntervalByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaSetRecoverIntervalByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setRecoverValueByUserId":
        Gs2StaminaSetRecoverValueByUserIdMethodCache.put_cache(
            Gs2StaminaSetRecoverValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaSetRecoverValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setMaxValueByStatus":
        Gs2StaminaSetMaxValueByStatusMethodCache.put_cache(
            Gs2StaminaSetMaxValueByStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaSetMaxValueByStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setRecoverIntervalByStatus":
        Gs2StaminaSetRecoverIntervalByStatusMethodCache.put_cache(
            Gs2StaminaSetRecoverIntervalByStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaSetRecoverIntervalByStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setRecoverValueByStatus":
        Gs2StaminaSetRecoverValueByStatusMethodCache.put_cache(
            Gs2StaminaSetRecoverValueByStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaSetRecoverValueByStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStaminaByUserId":
        Gs2StaminaDeleteStaminaByUserIdMethodCache.put_cache(
            Gs2StaminaDeleteStaminaByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaDeleteStaminaByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaValue":
        Gs2StaminaVerifyStaminaValueMethodCache.put_cache(
            Gs2StaminaVerifyStaminaValueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaValueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaValueByUserId":
        Gs2StaminaVerifyStaminaValueByUserIdMethodCache.put_cache(
            Gs2StaminaVerifyStaminaValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaMaxValue":
        Gs2StaminaVerifyStaminaMaxValueMethodCache.put_cache(
            Gs2StaminaVerifyStaminaMaxValueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaMaxValueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaMaxValueByUserId":
        Gs2StaminaVerifyStaminaMaxValueByUserIdMethodCache.put_cache(
            Gs2StaminaVerifyStaminaMaxValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaMaxValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaRecoverIntervalMinutes":
        Gs2StaminaVerifyStaminaRecoverIntervalMinutesMethodCache.put_cache(
            Gs2StaminaVerifyStaminaRecoverIntervalMinutesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaRecoverIntervalMinutesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaRecoverIntervalMinutesByUserId":
        Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdMethodCache.put_cache(
            Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaRecoverValue":
        Gs2StaminaVerifyStaminaRecoverValueMethodCache.put_cache(
            Gs2StaminaVerifyStaminaRecoverValueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaRecoverValueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaRecoverValueByUserId":
        Gs2StaminaVerifyStaminaRecoverValueByUserIdMethodCache.put_cache(
            Gs2StaminaVerifyStaminaRecoverValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaRecoverValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaOverflowValue":
        Gs2StaminaVerifyStaminaOverflowValueMethodCache.put_cache(
            Gs2StaminaVerifyStaminaOverflowValueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaOverflowValueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyStaminaOverflowValueByUserId":
        Gs2StaminaVerifyStaminaOverflowValueByUserIdMethodCache.put_cache(
            Gs2StaminaVerifyStaminaOverflowValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2StaminaVerifyStaminaOverflowValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass