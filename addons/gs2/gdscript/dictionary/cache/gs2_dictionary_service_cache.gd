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
class_name Gs2DictionaryServiceCache
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
        Gs2DictionaryDescribeNamespacesMethodCache.put_cache(
            Gs2DictionaryDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2DictionaryCreateNamespaceMethodCache.put_cache(
            Gs2DictionaryCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2DictionaryGetNamespaceStatusMethodCache.put_cache(
            Gs2DictionaryGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2DictionaryGetNamespaceMethodCache.put_cache(
            Gs2DictionaryGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2DictionaryUpdateNamespaceMethodCache.put_cache(
            Gs2DictionaryUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2DictionaryDeleteNamespaceMethodCache.put_cache(
            Gs2DictionaryDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2DictionaryGetServiceVersionMethodCache.put_cache(
            Gs2DictionaryGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2DictionaryDumpUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2DictionaryCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2DictionaryCleanUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2DictionaryCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2DictionaryPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2DictionaryImportUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2DictionaryCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2DictionaryCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEntryModels":
        Gs2DictionaryDescribeEntryModelsMethodCache.put_cache(
            Gs2DictionaryDescribeEntryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeEntryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEntryModel":
        Gs2DictionaryGetEntryModelMethodCache.put_cache(
            Gs2DictionaryGetEntryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetEntryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEntryModelMasters":
        Gs2DictionaryDescribeEntryModelMastersMethodCache.put_cache(
            Gs2DictionaryDescribeEntryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeEntryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createEntryModelMaster":
        Gs2DictionaryCreateEntryModelMasterMethodCache.put_cache(
            Gs2DictionaryCreateEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryCreateEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEntryModelMaster":
        Gs2DictionaryGetEntryModelMasterMethodCache.put_cache(
            Gs2DictionaryGetEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateEntryModelMaster":
        Gs2DictionaryUpdateEntryModelMasterMethodCache.put_cache(
            Gs2DictionaryUpdateEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryUpdateEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteEntryModelMaster":
        Gs2DictionaryDeleteEntryModelMasterMethodCache.put_cache(
            Gs2DictionaryDeleteEntryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDeleteEntryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEntries":
        Gs2DictionaryDescribeEntriesMethodCache.put_cache(
            Gs2DictionaryDescribeEntriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeEntriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeEntriesByUserId":
        Gs2DictionaryDescribeEntriesByUserIdMethodCache.put_cache(
            Gs2DictionaryDescribeEntriesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeEntriesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addEntriesByUserId":
        Gs2DictionaryAddEntriesByUserIdMethodCache.put_cache(
            Gs2DictionaryAddEntriesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryAddEntriesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEntry":
        Gs2DictionaryGetEntryMethodCache.put_cache(
            Gs2DictionaryGetEntryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetEntryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEntryByUserId":
        Gs2DictionaryGetEntryByUserIdMethodCache.put_cache(
            Gs2DictionaryGetEntryByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetEntryByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEntryWithSignature":
        Gs2DictionaryGetEntryWithSignatureMethodCache.put_cache(
            Gs2DictionaryGetEntryWithSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetEntryWithSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getEntryWithSignatureByUserId":
        Gs2DictionaryGetEntryWithSignatureByUserIdMethodCache.put_cache(
            Gs2DictionaryGetEntryWithSignatureByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetEntryWithSignatureByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetByUserId":
        Gs2DictionaryResetByUserIdMethodCache.put_cache(
            Gs2DictionaryResetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryResetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyEntry":
        Gs2DictionaryVerifyEntryMethodCache.put_cache(
            Gs2DictionaryVerifyEntryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryVerifyEntryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyEntryByUserId":
        Gs2DictionaryVerifyEntryByUserIdMethodCache.put_cache(
            Gs2DictionaryVerifyEntryByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryVerifyEntryByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteEntries":
        Gs2DictionaryDeleteEntriesMethodCache.put_cache(
            Gs2DictionaryDeleteEntriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDeleteEntriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteEntriesByUserId":
        Gs2DictionaryDeleteEntriesByUserIdMethodCache.put_cache(
            Gs2DictionaryDeleteEntriesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDeleteEntriesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLikes":
        Gs2DictionaryDescribeLikesMethodCache.put_cache(
            Gs2DictionaryDescribeLikesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeLikesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLikesByUserId":
        Gs2DictionaryDescribeLikesByUserIdMethodCache.put_cache(
            Gs2DictionaryDescribeLikesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDescribeLikesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addLikes":
        Gs2DictionaryAddLikesMethodCache.put_cache(
            Gs2DictionaryAddLikesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryAddLikesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addLikesByUserId":
        Gs2DictionaryAddLikesByUserIdMethodCache.put_cache(
            Gs2DictionaryAddLikesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryAddLikesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLike":
        Gs2DictionaryGetLikeMethodCache.put_cache(
            Gs2DictionaryGetLikeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetLikeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLikeByUserId":
        Gs2DictionaryGetLikeByUserIdMethodCache.put_cache(
            Gs2DictionaryGetLikeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetLikeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetLikes":
        Gs2DictionaryResetLikesMethodCache.put_cache(
            Gs2DictionaryResetLikesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryResetLikesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetLikesByUserId":
        Gs2DictionaryResetLikesByUserIdMethodCache.put_cache(
            Gs2DictionaryResetLikesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryResetLikesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteLikes":
        Gs2DictionaryDeleteLikesMethodCache.put_cache(
            Gs2DictionaryDeleteLikesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDeleteLikesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteLikesByUserId":
        Gs2DictionaryDeleteLikesByUserIdMethodCache.put_cache(
            Gs2DictionaryDeleteLikesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryDeleteLikesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2DictionaryExportMasterMethodCache.put_cache(
            Gs2DictionaryExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentEntryMaster":
        Gs2DictionaryGetCurrentEntryMasterMethodCache.put_cache(
            Gs2DictionaryGetCurrentEntryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryGetCurrentEntryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentEntryMaster":
        Gs2DictionaryPreUpdateCurrentEntryMasterMethodCache.put_cache(
            Gs2DictionaryPreUpdateCurrentEntryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryPreUpdateCurrentEntryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentEntryMaster":
        Gs2DictionaryUpdateCurrentEntryMasterMethodCache.put_cache(
            Gs2DictionaryUpdateCurrentEntryMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryUpdateCurrentEntryMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentEntryMasterFromGitHub":
        Gs2DictionaryUpdateCurrentEntryMasterFromGitHubMethodCache.put_cache(
            Gs2DictionaryUpdateCurrentEntryMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DictionaryUpdateCurrentEntryMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass