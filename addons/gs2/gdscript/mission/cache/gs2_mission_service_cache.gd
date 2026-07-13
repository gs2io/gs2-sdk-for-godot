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
class_name Gs2MissionServiceCache
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
    if method == "describeCompletes":
        Gs2MissionDescribeCompletesMethodCache.put_cache(
            Gs2MissionDescribeCompletesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeCompletesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCompletesByUserId":
        Gs2MissionDescribeCompletesByUserIdMethodCache.put_cache(
            Gs2MissionDescribeCompletesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeCompletesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "complete":
        Gs2MissionCompleteMethodCache.put_cache(
            Gs2MissionCompleteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCompleteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "completeByUserId":
        Gs2MissionCompleteByUserIdMethodCache.put_cache(
            Gs2MissionCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchComplete":
        Gs2MissionBatchCompleteMethodCache.put_cache(
            Gs2MissionBatchCompleteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionBatchCompleteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchCompleteByUserId":
        Gs2MissionBatchCompleteByUserIdMethodCache.put_cache(
            Gs2MissionBatchCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionBatchCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveByUserId":
        Gs2MissionReceiveByUserIdMethodCache.put_cache(
            Gs2MissionReceiveByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionReceiveByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchReceiveByUserId":
        Gs2MissionBatchReceiveByUserIdMethodCache.put_cache(
            Gs2MissionBatchReceiveByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionBatchReceiveByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "revertReceiveByUserId":
        Gs2MissionRevertReceiveByUserIdMethodCache.put_cache(
            Gs2MissionRevertReceiveByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionRevertReceiveByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getComplete":
        Gs2MissionGetCompleteMethodCache.put_cache(
            Gs2MissionGetCompleteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCompleteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCompleteByUserId":
        Gs2MissionGetCompleteByUserIdMethodCache.put_cache(
            Gs2MissionGetCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "evaluateComplete":
        Gs2MissionEvaluateCompleteMethodCache.put_cache(
            Gs2MissionEvaluateCompleteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionEvaluateCompleteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "evaluateCompleteByUserId":
        Gs2MissionEvaluateCompleteByUserIdMethodCache.put_cache(
            Gs2MissionEvaluateCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionEvaluateCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCompleteByUserId":
        Gs2MissionDeleteCompleteByUserIdMethodCache.put_cache(
            Gs2MissionDeleteCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyComplete":
        Gs2MissionVerifyCompleteMethodCache.put_cache(
            Gs2MissionVerifyCompleteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionVerifyCompleteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCompleteByUserId":
        Gs2MissionVerifyCompleteByUserIdMethodCache.put_cache(
            Gs2MissionVerifyCompleteByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionVerifyCompleteByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCounterModelMasters":
        Gs2MissionDescribeCounterModelMastersMethodCache.put_cache(
            Gs2MissionDescribeCounterModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeCounterModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createCounterModelMaster":
        Gs2MissionCreateCounterModelMasterMethodCache.put_cache(
            Gs2MissionCreateCounterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCreateCounterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCounterModelMaster":
        Gs2MissionGetCounterModelMasterMethodCache.put_cache(
            Gs2MissionGetCounterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCounterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCounterModelMaster":
        Gs2MissionUpdateCounterModelMasterMethodCache.put_cache(
            Gs2MissionUpdateCounterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionUpdateCounterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCounterModelMaster":
        Gs2MissionDeleteCounterModelMasterMethodCache.put_cache(
            Gs2MissionDeleteCounterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteCounterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMissionGroupModelMasters":
        Gs2MissionDescribeMissionGroupModelMastersMethodCache.put_cache(
            Gs2MissionDescribeMissionGroupModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeMissionGroupModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createMissionGroupModelMaster":
        Gs2MissionCreateMissionGroupModelMasterMethodCache.put_cache(
            Gs2MissionCreateMissionGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCreateMissionGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMissionGroupModelMaster":
        Gs2MissionGetMissionGroupModelMasterMethodCache.put_cache(
            Gs2MissionGetMissionGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetMissionGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMissionGroupModelMaster":
        Gs2MissionUpdateMissionGroupModelMasterMethodCache.put_cache(
            Gs2MissionUpdateMissionGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionUpdateMissionGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMissionGroupModelMaster":
        Gs2MissionDeleteMissionGroupModelMasterMethodCache.put_cache(
            Gs2MissionDeleteMissionGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteMissionGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeNamespaces":
        Gs2MissionDescribeNamespacesMethodCache.put_cache(
            Gs2MissionDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2MissionCreateNamespaceMethodCache.put_cache(
            Gs2MissionCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2MissionGetNamespaceStatusMethodCache.put_cache(
            Gs2MissionGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2MissionGetNamespaceMethodCache.put_cache(
            Gs2MissionGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2MissionUpdateNamespaceMethodCache.put_cache(
            Gs2MissionUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2MissionDeleteNamespaceMethodCache.put_cache(
            Gs2MissionDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2MissionGetServiceVersionMethodCache.put_cache(
            Gs2MissionGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2MissionDumpUserDataByUserIdMethodCache.put_cache(
            Gs2MissionDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2MissionCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2MissionCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2MissionCleanUserDataByUserIdMethodCache.put_cache(
            Gs2MissionCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2MissionCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2MissionCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2MissionPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2MissionPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2MissionImportUserDataByUserIdMethodCache.put_cache(
            Gs2MissionImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2MissionCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2MissionCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCounters":
        Gs2MissionDescribeCountersMethodCache.put_cache(
            Gs2MissionDescribeCountersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeCountersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCountersByUserId":
        Gs2MissionDescribeCountersByUserIdMethodCache.put_cache(
            Gs2MissionDescribeCountersByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeCountersByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "increaseCounterByUserId":
        Gs2MissionIncreaseCounterByUserIdMethodCache.put_cache(
            Gs2MissionIncreaseCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionIncreaseCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setCounterByUserId":
        Gs2MissionSetCounterByUserIdMethodCache.put_cache(
            Gs2MissionSetCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionSetCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseCounter":
        Gs2MissionDecreaseCounterMethodCache.put_cache(
            Gs2MissionDecreaseCounterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDecreaseCounterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseCounterByUserId":
        Gs2MissionDecreaseCounterByUserIdMethodCache.put_cache(
            Gs2MissionDecreaseCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDecreaseCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCounter":
        Gs2MissionGetCounterMethodCache.put_cache(
            Gs2MissionGetCounterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCounterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCounterByUserId":
        Gs2MissionGetCounterByUserIdMethodCache.put_cache(
            Gs2MissionGetCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCounterValue":
        Gs2MissionVerifyCounterValueMethodCache.put_cache(
            Gs2MissionVerifyCounterValueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionVerifyCounterValueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCounterValueByUserId":
        Gs2MissionVerifyCounterValueByUserIdMethodCache.put_cache(
            Gs2MissionVerifyCounterValueByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionVerifyCounterValueByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetCounter":
        Gs2MissionResetCounterMethodCache.put_cache(
            Gs2MissionResetCounterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionResetCounterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetCounterByUserId":
        Gs2MissionResetCounterByUserIdMethodCache.put_cache(
            Gs2MissionResetCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionResetCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCounter":
        Gs2MissionDeleteCounterMethodCache.put_cache(
            Gs2MissionDeleteCounterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteCounterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCounterByUserId":
        Gs2MissionDeleteCounterByUserIdMethodCache.put_cache(
            Gs2MissionDeleteCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2MissionExportMasterMethodCache.put_cache(
            Gs2MissionExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentMissionMaster":
        Gs2MissionGetCurrentMissionMasterMethodCache.put_cache(
            Gs2MissionGetCurrentMissionMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCurrentMissionMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentMissionMaster":
        Gs2MissionPreUpdateCurrentMissionMasterMethodCache.put_cache(
            Gs2MissionPreUpdateCurrentMissionMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionPreUpdateCurrentMissionMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentMissionMaster":
        Gs2MissionUpdateCurrentMissionMasterMethodCache.put_cache(
            Gs2MissionUpdateCurrentMissionMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionUpdateCurrentMissionMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentMissionMasterFromGitHub":
        Gs2MissionUpdateCurrentMissionMasterFromGitHubMethodCache.put_cache(
            Gs2MissionUpdateCurrentMissionMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionUpdateCurrentMissionMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCounterModels":
        Gs2MissionDescribeCounterModelsMethodCache.put_cache(
            Gs2MissionDescribeCounterModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeCounterModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCounterModel":
        Gs2MissionGetCounterModelMethodCache.put_cache(
            Gs2MissionGetCounterModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetCounterModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMissionGroupModels":
        Gs2MissionDescribeMissionGroupModelsMethodCache.put_cache(
            Gs2MissionDescribeMissionGroupModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeMissionGroupModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMissionGroupModel":
        Gs2MissionGetMissionGroupModelMethodCache.put_cache(
            Gs2MissionGetMissionGroupModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetMissionGroupModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMissionTaskModels":
        Gs2MissionDescribeMissionTaskModelsMethodCache.put_cache(
            Gs2MissionDescribeMissionTaskModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeMissionTaskModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMissionTaskModel":
        Gs2MissionGetMissionTaskModelMethodCache.put_cache(
            Gs2MissionGetMissionTaskModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetMissionTaskModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMissionTaskModelMasters":
        Gs2MissionDescribeMissionTaskModelMastersMethodCache.put_cache(
            Gs2MissionDescribeMissionTaskModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDescribeMissionTaskModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createMissionTaskModelMaster":
        Gs2MissionCreateMissionTaskModelMasterMethodCache.put_cache(
            Gs2MissionCreateMissionTaskModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionCreateMissionTaskModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMissionTaskModelMaster":
        Gs2MissionGetMissionTaskModelMasterMethodCache.put_cache(
            Gs2MissionGetMissionTaskModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionGetMissionTaskModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMissionTaskModelMaster":
        Gs2MissionUpdateMissionTaskModelMasterMethodCache.put_cache(
            Gs2MissionUpdateMissionTaskModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionUpdateMissionTaskModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMissionTaskModelMaster":
        Gs2MissionDeleteMissionTaskModelMasterMethodCache.put_cache(
            Gs2MissionDeleteMissionTaskModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2MissionDeleteMissionTaskModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    pass