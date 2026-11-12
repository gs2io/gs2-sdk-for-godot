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
class_name Gs2AccountServiceCache
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
        Gs2AccountDescribeNamespacesMethodCache.put_cache(
            Gs2AccountDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2AccountCreateNamespaceMethodCache.put_cache(
            Gs2AccountCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2AccountGetNamespaceStatusMethodCache.put_cache(
            Gs2AccountGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2AccountGetNamespaceMethodCache.put_cache(
            Gs2AccountGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2AccountUpdateNamespaceMethodCache.put_cache(
            Gs2AccountUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2AccountDeleteNamespaceMethodCache.put_cache(
            Gs2AccountDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2AccountGetServiceVersionMethodCache.put_cache(
            Gs2AccountGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2AccountDumpUserDataByUserIdMethodCache.put_cache(
            Gs2AccountDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2AccountCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2AccountCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2AccountCleanUserDataByUserIdMethodCache.put_cache(
            Gs2AccountCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2AccountCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2AccountCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2AccountPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2AccountPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2AccountImportUserDataByUserIdMethodCache.put_cache(
            Gs2AccountImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2AccountCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2AccountCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAccounts":
        Gs2AccountDescribeAccountsMethodCache.put_cache(
            Gs2AccountDescribeAccountsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribeAccountsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createAccount":
        Gs2AccountCreateAccountMethodCache.put_cache(
            Gs2AccountCreateAccountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateAccountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateTimeOffset":
        Gs2AccountUpdateTimeOffsetMethodCache.put_cache(
            Gs2AccountUpdateTimeOffsetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateTimeOffsetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBanned":
        Gs2AccountUpdateBannedMethodCache.put_cache(
            Gs2AccountUpdateBannedResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateBannedRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addBan":
        Gs2AccountAddBanMethodCache.put_cache(
            Gs2AccountAddBanResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountAddBanRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "removeBan":
        Gs2AccountRemoveBanMethodCache.put_cache(
            Gs2AccountRemoveBanResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountRemoveBanRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAccount":
        Gs2AccountGetAccountMethodCache.put_cache(
            Gs2AccountGetAccountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetAccountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAccount":
        Gs2AccountDeleteAccountMethodCache.put_cache(
            Gs2AccountDeleteAccountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteAccountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "authentication":
        Gs2AccountAuthenticationMethodCache.put_cache(
            Gs2AccountAuthenticationResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountAuthenticationRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "previewTakeOver":
        Gs2AccountPreviewTakeOverMethodCache.put_cache(
            Gs2AccountPreviewTakeOverResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountPreviewTakeOverRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "previewTakeOverOpenIdConnect":
        Gs2AccountPreviewTakeOverOpenIdConnectMethodCache.put_cache(
            Gs2AccountPreviewTakeOverOpenIdConnectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountPreviewTakeOverOpenIdConnectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "requestDeletion":
        Gs2AccountRequestDeletionMethodCache.put_cache(
            Gs2AccountRequestDeletionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountRequestDeletionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "requestDeletionByUserId":
        Gs2AccountRequestDeletionByUserIdMethodCache.put_cache(
            Gs2AccountRequestDeletionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountRequestDeletionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cancelDeletion":
        Gs2AccountCancelDeletionMethodCache.put_cache(
            Gs2AccountCancelDeletionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCancelDeletionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cancelDeletionByUserId":
        Gs2AccountCancelDeletionByUserIdMethodCache.put_cache(
            Gs2AccountCancelDeletionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCancelDeletionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "executeDeletionByUserId":
        Gs2AccountExecuteDeletionByUserIdMethodCache.put_cache(
            Gs2AccountExecuteDeletionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountExecuteDeletionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeTakeOvers":
        Gs2AccountDescribeTakeOversMethodCache.put_cache(
            Gs2AccountDescribeTakeOversResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribeTakeOversRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeTakeOversByUserId":
        Gs2AccountDescribeTakeOversByUserIdMethodCache.put_cache(
            Gs2AccountDescribeTakeOversByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribeTakeOversByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createTakeOver":
        Gs2AccountCreateTakeOverMethodCache.put_cache(
            Gs2AccountCreateTakeOverResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateTakeOverRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createTakeOverByUserId":
        Gs2AccountCreateTakeOverByUserIdMethodCache.put_cache(
            Gs2AccountCreateTakeOverByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateTakeOverByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createTakeOverOpenIdConnect":
        Gs2AccountCreateTakeOverOpenIdConnectMethodCache.put_cache(
            Gs2AccountCreateTakeOverOpenIdConnectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateTakeOverOpenIdConnectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createTakeOverOpenIdConnectAndByUserId":
        Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdMethodCache.put_cache(
            Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateTakeOverOpenIdConnectAndByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTakeOver":
        Gs2AccountGetTakeOverMethodCache.put_cache(
            Gs2AccountGetTakeOverResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetTakeOverRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTakeOverByUserId":
        Gs2AccountGetTakeOverByUserIdMethodCache.put_cache(
            Gs2AccountGetTakeOverByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetTakeOverByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateTakeOver":
        Gs2AccountUpdateTakeOverMethodCache.put_cache(
            Gs2AccountUpdateTakeOverResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateTakeOverRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateTakeOverByUserId":
        Gs2AccountUpdateTakeOverByUserIdMethodCache.put_cache(
            Gs2AccountUpdateTakeOverByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateTakeOverByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteTakeOver":
        Gs2AccountDeleteTakeOverMethodCache.put_cache(
            Gs2AccountDeleteTakeOverResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteTakeOverRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteTakeOverByUserIdentifier":
        Gs2AccountDeleteTakeOverByUserIdentifierMethodCache.put_cache(
            Gs2AccountDeleteTakeOverByUserIdentifierResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteTakeOverByUserIdentifierRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteTakeOverByUserId":
        Gs2AccountDeleteTakeOverByUserIdMethodCache.put_cache(
            Gs2AccountDeleteTakeOverByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteTakeOverByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doTakeOver":
        Gs2AccountDoTakeOverMethodCache.put_cache(
            Gs2AccountDoTakeOverResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDoTakeOverRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doTakeOverOpenIdConnect":
        Gs2AccountDoTakeOverOpenIdConnectMethodCache.put_cache(
            Gs2AccountDoTakeOverOpenIdConnectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDoTakeOverOpenIdConnectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAuthorizationUrl":
        Gs2AccountGetAuthorizationUrlMethodCache.put_cache(
            Gs2AccountGetAuthorizationUrlResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetAuthorizationUrlRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePlatformIds":
        Gs2AccountDescribePlatformIdsMethodCache.put_cache(
            Gs2AccountDescribePlatformIdsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribePlatformIdsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describePlatformIdsByUserId":
        Gs2AccountDescribePlatformIdsByUserIdMethodCache.put_cache(
            Gs2AccountDescribePlatformIdsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribePlatformIdsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createPlatformId":
        Gs2AccountCreatePlatformIdMethodCache.put_cache(
            Gs2AccountCreatePlatformIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreatePlatformIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createPlatformIdByUserId":
        Gs2AccountCreatePlatformIdByUserIdMethodCache.put_cache(
            Gs2AccountCreatePlatformIdByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreatePlatformIdByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPlatformId":
        Gs2AccountGetPlatformIdMethodCache.put_cache(
            Gs2AccountGetPlatformIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetPlatformIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPlatformIdByUserId":
        Gs2AccountGetPlatformIdByUserIdMethodCache.put_cache(
            Gs2AccountGetPlatformIdByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetPlatformIdByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "findPlatformId":
        Gs2AccountFindPlatformIdMethodCache.put_cache(
            Gs2AccountFindPlatformIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountFindPlatformIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "findPlatformIdByUserId":
        Gs2AccountFindPlatformIdByUserIdMethodCache.put_cache(
            Gs2AccountFindPlatformIdByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountFindPlatformIdByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePlatformId":
        Gs2AccountDeletePlatformIdMethodCache.put_cache(
            Gs2AccountDeletePlatformIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeletePlatformIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePlatformIdByUserIdentifier":
        Gs2AccountDeletePlatformIdByUserIdentifierMethodCache.put_cache(
            Gs2AccountDeletePlatformIdByUserIdentifierResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeletePlatformIdByUserIdentifierRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePlatformIdByUserId":
        Gs2AccountDeletePlatformIdByUserIdMethodCache.put_cache(
            Gs2AccountDeletePlatformIdByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeletePlatformIdByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDataOwnerByUserId":
        Gs2AccountGetDataOwnerByUserIdMethodCache.put_cache(
            Gs2AccountGetDataOwnerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetDataOwnerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateDataOwnerByUserId":
        Gs2AccountUpdateDataOwnerByUserIdMethodCache.put_cache(
            Gs2AccountUpdateDataOwnerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateDataOwnerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteDataOwnerByUserId":
        Gs2AccountDeleteDataOwnerByUserIdMethodCache.put_cache(
            Gs2AccountDeleteDataOwnerByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteDataOwnerByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeTakeOverTypeModels":
        Gs2AccountDescribeTakeOverTypeModelsMethodCache.put_cache(
            Gs2AccountDescribeTakeOverTypeModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribeTakeOverTypeModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTakeOverTypeModel":
        Gs2AccountGetTakeOverTypeModelMethodCache.put_cache(
            Gs2AccountGetTakeOverTypeModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetTakeOverTypeModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeTakeOverTypeModelMasters":
        Gs2AccountDescribeTakeOverTypeModelMastersMethodCache.put_cache(
            Gs2AccountDescribeTakeOverTypeModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDescribeTakeOverTypeModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createTakeOverTypeModelMaster":
        Gs2AccountCreateTakeOverTypeModelMasterMethodCache.put_cache(
            Gs2AccountCreateTakeOverTypeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountCreateTakeOverTypeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTakeOverTypeModelMaster":
        Gs2AccountGetTakeOverTypeModelMasterMethodCache.put_cache(
            Gs2AccountGetTakeOverTypeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetTakeOverTypeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateTakeOverTypeModelMaster":
        Gs2AccountUpdateTakeOverTypeModelMasterMethodCache.put_cache(
            Gs2AccountUpdateTakeOverTypeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateTakeOverTypeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteTakeOverTypeModelMaster":
        Gs2AccountDeleteTakeOverTypeModelMasterMethodCache.put_cache(
            Gs2AccountDeleteTakeOverTypeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountDeleteTakeOverTypeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2AccountExportMasterMethodCache.put_cache(
            Gs2AccountExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentModelMaster":
        Gs2AccountGetCurrentModelMasterMethodCache.put_cache(
            Gs2AccountGetCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountGetCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentModelMaster":
        Gs2AccountPreUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2AccountPreUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountPreUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMaster":
        Gs2AccountUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2AccountUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMasterFromGitHub":
        Gs2AccountUpdateCurrentModelMasterFromGitHubMethodCache.put_cache(
            Gs2AccountUpdateCurrentModelMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AccountUpdateCurrentModelMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass