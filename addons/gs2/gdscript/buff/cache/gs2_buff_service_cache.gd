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
class_name Gs2BuffServiceCache
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
        Gs2BuffDescribeNamespacesMethodCache.put_cache(
            Gs2BuffDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2BuffCreateNamespaceMethodCache.put_cache(
            Gs2BuffCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2BuffGetNamespaceStatusMethodCache.put_cache(
            Gs2BuffGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2BuffGetNamespaceMethodCache.put_cache(
            Gs2BuffGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2BuffUpdateNamespaceMethodCache.put_cache(
            Gs2BuffUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2BuffDeleteNamespaceMethodCache.put_cache(
            Gs2BuffDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2BuffGetServiceVersionMethodCache.put_cache(
            Gs2BuffGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2BuffDumpUserDataByUserIdMethodCache.put_cache(
            Gs2BuffDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2BuffCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2BuffCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2BuffCleanUserDataByUserIdMethodCache.put_cache(
            Gs2BuffCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2BuffCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2BuffCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2BuffPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2BuffPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2BuffImportUserDataByUserIdMethodCache.put_cache(
            Gs2BuffImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2BuffCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2BuffCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBuffEntryModels":
        Gs2BuffDescribeBuffEntryModelsMethodCache.put_cache(
            Gs2BuffDescribeBuffEntryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffDescribeBuffEntryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBuffEntryModel":
        Gs2BuffGetBuffEntryModelMethodCache.put_cache(
            Gs2BuffGetBuffEntryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffGetBuffEntryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBuffEntryModelMasters":
        Gs2BuffDescribeBuffEntryModelMastersMethodCache.put_cache(
            Gs2BuffDescribeBuffEntryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffDescribeBuffEntryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createBuffEntryModelMaster":
        Gs2BuffCreateBuffEntryModelMasterMethodCache.put_cache(
            Gs2BuffCreateBuffEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffCreateBuffEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBuffEntryModelMaster":
        Gs2BuffGetBuffEntryModelMasterMethodCache.put_cache(
            Gs2BuffGetBuffEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffGetBuffEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBuffEntryModelMaster":
        Gs2BuffUpdateBuffEntryModelMasterMethodCache.put_cache(
            Gs2BuffUpdateBuffEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffUpdateBuffEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBuffEntryModelMaster":
        Gs2BuffDeleteBuffEntryModelMasterMethodCache.put_cache(
            Gs2BuffDeleteBuffEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffDeleteBuffEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "applyBuff":
        Gs2BuffApplyBuffMethodCache.put_cache(
            Gs2BuffApplyBuffResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffApplyBuffRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "applyBuffByUserId":
        Gs2BuffApplyBuffByUserIdMethodCache.put_cache(
            Gs2BuffApplyBuffByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffApplyBuffByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2BuffExportMasterMethodCache.put_cache(
            Gs2BuffExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentBuffMaster":
        Gs2BuffGetCurrentBuffMasterMethodCache.put_cache(
            Gs2BuffGetCurrentBuffMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffGetCurrentBuffMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentBuffMaster":
        Gs2BuffPreUpdateCurrentBuffMasterMethodCache.put_cache(
            Gs2BuffPreUpdateCurrentBuffMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffPreUpdateCurrentBuffMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentBuffMaster":
        Gs2BuffUpdateCurrentBuffMasterMethodCache.put_cache(
            Gs2BuffUpdateCurrentBuffMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffUpdateCurrentBuffMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentBuffMasterFromGitHub":
        Gs2BuffUpdateCurrentBuffMasterFromGitHubMethodCache.put_cache(
            Gs2BuffUpdateCurrentBuffMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2BuffUpdateCurrentBuffMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass