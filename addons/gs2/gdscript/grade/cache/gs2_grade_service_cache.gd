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
class_name Gs2GradeServiceCache
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
        Gs2GradeDescribeNamespacesMethodCache.put_cache(
            Gs2GradeDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2GradeCreateNamespaceMethodCache.put_cache(
            Gs2GradeCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2GradeGetNamespaceStatusMethodCache.put_cache(
            Gs2GradeGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2GradeGetNamespaceMethodCache.put_cache(
            Gs2GradeGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2GradeUpdateNamespaceMethodCache.put_cache(
            Gs2GradeUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2GradeDeleteNamespaceMethodCache.put_cache(
            Gs2GradeDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2GradeGetServiceVersionMethodCache.put_cache(
            Gs2GradeGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2GradeDumpUserDataByUserIdMethodCache.put_cache(
            Gs2GradeDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2GradeCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2GradeCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2GradeCleanUserDataByUserIdMethodCache.put_cache(
            Gs2GradeCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2GradeCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2GradeCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2GradePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2GradePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2GradeImportUserDataByUserIdMethodCache.put_cache(
            Gs2GradeImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2GradeCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2GradeCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGradeModelMasters":
        Gs2GradeDescribeGradeModelMastersMethodCache.put_cache(
            Gs2GradeDescribeGradeModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDescribeGradeModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGradeModelMaster":
        Gs2GradeCreateGradeModelMasterMethodCache.put_cache(
            Gs2GradeCreateGradeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeCreateGradeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGradeModelMaster":
        Gs2GradeGetGradeModelMasterMethodCache.put_cache(
            Gs2GradeGetGradeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetGradeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGradeModelMaster":
        Gs2GradeUpdateGradeModelMasterMethodCache.put_cache(
            Gs2GradeUpdateGradeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeUpdateGradeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGradeModelMaster":
        Gs2GradeDeleteGradeModelMasterMethodCache.put_cache(
            Gs2GradeDeleteGradeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDeleteGradeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGradeModels":
        Gs2GradeDescribeGradeModelsMethodCache.put_cache(
            Gs2GradeDescribeGradeModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDescribeGradeModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGradeModel":
        Gs2GradeGetGradeModelMethodCache.put_cache(
            Gs2GradeGetGradeModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetGradeModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatuses":
        Gs2GradeDescribeStatusesMethodCache.put_cache(
            Gs2GradeDescribeStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDescribeStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatusesByUserId":
        Gs2GradeDescribeStatusesByUserIdMethodCache.put_cache(
            Gs2GradeDescribeStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDescribeStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatus":
        Gs2GradeGetStatusMethodCache.put_cache(
            Gs2GradeGetStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusByUserId":
        Gs2GradeGetStatusByUserIdMethodCache.put_cache(
            Gs2GradeGetStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addGradeByUserId":
        Gs2GradeAddGradeByUserIdMethodCache.put_cache(
            Gs2GradeAddGradeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeAddGradeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subGrade":
        Gs2GradeSubGradeMethodCache.put_cache(
            Gs2GradeSubGradeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeSubGradeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subGradeByUserId":
        Gs2GradeSubGradeByUserIdMethodCache.put_cache(
            Gs2GradeSubGradeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeSubGradeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setGradeByUserId":
        Gs2GradeSetGradeByUserIdMethodCache.put_cache(
            Gs2GradeSetGradeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeSetGradeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "applyRankCap":
        Gs2GradeApplyRankCapMethodCache.put_cache(
            Gs2GradeApplyRankCapResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeApplyRankCapRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "applyRankCapByUserId":
        Gs2GradeApplyRankCapByUserIdMethodCache.put_cache(
            Gs2GradeApplyRankCapByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeApplyRankCapByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteStatusByUserId":
        Gs2GradeDeleteStatusByUserIdMethodCache.put_cache(
            Gs2GradeDeleteStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeDeleteStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyGrade":
        Gs2GradeVerifyGradeMethodCache.put_cache(
            Gs2GradeVerifyGradeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeVerifyGradeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyGradeByUserId":
        Gs2GradeVerifyGradeByUserIdMethodCache.put_cache(
            Gs2GradeVerifyGradeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeVerifyGradeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyGradeUpMaterial":
        Gs2GradeVerifyGradeUpMaterialMethodCache.put_cache(
            Gs2GradeVerifyGradeUpMaterialResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeVerifyGradeUpMaterialRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyGradeUpMaterialByUserId":
        Gs2GradeVerifyGradeUpMaterialByUserIdMethodCache.put_cache(
            Gs2GradeVerifyGradeUpMaterialByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeVerifyGradeUpMaterialByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "multiplyAcquireActionsByUserId":
        Gs2GradeMultiplyAcquireActionsByUserIdMethodCache.put_cache(
            Gs2GradeMultiplyAcquireActionsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeMultiplyAcquireActionsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2GradeExportMasterMethodCache.put_cache(
            Gs2GradeExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentGradeMaster":
        Gs2GradeGetCurrentGradeMasterMethodCache.put_cache(
            Gs2GradeGetCurrentGradeMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeGetCurrentGradeMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentGradeMaster":
        Gs2GradePreUpdateCurrentGradeMasterMethodCache.put_cache(
            Gs2GradePreUpdateCurrentGradeMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradePreUpdateCurrentGradeMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentGradeMaster":
        Gs2GradeUpdateCurrentGradeMasterMethodCache.put_cache(
            Gs2GradeUpdateCurrentGradeMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeUpdateCurrentGradeMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentGradeMasterFromGitHub":
        Gs2GradeUpdateCurrentGradeMasterFromGitHubMethodCache.put_cache(
            Gs2GradeUpdateCurrentGradeMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GradeUpdateCurrentGradeMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass