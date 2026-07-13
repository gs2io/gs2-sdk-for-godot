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
class_name Gs2InboxServiceCache
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
        Gs2InboxDescribeNamespacesMethodCache.put_cache(
            Gs2InboxDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2InboxCreateNamespaceMethodCache.put_cache(
            Gs2InboxCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2InboxGetNamespaceStatusMethodCache.put_cache(
            Gs2InboxGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2InboxGetNamespaceMethodCache.put_cache(
            Gs2InboxGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2InboxUpdateNamespaceMethodCache.put_cache(
            Gs2InboxUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2InboxDeleteNamespaceMethodCache.put_cache(
            Gs2InboxDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2InboxGetServiceVersionMethodCache.put_cache(
            Gs2InboxGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2InboxDumpUserDataByUserIdMethodCache.put_cache(
            Gs2InboxDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2InboxCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2InboxCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2InboxCleanUserDataByUserIdMethodCache.put_cache(
            Gs2InboxCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2InboxCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2InboxCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2InboxPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2InboxPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2InboxImportUserDataByUserIdMethodCache.put_cache(
            Gs2InboxImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2InboxCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2InboxCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMessages":
        Gs2InboxDescribeMessagesMethodCache.put_cache(
            Gs2InboxDescribeMessagesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDescribeMessagesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMessagesByUserId":
        Gs2InboxDescribeMessagesByUserIdMethodCache.put_cache(
            Gs2InboxDescribeMessagesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDescribeMessagesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendMessageByUserId":
        Gs2InboxSendMessageByUserIdMethodCache.put_cache(
            Gs2InboxSendMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxSendMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMessage":
        Gs2InboxGetMessageMethodCache.put_cache(
            Gs2InboxGetMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMessageByUserId":
        Gs2InboxGetMessageByUserIdMethodCache.put_cache(
            Gs2InboxGetMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveGlobalMessage":
        Gs2InboxReceiveGlobalMessageMethodCache.put_cache(
            Gs2InboxReceiveGlobalMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxReceiveGlobalMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveGlobalMessageByUserId":
        Gs2InboxReceiveGlobalMessageByUserIdMethodCache.put_cache(
            Gs2InboxReceiveGlobalMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxReceiveGlobalMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "openMessage":
        Gs2InboxOpenMessageMethodCache.put_cache(
            Gs2InboxOpenMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxOpenMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "openMessageByUserId":
        Gs2InboxOpenMessageByUserIdMethodCache.put_cache(
            Gs2InboxOpenMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxOpenMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "closeMessageByUserId":
        Gs2InboxCloseMessageByUserIdMethodCache.put_cache(
            Gs2InboxCloseMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCloseMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "readMessage":
        Gs2InboxReadMessageMethodCache.put_cache(
            Gs2InboxReadMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxReadMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "readMessageByUserId":
        Gs2InboxReadMessageByUserIdMethodCache.put_cache(
            Gs2InboxReadMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxReadMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchReadMessages":
        Gs2InboxBatchReadMessagesMethodCache.put_cache(
            Gs2InboxBatchReadMessagesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxBatchReadMessagesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "batchReadMessagesByUserId":
        Gs2InboxBatchReadMessagesByUserIdMethodCache.put_cache(
            Gs2InboxBatchReadMessagesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxBatchReadMessagesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMessage":
        Gs2InboxDeleteMessageMethodCache.put_cache(
            Gs2InboxDeleteMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDeleteMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMessageByUserId":
        Gs2InboxDeleteMessageByUserIdMethodCache.put_cache(
            Gs2InboxDeleteMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDeleteMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2InboxExportMasterMethodCache.put_cache(
            Gs2InboxExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentMessageMaster":
        Gs2InboxGetCurrentMessageMasterMethodCache.put_cache(
            Gs2InboxGetCurrentMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetCurrentMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentMessageMaster":
        Gs2InboxPreUpdateCurrentMessageMasterMethodCache.put_cache(
            Gs2InboxPreUpdateCurrentMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxPreUpdateCurrentMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentMessageMaster":
        Gs2InboxUpdateCurrentMessageMasterMethodCache.put_cache(
            Gs2InboxUpdateCurrentMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxUpdateCurrentMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentMessageMasterFromGitHub":
        Gs2InboxUpdateCurrentMessageMasterFromGitHubMethodCache.put_cache(
            Gs2InboxUpdateCurrentMessageMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxUpdateCurrentMessageMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalMessageMasters":
        Gs2InboxDescribeGlobalMessageMastersMethodCache.put_cache(
            Gs2InboxDescribeGlobalMessageMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDescribeGlobalMessageMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGlobalMessageMaster":
        Gs2InboxCreateGlobalMessageMasterMethodCache.put_cache(
            Gs2InboxCreateGlobalMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxCreateGlobalMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalMessageMaster":
        Gs2InboxGetGlobalMessageMasterMethodCache.put_cache(
            Gs2InboxGetGlobalMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetGlobalMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGlobalMessageMaster":
        Gs2InboxUpdateGlobalMessageMasterMethodCache.put_cache(
            Gs2InboxUpdateGlobalMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxUpdateGlobalMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGlobalMessageMaster":
        Gs2InboxDeleteGlobalMessageMasterMethodCache.put_cache(
            Gs2InboxDeleteGlobalMessageMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDeleteGlobalMessageMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalMessages":
        Gs2InboxDescribeGlobalMessagesMethodCache.put_cache(
            Gs2InboxDescribeGlobalMessagesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDescribeGlobalMessagesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalMessage":
        Gs2InboxGetGlobalMessageMethodCache.put_cache(
            Gs2InboxGetGlobalMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetGlobalMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceivedByUserId":
        Gs2InboxGetReceivedByUserIdMethodCache.put_cache(
            Gs2InboxGetReceivedByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxGetReceivedByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateReceivedByUserId":
        Gs2InboxUpdateReceivedByUserIdMethodCache.put_cache(
            Gs2InboxUpdateReceivedByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxUpdateReceivedByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteReceivedByUserId":
        Gs2InboxDeleteReceivedByUserIdMethodCache.put_cache(
            Gs2InboxDeleteReceivedByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2InboxDeleteReceivedByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass