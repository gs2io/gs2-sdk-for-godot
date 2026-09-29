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
class_name Gs2DistributorServiceCache
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
    return null


static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2DistributorDescribeNamespacesMethodCache.put_cache(
            Gs2DistributorDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2DistributorCreateNamespaceMethodCache.put_cache(
            Gs2DistributorCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2DistributorGetNamespaceStatusMethodCache.put_cache(
            Gs2DistributorGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2DistributorGetNamespaceMethodCache.put_cache(
            Gs2DistributorGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2DistributorUpdateNamespaceMethodCache.put_cache(
            Gs2DistributorUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2DistributorDeleteNamespaceMethodCache.put_cache(
            Gs2DistributorDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2DistributorGetServiceVersionMethodCache.put_cache(
            Gs2DistributorGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDistributorModelMasters":
        Gs2DistributorDescribeDistributorModelMastersMethodCache.put_cache(
            Gs2DistributorDescribeDistributorModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDescribeDistributorModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createDistributorModelMaster":
        Gs2DistributorCreateDistributorModelMasterMethodCache.put_cache(
            Gs2DistributorCreateDistributorModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorCreateDistributorModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDistributorModelMaster":
        Gs2DistributorGetDistributorModelMasterMethodCache.put_cache(
            Gs2DistributorGetDistributorModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetDistributorModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateDistributorModelMaster":
        Gs2DistributorUpdateDistributorModelMasterMethodCache.put_cache(
            Gs2DistributorUpdateDistributorModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorUpdateDistributorModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteDistributorModelMaster":
        Gs2DistributorDeleteDistributorModelMasterMethodCache.put_cache(
            Gs2DistributorDeleteDistributorModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDeleteDistributorModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDistributorModels":
        Gs2DistributorDescribeDistributorModelsMethodCache.put_cache(
            Gs2DistributorDescribeDistributorModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDescribeDistributorModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDistributorModel":
        Gs2DistributorGetDistributorModelMethodCache.put_cache(
            Gs2DistributorGetDistributorModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetDistributorModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2DistributorExportMasterMethodCache.put_cache(
            Gs2DistributorExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentDistributorMaster":
        Gs2DistributorGetCurrentDistributorMasterMethodCache.put_cache(
            Gs2DistributorGetCurrentDistributorMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetCurrentDistributorMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentDistributorMaster":
        Gs2DistributorPreUpdateCurrentDistributorMasterMethodCache.put_cache(
            Gs2DistributorPreUpdateCurrentDistributorMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorPreUpdateCurrentDistributorMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentDistributorMaster":
        Gs2DistributorUpdateCurrentDistributorMasterMethodCache.put_cache(
            Gs2DistributorUpdateCurrentDistributorMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorUpdateCurrentDistributorMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentDistributorMasterFromGitHub":
        Gs2DistributorUpdateCurrentDistributorMasterFromGitHubMethodCache.put_cache(
            Gs2DistributorUpdateCurrentDistributorMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorUpdateCurrentDistributorMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "distribute":
        Gs2DistributorDistributeMethodCache.put_cache(
            Gs2DistributorDistributeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDistributeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "distributeWithoutOverflowProcess":
        Gs2DistributorDistributeWithoutOverflowProcessMethodCache.put_cache(
            Gs2DistributorDistributeWithoutOverflowProcessResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDistributeWithoutOverflowProcessRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runVerifyTask":
        Gs2DistributorRunVerifyTaskMethodCache.put_cache(
            Gs2DistributorRunVerifyTaskResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunVerifyTaskRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runStampTask":
        Gs2DistributorRunStampTaskMethodCache.put_cache(
            Gs2DistributorRunStampTaskResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunStampTaskRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runStampSheet":
        Gs2DistributorRunStampSheetMethodCache.put_cache(
            Gs2DistributorRunStampSheetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunStampSheetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runStampSheetExpress":
        Gs2DistributorRunStampSheetExpressMethodCache.put_cache(
            Gs2DistributorRunStampSheetExpressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunStampSheetExpressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runVerifyTaskWithoutNamespace":
        Gs2DistributorRunVerifyTaskWithoutNamespaceMethodCache.put_cache(
            Gs2DistributorRunVerifyTaskWithoutNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunVerifyTaskWithoutNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runStampTaskWithoutNamespace":
        Gs2DistributorRunStampTaskWithoutNamespaceMethodCache.put_cache(
            Gs2DistributorRunStampTaskWithoutNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunStampTaskWithoutNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runStampSheetWithoutNamespace":
        Gs2DistributorRunStampSheetWithoutNamespaceMethodCache.put_cache(
            Gs2DistributorRunStampSheetWithoutNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunStampSheetWithoutNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runStampSheetExpressWithoutNamespace":
        Gs2DistributorRunStampSheetExpressWithoutNamespaceMethodCache.put_cache(
            Gs2DistributorRunStampSheetExpressWithoutNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunStampSheetExpressWithoutNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setTransactionDefaultConfig":
        Gs2DistributorSetTransactionDefaultConfigMethodCache.put_cache(
            Gs2DistributorSetTransactionDefaultConfigResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorSetTransactionDefaultConfigRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setTransactionDefaultConfigByUserId":
        Gs2DistributorSetTransactionDefaultConfigByUserIdMethodCache.put_cache(
            Gs2DistributorSetTransactionDefaultConfigByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorSetTransactionDefaultConfigByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "freezeMasterData":
        Gs2DistributorFreezeMasterDataMethodCache.put_cache(
            Gs2DistributorFreezeMasterDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorFreezeMasterDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "freezeMasterDataByUserId":
        Gs2DistributorFreezeMasterDataByUserIdMethodCache.put_cache(
            Gs2DistributorFreezeMasterDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorFreezeMasterDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "signFreezeMasterDataTimestamp":
        Gs2DistributorSignFreezeMasterDataTimestampMethodCache.put_cache(
            Gs2DistributorSignFreezeMasterDataTimestampResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorSignFreezeMasterDataTimestampRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "freezeMasterDataBySignedTimestamp":
        Gs2DistributorFreezeMasterDataBySignedTimestampMethodCache.put_cache(
            Gs2DistributorFreezeMasterDataBySignedTimestampResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorFreezeMasterDataBySignedTimestampRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "freezeMasterDataByTimestamp":
        Gs2DistributorFreezeMasterDataByTimestampMethodCache.put_cache(
            Gs2DistributorFreezeMasterDataByTimestampResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorFreezeMasterDataByTimestampRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchExecuteApi":
        Gs2DistributorBatchExecuteApiMethodCache.put_cache(
            Gs2DistributorBatchExecuteApiResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorBatchExecuteApiRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "ifExpressionByUserId":
        Gs2DistributorIfExpressionByUserIdMethodCache.put_cache(
            Gs2DistributorIfExpressionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorIfExpressionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "andExpressionByUserId":
        Gs2DistributorAndExpressionByUserIdMethodCache.put_cache(
            Gs2DistributorAndExpressionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorAndExpressionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "orExpressionByUserId":
        Gs2DistributorOrExpressionByUserIdMethodCache.put_cache(
            Gs2DistributorOrExpressionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorOrExpressionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStampSheetResult":
        Gs2DistributorGetStampSheetResultMethodCache.put_cache(
            Gs2DistributorGetStampSheetResultResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetStampSheetResultRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStampSheetResultByUserId":
        Gs2DistributorGetStampSheetResultByUserIdMethodCache.put_cache(
            Gs2DistributorGetStampSheetResultByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetStampSheetResultByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeUserData":
        Gs2DistributorDescribeUserDataMethodCache.put_cache(
            Gs2DistributorDescribeUserDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDescribeUserDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeUserDataByUserId":
        Gs2DistributorDescribeUserDataByUserIdMethodCache.put_cache(
            Gs2DistributorDescribeUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorDescribeUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runTransaction":
        Gs2DistributorRunTransactionMethodCache.put_cache(
            Gs2DistributorRunTransactionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorRunTransactionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTransactionResult":
        Gs2DistributorGetTransactionResultMethodCache.put_cache(
            Gs2DistributorGetTransactionResultResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetTransactionResultRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTransactionResultByUserId":
        Gs2DistributorGetTransactionResultByUserIdMethodCache.put_cache(
            Gs2DistributorGetTransactionResultByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DistributorGetTransactionResultByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass