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
class_name Gs2LimitServiceCache
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
        Gs2LimitDescribeNamespacesMethodCache.put_cache(
            Gs2LimitDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2LimitCreateNamespaceMethodCache.put_cache(
            Gs2LimitCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2LimitGetNamespaceStatusMethodCache.put_cache(
            Gs2LimitGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2LimitGetNamespaceMethodCache.put_cache(
            Gs2LimitGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2LimitUpdateNamespaceMethodCache.put_cache(
            Gs2LimitUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2LimitDeleteNamespaceMethodCache.put_cache(
            Gs2LimitDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2LimitGetServiceVersionMethodCache.put_cache(
            Gs2LimitGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2LimitDumpUserDataByUserIdMethodCache.put_cache(
            Gs2LimitDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2LimitCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2LimitCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2LimitCleanUserDataByUserIdMethodCache.put_cache(
            Gs2LimitCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2LimitCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2LimitCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2LimitPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2LimitPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2LimitImportUserDataByUserIdMethodCache.put_cache(
            Gs2LimitImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2LimitCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2LimitCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCounters":
        Gs2LimitDescribeCountersMethodCache.put_cache(
            Gs2LimitDescribeCountersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDescribeCountersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCountersByUserId":
        Gs2LimitDescribeCountersByUserIdMethodCache.put_cache(
            Gs2LimitDescribeCountersByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDescribeCountersByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCounter":
        Gs2LimitGetCounterMethodCache.put_cache(
            Gs2LimitGetCounterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetCounterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCounterByUserId":
        Gs2LimitGetCounterByUserIdMethodCache.put_cache(
            Gs2LimitGetCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countUp":
        Gs2LimitCountUpMethodCache.put_cache(
            Gs2LimitCountUpResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCountUpRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countUpByUserId":
        Gs2LimitCountUpByUserIdMethodCache.put_cache(
            Gs2LimitCountUpByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCountUpByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countDownByUserId":
        Gs2LimitCountDownByUserIdMethodCache.put_cache(
            Gs2LimitCountDownByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCountDownByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCounterByUserId":
        Gs2LimitDeleteCounterByUserIdMethodCache.put_cache(
            Gs2LimitDeleteCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDeleteCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCounter":
        Gs2LimitVerifyCounterMethodCache.put_cache(
            Gs2LimitVerifyCounterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitVerifyCounterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCounterByUserId":
        Gs2LimitVerifyCounterByUserIdMethodCache.put_cache(
            Gs2LimitVerifyCounterByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitVerifyCounterByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLimitModelMasters":
        Gs2LimitDescribeLimitModelMastersMethodCache.put_cache(
            Gs2LimitDescribeLimitModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDescribeLimitModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createLimitModelMaster":
        Gs2LimitCreateLimitModelMasterMethodCache.put_cache(
            Gs2LimitCreateLimitModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitCreateLimitModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLimitModelMaster":
        Gs2LimitGetLimitModelMasterMethodCache.put_cache(
            Gs2LimitGetLimitModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetLimitModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateLimitModelMaster":
        Gs2LimitUpdateLimitModelMasterMethodCache.put_cache(
            Gs2LimitUpdateLimitModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitUpdateLimitModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteLimitModelMaster":
        Gs2LimitDeleteLimitModelMasterMethodCache.put_cache(
            Gs2LimitDeleteLimitModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDeleteLimitModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2LimitExportMasterMethodCache.put_cache(
            Gs2LimitExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentLimitMaster":
        Gs2LimitGetCurrentLimitMasterMethodCache.put_cache(
            Gs2LimitGetCurrentLimitMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetCurrentLimitMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentLimitMaster":
        Gs2LimitPreUpdateCurrentLimitMasterMethodCache.put_cache(
            Gs2LimitPreUpdateCurrentLimitMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitPreUpdateCurrentLimitMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentLimitMaster":
        Gs2LimitUpdateCurrentLimitMasterMethodCache.put_cache(
            Gs2LimitUpdateCurrentLimitMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitUpdateCurrentLimitMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentLimitMasterFromGitHub":
        Gs2LimitUpdateCurrentLimitMasterFromGitHubMethodCache.put_cache(
            Gs2LimitUpdateCurrentLimitMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitUpdateCurrentLimitMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLimitModels":
        Gs2LimitDescribeLimitModelsMethodCache.put_cache(
            Gs2LimitDescribeLimitModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitDescribeLimitModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLimitModel":
        Gs2LimitGetLimitModelMethodCache.put_cache(
            Gs2LimitGetLimitModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LimitGetLimitModelRequest.from_dict(_parse(request_payload))
        )
        return
    pass