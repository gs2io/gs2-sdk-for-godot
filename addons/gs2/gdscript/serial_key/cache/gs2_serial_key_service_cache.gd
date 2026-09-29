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
class_name Gs2SerialKeyServiceCache
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
        Gs2SerialKeyDescribeNamespacesMethodCache.put_cache(
            Gs2SerialKeyDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2SerialKeyCreateNamespaceMethodCache.put_cache(
            Gs2SerialKeyCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2SerialKeyGetNamespaceStatusMethodCache.put_cache(
            Gs2SerialKeyGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2SerialKeyGetNamespaceMethodCache.put_cache(
            Gs2SerialKeyGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2SerialKeyUpdateNamespaceMethodCache.put_cache(
            Gs2SerialKeyUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2SerialKeyDeleteNamespaceMethodCache.put_cache(
            Gs2SerialKeyDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2SerialKeyGetServiceVersionMethodCache.put_cache(
            Gs2SerialKeyGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2SerialKeyDumpUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2SerialKeyCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2SerialKeyCleanUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2SerialKeyCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2SerialKeyPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2SerialKeyImportUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2SerialKeyCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2SerialKeyCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeIssueJobs":
        Gs2SerialKeyDescribeIssueJobsMethodCache.put_cache(
            Gs2SerialKeyDescribeIssueJobsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDescribeIssueJobsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getIssueJob":
        Gs2SerialKeyGetIssueJobMethodCache.put_cache(
            Gs2SerialKeyGetIssueJobResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetIssueJobRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "issue":
        Gs2SerialKeyIssueMethodCache.put_cache(
            Gs2SerialKeyIssueResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyIssueRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSerialKeys":
        Gs2SerialKeyDescribeSerialKeysMethodCache.put_cache(
            Gs2SerialKeyDescribeSerialKeysResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDescribeSerialKeysRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "downloadSerialCodes":
        Gs2SerialKeyDownloadSerialCodesMethodCache.put_cache(
            Gs2SerialKeyDownloadSerialCodesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDownloadSerialCodesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "issueOnce":
        Gs2SerialKeyIssueOnceMethodCache.put_cache(
            Gs2SerialKeyIssueOnceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyIssueOnceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSerialKey":
        Gs2SerialKeyGetSerialKeyMethodCache.put_cache(
            Gs2SerialKeyGetSerialKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetSerialKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCode":
        Gs2SerialKeyVerifyCodeMethodCache.put_cache(
            Gs2SerialKeyVerifyCodeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyVerifyCodeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCodeByUserId":
        Gs2SerialKeyVerifyCodeByUserIdMethodCache.put_cache(
            Gs2SerialKeyVerifyCodeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyVerifyCodeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "use":
        Gs2SerialKeyUseMethodCache.put_cache(
            Gs2SerialKeyUseResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyUseRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "useByUserId":
        Gs2SerialKeyUseByUserIdMethodCache.put_cache(
            Gs2SerialKeyUseByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyUseByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "revertUseByUserId":
        Gs2SerialKeyRevertUseByUserIdMethodCache.put_cache(
            Gs2SerialKeyRevertUseByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyRevertUseByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCampaignModels":
        Gs2SerialKeyDescribeCampaignModelsMethodCache.put_cache(
            Gs2SerialKeyDescribeCampaignModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDescribeCampaignModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCampaignModel":
        Gs2SerialKeyGetCampaignModelMethodCache.put_cache(
            Gs2SerialKeyGetCampaignModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetCampaignModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCampaignModelMasters":
        Gs2SerialKeyDescribeCampaignModelMastersMethodCache.put_cache(
            Gs2SerialKeyDescribeCampaignModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDescribeCampaignModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createCampaignModelMaster":
        Gs2SerialKeyCreateCampaignModelMasterMethodCache.put_cache(
            Gs2SerialKeyCreateCampaignModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyCreateCampaignModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCampaignModelMaster":
        Gs2SerialKeyGetCampaignModelMasterMethodCache.put_cache(
            Gs2SerialKeyGetCampaignModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetCampaignModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCampaignModelMaster":
        Gs2SerialKeyUpdateCampaignModelMasterMethodCache.put_cache(
            Gs2SerialKeyUpdateCampaignModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyUpdateCampaignModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCampaignModelMaster":
        Gs2SerialKeyDeleteCampaignModelMasterMethodCache.put_cache(
            Gs2SerialKeyDeleteCampaignModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyDeleteCampaignModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2SerialKeyExportMasterMethodCache.put_cache(
            Gs2SerialKeyExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentCampaignMaster":
        Gs2SerialKeyGetCurrentCampaignMasterMethodCache.put_cache(
            Gs2SerialKeyGetCurrentCampaignMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyGetCurrentCampaignMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentCampaignMaster":
        Gs2SerialKeyPreUpdateCurrentCampaignMasterMethodCache.put_cache(
            Gs2SerialKeyPreUpdateCurrentCampaignMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyPreUpdateCurrentCampaignMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentCampaignMaster":
        Gs2SerialKeyUpdateCurrentCampaignMasterMethodCache.put_cache(
            Gs2SerialKeyUpdateCurrentCampaignMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyUpdateCurrentCampaignMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentCampaignMasterFromGitHub":
        Gs2SerialKeyUpdateCurrentCampaignMasterFromGitHubMethodCache.put_cache(
            Gs2SerialKeyUpdateCurrentCampaignMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SerialKeyUpdateCurrentCampaignMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass