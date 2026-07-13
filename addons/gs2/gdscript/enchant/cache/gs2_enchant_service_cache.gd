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
class_name Gs2EnchantServiceCache
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
        Gs2EnchantDescribeNamespacesMethodCache.put_cache(
            Gs2EnchantDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2EnchantCreateNamespaceMethodCache.put_cache(
            Gs2EnchantCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2EnchantGetNamespaceStatusMethodCache.put_cache(
            Gs2EnchantGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2EnchantGetNamespaceMethodCache.put_cache(
            Gs2EnchantGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2EnchantUpdateNamespaceMethodCache.put_cache(
            Gs2EnchantUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2EnchantDeleteNamespaceMethodCache.put_cache(
            Gs2EnchantDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2EnchantGetServiceVersionMethodCache.put_cache(
            Gs2EnchantGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2EnchantDumpUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2EnchantCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2EnchantCleanUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2EnchantCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2EnchantPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2EnchantImportUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2EnchantCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2EnchantCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBalanceParameterModels":
        Gs2EnchantDescribeBalanceParameterModelsMethodCache.put_cache(
            Gs2EnchantDescribeBalanceParameterModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeBalanceParameterModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBalanceParameterModel":
        Gs2EnchantGetBalanceParameterModelMethodCache.put_cache(
            Gs2EnchantGetBalanceParameterModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetBalanceParameterModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBalanceParameterModelMasters":
        Gs2EnchantDescribeBalanceParameterModelMastersMethodCache.put_cache(
            Gs2EnchantDescribeBalanceParameterModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeBalanceParameterModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createBalanceParameterModelMaster":
        Gs2EnchantCreateBalanceParameterModelMasterMethodCache.put_cache(
            Gs2EnchantCreateBalanceParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCreateBalanceParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBalanceParameterModelMaster":
        Gs2EnchantGetBalanceParameterModelMasterMethodCache.put_cache(
            Gs2EnchantGetBalanceParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetBalanceParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBalanceParameterModelMaster":
        Gs2EnchantUpdateBalanceParameterModelMasterMethodCache.put_cache(
            Gs2EnchantUpdateBalanceParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantUpdateBalanceParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBalanceParameterModelMaster":
        Gs2EnchantDeleteBalanceParameterModelMasterMethodCache.put_cache(
            Gs2EnchantDeleteBalanceParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDeleteBalanceParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRarityParameterModels":
        Gs2EnchantDescribeRarityParameterModelsMethodCache.put_cache(
            Gs2EnchantDescribeRarityParameterModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeRarityParameterModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRarityParameterModel":
        Gs2EnchantGetRarityParameterModelMethodCache.put_cache(
            Gs2EnchantGetRarityParameterModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetRarityParameterModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRarityParameterModelMasters":
        Gs2EnchantDescribeRarityParameterModelMastersMethodCache.put_cache(
            Gs2EnchantDescribeRarityParameterModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeRarityParameterModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRarityParameterModelMaster":
        Gs2EnchantCreateRarityParameterModelMasterMethodCache.put_cache(
            Gs2EnchantCreateRarityParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantCreateRarityParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRarityParameterModelMaster":
        Gs2EnchantGetRarityParameterModelMasterMethodCache.put_cache(
            Gs2EnchantGetRarityParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetRarityParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRarityParameterModelMaster":
        Gs2EnchantUpdateRarityParameterModelMasterMethodCache.put_cache(
            Gs2EnchantUpdateRarityParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantUpdateRarityParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRarityParameterModelMaster":
        Gs2EnchantDeleteRarityParameterModelMasterMethodCache.put_cache(
            Gs2EnchantDeleteRarityParameterModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDeleteRarityParameterModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2EnchantExportMasterMethodCache.put_cache(
            Gs2EnchantExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentParameterMaster":
        Gs2EnchantGetCurrentParameterMasterMethodCache.put_cache(
            Gs2EnchantGetCurrentParameterMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetCurrentParameterMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentParameterMaster":
        Gs2EnchantPreUpdateCurrentParameterMasterMethodCache.put_cache(
            Gs2EnchantPreUpdateCurrentParameterMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantPreUpdateCurrentParameterMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentParameterMaster":
        Gs2EnchantUpdateCurrentParameterMasterMethodCache.put_cache(
            Gs2EnchantUpdateCurrentParameterMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantUpdateCurrentParameterMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentParameterMasterFromGitHub":
        Gs2EnchantUpdateCurrentParameterMasterFromGitHubMethodCache.put_cache(
            Gs2EnchantUpdateCurrentParameterMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantUpdateCurrentParameterMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBalanceParameterStatuses":
        Gs2EnchantDescribeBalanceParameterStatusesMethodCache.put_cache(
            Gs2EnchantDescribeBalanceParameterStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeBalanceParameterStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBalanceParameterStatusesByUserId":
        Gs2EnchantDescribeBalanceParameterStatusesByUserIdMethodCache.put_cache(
            Gs2EnchantDescribeBalanceParameterStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeBalanceParameterStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBalanceParameterStatus":
        Gs2EnchantGetBalanceParameterStatusMethodCache.put_cache(
            Gs2EnchantGetBalanceParameterStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetBalanceParameterStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBalanceParameterStatusByUserId":
        Gs2EnchantGetBalanceParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantGetBalanceParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetBalanceParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBalanceParameterStatusByUserId":
        Gs2EnchantDeleteBalanceParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantDeleteBalanceParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDeleteBalanceParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "reDrawBalanceParameterStatusByUserId":
        Gs2EnchantReDrawBalanceParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantReDrawBalanceParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setBalanceParameterStatusByUserId":
        Gs2EnchantSetBalanceParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantSetBalanceParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantSetBalanceParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRarityParameterStatuses":
        Gs2EnchantDescribeRarityParameterStatusesMethodCache.put_cache(
            Gs2EnchantDescribeRarityParameterStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeRarityParameterStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRarityParameterStatusesByUserId":
        Gs2EnchantDescribeRarityParameterStatusesByUserIdMethodCache.put_cache(
            Gs2EnchantDescribeRarityParameterStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDescribeRarityParameterStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRarityParameterStatus":
        Gs2EnchantGetRarityParameterStatusMethodCache.put_cache(
            Gs2EnchantGetRarityParameterStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetRarityParameterStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRarityParameterStatusByUserId":
        Gs2EnchantGetRarityParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantGetRarityParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantGetRarityParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRarityParameterStatusByUserId":
        Gs2EnchantDeleteRarityParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantDeleteRarityParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantDeleteRarityParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "reDrawRarityParameterStatusByUserId":
        Gs2EnchantReDrawRarityParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantReDrawRarityParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantReDrawRarityParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addRarityParameterStatusByUserId":
        Gs2EnchantAddRarityParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantAddRarityParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantAddRarityParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyRarityParameterStatus":
        Gs2EnchantVerifyRarityParameterStatusMethodCache.put_cache(
            Gs2EnchantVerifyRarityParameterStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantVerifyRarityParameterStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyRarityParameterStatusByUserId":
        Gs2EnchantVerifyRarityParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantVerifyRarityParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantVerifyRarityParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setRarityParameterStatusByUserId":
        Gs2EnchantSetRarityParameterStatusByUserIdMethodCache.put_cache(
            Gs2EnchantSetRarityParameterStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2EnchantSetRarityParameterStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass