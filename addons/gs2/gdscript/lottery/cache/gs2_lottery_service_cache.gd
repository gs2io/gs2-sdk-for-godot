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
class_name Gs2LotteryServiceCache
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
        Gs2LotteryDescribeNamespacesMethodCache.put_cache(
            Gs2LotteryDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2LotteryCreateNamespaceMethodCache.put_cache(
            Gs2LotteryCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2LotteryGetNamespaceStatusMethodCache.put_cache(
            Gs2LotteryGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2LotteryGetNamespaceMethodCache.put_cache(
            Gs2LotteryGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2LotteryUpdateNamespaceMethodCache.put_cache(
            Gs2LotteryUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2LotteryDeleteNamespaceMethodCache.put_cache(
            Gs2LotteryDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2LotteryGetServiceVersionMethodCache.put_cache(
            Gs2LotteryGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2LotteryDumpUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2LotteryCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2LotteryCleanUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2LotteryCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2LotteryPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2LotteryImportUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2LotteryCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2LotteryCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLotteryModelMasters":
        Gs2LotteryDescribeLotteryModelMastersMethodCache.put_cache(
            Gs2LotteryDescribeLotteryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeLotteryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createLotteryModelMaster":
        Gs2LotteryCreateLotteryModelMasterMethodCache.put_cache(
            Gs2LotteryCreateLotteryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCreateLotteryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLotteryModelMaster":
        Gs2LotteryGetLotteryModelMasterMethodCache.put_cache(
            Gs2LotteryGetLotteryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetLotteryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateLotteryModelMaster":
        Gs2LotteryUpdateLotteryModelMasterMethodCache.put_cache(
            Gs2LotteryUpdateLotteryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryUpdateLotteryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteLotteryModelMaster":
        Gs2LotteryDeleteLotteryModelMasterMethodCache.put_cache(
            Gs2LotteryDeleteLotteryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDeleteLotteryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePrizeTableMasters":
        Gs2LotteryDescribePrizeTableMastersMethodCache.put_cache(
            Gs2LotteryDescribePrizeTableMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribePrizeTableMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createPrizeTableMaster":
        Gs2LotteryCreatePrizeTableMasterMethodCache.put_cache(
            Gs2LotteryCreatePrizeTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryCreatePrizeTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPrizeTableMaster":
        Gs2LotteryGetPrizeTableMasterMethodCache.put_cache(
            Gs2LotteryGetPrizeTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetPrizeTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updatePrizeTableMaster":
        Gs2LotteryUpdatePrizeTableMasterMethodCache.put_cache(
            Gs2LotteryUpdatePrizeTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryUpdatePrizeTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePrizeTableMaster":
        Gs2LotteryDeletePrizeTableMasterMethodCache.put_cache(
            Gs2LotteryDeletePrizeTableMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDeletePrizeTableMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLotteryModels":
        Gs2LotteryDescribeLotteryModelsMethodCache.put_cache(
            Gs2LotteryDescribeLotteryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeLotteryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLotteryModel":
        Gs2LotteryGetLotteryModelMethodCache.put_cache(
            Gs2LotteryGetLotteryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetLotteryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePrizeTables":
        Gs2LotteryDescribePrizeTablesMethodCache.put_cache(
            Gs2LotteryDescribePrizeTablesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribePrizeTablesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPrizeTable":
        Gs2LotteryGetPrizeTableMethodCache.put_cache(
            Gs2LotteryGetPrizeTableResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetPrizeTableRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "drawByUserId":
        Gs2LotteryDrawByUserIdMethodCache.put_cache(
            Gs2LotteryDrawByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDrawByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prediction":
        Gs2LotteryPredictionMethodCache.put_cache(
            Gs2LotteryPredictionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryPredictionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "predictionByUserId":
        Gs2LotteryPredictionByUserIdMethodCache.put_cache(
            Gs2LotteryPredictionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryPredictionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "drawWithRandomSeedByUserId":
        Gs2LotteryDrawWithRandomSeedByUserIdMethodCache.put_cache(
            Gs2LotteryDrawWithRandomSeedByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDrawWithRandomSeedByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeProbabilities":
        Gs2LotteryDescribeProbabilitiesMethodCache.put_cache(
            Gs2LotteryDescribeProbabilitiesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeProbabilitiesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeProbabilitiesByUserId":
        Gs2LotteryDescribeProbabilitiesByUserIdMethodCache.put_cache(
            Gs2LotteryDescribeProbabilitiesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeProbabilitiesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2LotteryExportMasterMethodCache.put_cache(
            Gs2LotteryExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentLotteryMaster":
        Gs2LotteryGetCurrentLotteryMasterMethodCache.put_cache(
            Gs2LotteryGetCurrentLotteryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetCurrentLotteryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentLotteryMaster":
        Gs2LotteryPreUpdateCurrentLotteryMasterMethodCache.put_cache(
            Gs2LotteryPreUpdateCurrentLotteryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryPreUpdateCurrentLotteryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentLotteryMaster":
        Gs2LotteryUpdateCurrentLotteryMasterMethodCache.put_cache(
            Gs2LotteryUpdateCurrentLotteryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryUpdateCurrentLotteryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentLotteryMasterFromGitHub":
        Gs2LotteryUpdateCurrentLotteryMasterFromGitHubMethodCache.put_cache(
            Gs2LotteryUpdateCurrentLotteryMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryUpdateCurrentLotteryMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePrizeLimits":
        Gs2LotteryDescribePrizeLimitsMethodCache.put_cache(
            Gs2LotteryDescribePrizeLimitsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribePrizeLimitsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPrizeLimit":
        Gs2LotteryGetPrizeLimitMethodCache.put_cache(
            Gs2LotteryGetPrizeLimitResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetPrizeLimitRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetPrizeLimit":
        Gs2LotteryResetPrizeLimitMethodCache.put_cache(
            Gs2LotteryResetPrizeLimitResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryResetPrizeLimitRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBoxes":
        Gs2LotteryDescribeBoxesMethodCache.put_cache(
            Gs2LotteryDescribeBoxesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeBoxesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBoxesByUserId":
        Gs2LotteryDescribeBoxesByUserIdMethodCache.put_cache(
            Gs2LotteryDescribeBoxesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryDescribeBoxesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBox":
        Gs2LotteryGetBoxMethodCache.put_cache(
            Gs2LotteryGetBoxResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetBoxRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBoxByUserId":
        Gs2LotteryGetBoxByUserIdMethodCache.put_cache(
            Gs2LotteryGetBoxByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryGetBoxByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetBox":
        Gs2LotteryResetBoxMethodCache.put_cache(
            Gs2LotteryResetBoxResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryResetBoxRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetBoxByUserId":
        Gs2LotteryResetBoxByUserIdMethodCache.put_cache(
            Gs2LotteryResetBoxByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LotteryResetBoxByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass