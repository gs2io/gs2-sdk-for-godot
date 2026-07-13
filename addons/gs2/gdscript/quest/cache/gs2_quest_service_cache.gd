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
class_name Gs2QuestServiceCache
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
        Gs2QuestDescribeNamespacesMethodCache.put_cache(
            Gs2QuestDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2QuestCreateNamespaceMethodCache.put_cache(
            Gs2QuestCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2QuestGetNamespaceStatusMethodCache.put_cache(
            Gs2QuestGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2QuestGetNamespaceMethodCache.put_cache(
            Gs2QuestGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2QuestUpdateNamespaceMethodCache.put_cache(
            Gs2QuestUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2QuestDeleteNamespaceMethodCache.put_cache(
            Gs2QuestDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2QuestGetServiceVersionMethodCache.put_cache(
            Gs2QuestGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2QuestDumpUserDataByUserIdMethodCache.put_cache(
            Gs2QuestDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2QuestCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2QuestCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2QuestCleanUserDataByUserIdMethodCache.put_cache(
            Gs2QuestCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2QuestCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2QuestCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2QuestPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2QuestPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2QuestImportUserDataByUserIdMethodCache.put_cache(
            Gs2QuestImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2QuestCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2QuestCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeQuestGroupModelMasters":
        Gs2QuestDescribeQuestGroupModelMastersMethodCache.put_cache(
            Gs2QuestDescribeQuestGroupModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeQuestGroupModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createQuestGroupModelMaster":
        Gs2QuestCreateQuestGroupModelMasterMethodCache.put_cache(
            Gs2QuestCreateQuestGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCreateQuestGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getQuestGroupModelMaster":
        Gs2QuestGetQuestGroupModelMasterMethodCache.put_cache(
            Gs2QuestGetQuestGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetQuestGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateQuestGroupModelMaster":
        Gs2QuestUpdateQuestGroupModelMasterMethodCache.put_cache(
            Gs2QuestUpdateQuestGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestUpdateQuestGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteQuestGroupModelMaster":
        Gs2QuestDeleteQuestGroupModelMasterMethodCache.put_cache(
            Gs2QuestDeleteQuestGroupModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDeleteQuestGroupModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeQuestModelMasters":
        Gs2QuestDescribeQuestModelMastersMethodCache.put_cache(
            Gs2QuestDescribeQuestModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeQuestModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createQuestModelMaster":
        Gs2QuestCreateQuestModelMasterMethodCache.put_cache(
            Gs2QuestCreateQuestModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCreateQuestModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getQuestModelMaster":
        Gs2QuestGetQuestModelMasterMethodCache.put_cache(
            Gs2QuestGetQuestModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetQuestModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateQuestModelMaster":
        Gs2QuestUpdateQuestModelMasterMethodCache.put_cache(
            Gs2QuestUpdateQuestModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestUpdateQuestModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteQuestModelMaster":
        Gs2QuestDeleteQuestModelMasterMethodCache.put_cache(
            Gs2QuestDeleteQuestModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDeleteQuestModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2QuestExportMasterMethodCache.put_cache(
            Gs2QuestExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentQuestMaster":
        Gs2QuestGetCurrentQuestMasterMethodCache.put_cache(
            Gs2QuestGetCurrentQuestMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetCurrentQuestMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentQuestMaster":
        Gs2QuestPreUpdateCurrentQuestMasterMethodCache.put_cache(
            Gs2QuestPreUpdateCurrentQuestMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestPreUpdateCurrentQuestMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentQuestMaster":
        Gs2QuestUpdateCurrentQuestMasterMethodCache.put_cache(
            Gs2QuestUpdateCurrentQuestMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestUpdateCurrentQuestMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentQuestMasterFromGitHub":
        Gs2QuestUpdateCurrentQuestMasterFromGitHubMethodCache.put_cache(
            Gs2QuestUpdateCurrentQuestMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestUpdateCurrentQuestMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeProgressesByUserId":
        Gs2QuestDescribeProgressesByUserIdMethodCache.put_cache(
            Gs2QuestDescribeProgressesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeProgressesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createProgressByUserId":
        Gs2QuestCreateProgressByUserIdMethodCache.put_cache(
            Gs2QuestCreateProgressByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestCreateProgressByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProgress":
        Gs2QuestGetProgressMethodCache.put_cache(
            Gs2QuestGetProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProgressByUserId":
        Gs2QuestGetProgressByUserIdMethodCache.put_cache(
            Gs2QuestGetProgressByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetProgressByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "start":
        Gs2QuestStartMethodCache.put_cache(
            Gs2QuestStartResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestStartRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "startByUserId":
        Gs2QuestStartByUserIdMethodCache.put_cache(
            Gs2QuestStartByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestStartByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "end":
        Gs2QuestEndMethodCache.put_cache(
            Gs2QuestEndResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestEndRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "endByUserId":
        Gs2QuestEndByUserIdMethodCache.put_cache(
            Gs2QuestEndByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestEndByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteProgress":
        Gs2QuestDeleteProgressMethodCache.put_cache(
            Gs2QuestDeleteProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDeleteProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteProgressByUserId":
        Gs2QuestDeleteProgressByUserIdMethodCache.put_cache(
            Gs2QuestDeleteProgressByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDeleteProgressByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCompletedQuestLists":
        Gs2QuestDescribeCompletedQuestListsMethodCache.put_cache(
            Gs2QuestDescribeCompletedQuestListsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeCompletedQuestListsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCompletedQuestListsByUserId":
        Gs2QuestDescribeCompletedQuestListsByUserIdMethodCache.put_cache(
            Gs2QuestDescribeCompletedQuestListsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeCompletedQuestListsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCompletedQuestList":
        Gs2QuestGetCompletedQuestListMethodCache.put_cache(
            Gs2QuestGetCompletedQuestListResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetCompletedQuestListRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCompletedQuestListByUserId":
        Gs2QuestGetCompletedQuestListByUserIdMethodCache.put_cache(
            Gs2QuestGetCompletedQuestListByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetCompletedQuestListByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCompletedQuestListByUserId":
        Gs2QuestDeleteCompletedQuestListByUserIdMethodCache.put_cache(
            Gs2QuestDeleteCompletedQuestListByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDeleteCompletedQuestListByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeQuestGroupModels":
        Gs2QuestDescribeQuestGroupModelsMethodCache.put_cache(
            Gs2QuestDescribeQuestGroupModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeQuestGroupModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getQuestGroupModel":
        Gs2QuestGetQuestGroupModelMethodCache.put_cache(
            Gs2QuestGetQuestGroupModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetQuestGroupModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeQuestModels":
        Gs2QuestDescribeQuestModelsMethodCache.put_cache(
            Gs2QuestDescribeQuestModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestDescribeQuestModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getQuestModel":
        Gs2QuestGetQuestModelMethodCache.put_cache(
            Gs2QuestGetQuestModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2QuestGetQuestModelRequest.from_dict(_parse(request_payload))
        )
        return
    pass