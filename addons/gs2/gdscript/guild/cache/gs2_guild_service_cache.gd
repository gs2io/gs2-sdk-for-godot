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
class_name Gs2GuildServiceCache
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
        Gs2GuildDescribeNamespacesMethodCache.put_cache(
            Gs2GuildDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2GuildCreateNamespaceMethodCache.put_cache(
            Gs2GuildCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2GuildGetNamespaceStatusMethodCache.put_cache(
            Gs2GuildGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2GuildGetNamespaceMethodCache.put_cache(
            Gs2GuildGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2GuildUpdateNamespaceMethodCache.put_cache(
            Gs2GuildUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2GuildDeleteNamespaceMethodCache.put_cache(
            Gs2GuildDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2GuildGetServiceVersionMethodCache.put_cache(
            Gs2GuildGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2GuildDumpUserDataByUserIdMethodCache.put_cache(
            Gs2GuildDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2GuildCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2GuildCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2GuildCleanUserDataByUserIdMethodCache.put_cache(
            Gs2GuildCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2GuildCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2GuildCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2GuildPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2GuildPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2GuildImportUserDataByUserIdMethodCache.put_cache(
            Gs2GuildImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2GuildCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2GuildCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGuildModelMasters":
        Gs2GuildDescribeGuildModelMastersMethodCache.put_cache(
            Gs2GuildDescribeGuildModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeGuildModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGuildModelMaster":
        Gs2GuildCreateGuildModelMasterMethodCache.put_cache(
            Gs2GuildCreateGuildModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCreateGuildModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGuildModelMaster":
        Gs2GuildGetGuildModelMasterMethodCache.put_cache(
            Gs2GuildGetGuildModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetGuildModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGuildModelMaster":
        Gs2GuildUpdateGuildModelMasterMethodCache.put_cache(
            Gs2GuildUpdateGuildModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateGuildModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGuildModelMaster":
        Gs2GuildDeleteGuildModelMasterMethodCache.put_cache(
            Gs2GuildDeleteGuildModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteGuildModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGuildModels":
        Gs2GuildDescribeGuildModelsMethodCache.put_cache(
            Gs2GuildDescribeGuildModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeGuildModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGuildModel":
        Gs2GuildGetGuildModelMethodCache.put_cache(
            Gs2GuildGetGuildModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetGuildModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "searchGuilds":
        Gs2GuildSearchGuildsMethodCache.put_cache(
            Gs2GuildSearchGuildsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildSearchGuildsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "searchGuildsByUserId":
        Gs2GuildSearchGuildsByUserIdMethodCache.put_cache(
            Gs2GuildSearchGuildsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildSearchGuildsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGuild":
        Gs2GuildCreateGuildMethodCache.put_cache(
            Gs2GuildCreateGuildResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCreateGuildRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGuildByUserId":
        Gs2GuildCreateGuildByUserIdMethodCache.put_cache(
            Gs2GuildCreateGuildByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildCreateGuildByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGuild":
        Gs2GuildGetGuildMethodCache.put_cache(
            Gs2GuildGetGuildResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetGuildRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGuildByUserId":
        Gs2GuildGetGuildByUserIdMethodCache.put_cache(
            Gs2GuildGetGuildByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetGuildByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGuild":
        Gs2GuildUpdateGuildMethodCache.put_cache(
            Gs2GuildUpdateGuildResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateGuildRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGuildByGuildName":
        Gs2GuildUpdateGuildByGuildNameMethodCache.put_cache(
            Gs2GuildUpdateGuildByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateGuildByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMember":
        Gs2GuildDeleteMemberMethodCache.put_cache(
            Gs2GuildDeleteMemberResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteMemberRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMemberByGuildName":
        Gs2GuildDeleteMemberByGuildNameMethodCache.put_cache(
            Gs2GuildDeleteMemberByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteMemberByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMemberRole":
        Gs2GuildUpdateMemberRoleMethodCache.put_cache(
            Gs2GuildUpdateMemberRoleResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateMemberRoleRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMemberRoleByGuildName":
        Gs2GuildUpdateMemberRoleByGuildNameMethodCache.put_cache(
            Gs2GuildUpdateMemberRoleByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateMemberRoleByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchUpdateMemberRole":
        Gs2GuildBatchUpdateMemberRoleMethodCache.put_cache(
            Gs2GuildBatchUpdateMemberRoleResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildBatchUpdateMemberRoleRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchUpdateMemberRoleByGuildName":
        Gs2GuildBatchUpdateMemberRoleByGuildNameMethodCache.put_cache(
            Gs2GuildBatchUpdateMemberRoleByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildBatchUpdateMemberRoleByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGuild":
        Gs2GuildDeleteGuildMethodCache.put_cache(
            Gs2GuildDeleteGuildResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteGuildRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGuildByGuildName":
        Gs2GuildDeleteGuildByGuildNameMethodCache.put_cache(
            Gs2GuildDeleteGuildByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteGuildByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "increaseMaximumCurrentMaximumMemberCountByGuildName":
        Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildIncreaseMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseMaximumCurrentMaximumMemberCount":
        Gs2GuildDecreaseMaximumCurrentMaximumMemberCountMethodCache.put_cache(
            Gs2GuildDecreaseMaximumCurrentMaximumMemberCountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDecreaseMaximumCurrentMaximumMemberCountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decreaseMaximumCurrentMaximumMemberCountByGuildName":
        Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDecreaseMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCurrentMaximumMemberCount":
        Gs2GuildVerifyCurrentMaximumMemberCountMethodCache.put_cache(
            Gs2GuildVerifyCurrentMaximumMemberCountResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildVerifyCurrentMaximumMemberCountRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyCurrentMaximumMemberCountByGuildName":
        Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildVerifyCurrentMaximumMemberCountByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyIncludeMember":
        Gs2GuildVerifyIncludeMemberMethodCache.put_cache(
            Gs2GuildVerifyIncludeMemberResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildVerifyIncludeMemberRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyIncludeMemberByUserId":
        Gs2GuildVerifyIncludeMemberByUserIdMethodCache.put_cache(
            Gs2GuildVerifyIncludeMemberByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildVerifyIncludeMemberByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "setMaximumCurrentMaximumMemberCountByGuildName":
        Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameMethodCache.put_cache(
            Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildSetMaximumCurrentMaximumMemberCountByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "assume":
        Gs2GuildAssumeMethodCache.put_cache(
            Gs2GuildAssumeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildAssumeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "assumeByUserId":
        Gs2GuildAssumeByUserIdMethodCache.put_cache(
            Gs2GuildAssumeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildAssumeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeJoinedGuilds":
        Gs2GuildDescribeJoinedGuildsMethodCache.put_cache(
            Gs2GuildDescribeJoinedGuildsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeJoinedGuildsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeJoinedGuildsByUserId":
        Gs2GuildDescribeJoinedGuildsByUserIdMethodCache.put_cache(
            Gs2GuildDescribeJoinedGuildsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeJoinedGuildsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJoinedGuild":
        Gs2GuildGetJoinedGuildMethodCache.put_cache(
            Gs2GuildGetJoinedGuildResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetJoinedGuildRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJoinedGuildByUserId":
        Gs2GuildGetJoinedGuildByUserIdMethodCache.put_cache(
            Gs2GuildGetJoinedGuildByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetJoinedGuildByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMemberMetadata":
        Gs2GuildUpdateMemberMetadataMethodCache.put_cache(
            Gs2GuildUpdateMemberMetadataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateMemberMetadataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateMemberMetadataByUserId":
        Gs2GuildUpdateMemberMetadataByUserIdMethodCache.put_cache(
            Gs2GuildUpdateMemberMetadataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateMemberMetadataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "withdrawal":
        Gs2GuildWithdrawalMethodCache.put_cache(
            Gs2GuildWithdrawalResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildWithdrawalRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "withdrawalByUserId":
        Gs2GuildWithdrawalByUserIdMethodCache.put_cache(
            Gs2GuildWithdrawalByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildWithdrawalByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLastGuildMasterActivity":
        Gs2GuildGetLastGuildMasterActivityMethodCache.put_cache(
            Gs2GuildGetLastGuildMasterActivityResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetLastGuildMasterActivityRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLastGuildMasterActivityByGuildName":
        Gs2GuildGetLastGuildMasterActivityByGuildNameMethodCache.put_cache(
            Gs2GuildGetLastGuildMasterActivityByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetLastGuildMasterActivityByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "promoteSeniorMember":
        Gs2GuildPromoteSeniorMemberMethodCache.put_cache(
            Gs2GuildPromoteSeniorMemberResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildPromoteSeniorMemberRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "promoteSeniorMemberByGuildName":
        Gs2GuildPromoteSeniorMemberByGuildNameMethodCache.put_cache(
            Gs2GuildPromoteSeniorMemberByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildPromoteSeniorMemberByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2GuildExportMasterMethodCache.put_cache(
            Gs2GuildExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentGuildMaster":
        Gs2GuildGetCurrentGuildMasterMethodCache.put_cache(
            Gs2GuildGetCurrentGuildMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetCurrentGuildMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentGuildMaster":
        Gs2GuildPreUpdateCurrentGuildMasterMethodCache.put_cache(
            Gs2GuildPreUpdateCurrentGuildMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildPreUpdateCurrentGuildMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentGuildMaster":
        Gs2GuildUpdateCurrentGuildMasterMethodCache.put_cache(
            Gs2GuildUpdateCurrentGuildMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateCurrentGuildMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentGuildMasterFromGitHub":
        Gs2GuildUpdateCurrentGuildMasterFromGitHubMethodCache.put_cache(
            Gs2GuildUpdateCurrentGuildMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildUpdateCurrentGuildMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceiveRequests":
        Gs2GuildDescribeReceiveRequestsMethodCache.put_cache(
            Gs2GuildDescribeReceiveRequestsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeReceiveRequestsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceiveRequestsByGuildName":
        Gs2GuildDescribeReceiveRequestsByGuildNameMethodCache.put_cache(
            Gs2GuildDescribeReceiveRequestsByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeReceiveRequestsByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceiveRequest":
        Gs2GuildGetReceiveRequestMethodCache.put_cache(
            Gs2GuildGetReceiveRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetReceiveRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceiveRequestByGuildName":
        Gs2GuildGetReceiveRequestByGuildNameMethodCache.put_cache(
            Gs2GuildGetReceiveRequestByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetReceiveRequestByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acceptRequest":
        Gs2GuildAcceptRequestMethodCache.put_cache(
            Gs2GuildAcceptRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildAcceptRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acceptRequestByGuildName":
        Gs2GuildAcceptRequestByGuildNameMethodCache.put_cache(
            Gs2GuildAcceptRequestByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildAcceptRequestByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "rejectRequest":
        Gs2GuildRejectRequestMethodCache.put_cache(
            Gs2GuildRejectRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildRejectRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "rejectRequestByGuildName":
        Gs2GuildRejectRequestByGuildNameMethodCache.put_cache(
            Gs2GuildRejectRequestByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildRejectRequestByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSendRequests":
        Gs2GuildDescribeSendRequestsMethodCache.put_cache(
            Gs2GuildDescribeSendRequestsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeSendRequestsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSendRequestsByUserId":
        Gs2GuildDescribeSendRequestsByUserIdMethodCache.put_cache(
            Gs2GuildDescribeSendRequestsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeSendRequestsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSendRequest":
        Gs2GuildGetSendRequestMethodCache.put_cache(
            Gs2GuildGetSendRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetSendRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSendRequestByUserId":
        Gs2GuildGetSendRequestByUserIdMethodCache.put_cache(
            Gs2GuildGetSendRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetSendRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendRequest":
        Gs2GuildSendRequestMethodCache.put_cache(
            Gs2GuildSendRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildSendRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendRequestByUserId":
        Gs2GuildSendRequestByUserIdMethodCache.put_cache(
            Gs2GuildSendRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildSendRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRequest":
        Gs2GuildDeleteRequestMethodCache.put_cache(
            Gs2GuildDeleteRequestResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteRequestRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRequestByUserId":
        Gs2GuildDeleteRequestByUserIdMethodCache.put_cache(
            Gs2GuildDeleteRequestByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteRequestByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeIgnoreUsers":
        Gs2GuildDescribeIgnoreUsersMethodCache.put_cache(
            Gs2GuildDescribeIgnoreUsersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeIgnoreUsersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeIgnoreUsersByGuildName":
        Gs2GuildDescribeIgnoreUsersByGuildNameMethodCache.put_cache(
            Gs2GuildDescribeIgnoreUsersByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDescribeIgnoreUsersByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getIgnoreUser":
        Gs2GuildGetIgnoreUserMethodCache.put_cache(
            Gs2GuildGetIgnoreUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetIgnoreUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getIgnoreUserByGuildName":
        Gs2GuildGetIgnoreUserByGuildNameMethodCache.put_cache(
            Gs2GuildGetIgnoreUserByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildGetIgnoreUserByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addIgnoreUser":
        Gs2GuildAddIgnoreUserMethodCache.put_cache(
            Gs2GuildAddIgnoreUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildAddIgnoreUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addIgnoreUserByGuildName":
        Gs2GuildAddIgnoreUserByGuildNameMethodCache.put_cache(
            Gs2GuildAddIgnoreUserByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildAddIgnoreUserByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteIgnoreUser":
        Gs2GuildDeleteIgnoreUserMethodCache.put_cache(
            Gs2GuildDeleteIgnoreUserResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteIgnoreUserRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteIgnoreUserByGuildName":
        Gs2GuildDeleteIgnoreUserByGuildNameMethodCache.put_cache(
            Gs2GuildDeleteIgnoreUserByGuildNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2GuildDeleteIgnoreUserByGuildNameRequest.from_dict(_parse(request_payload))
        )
        return
    pass