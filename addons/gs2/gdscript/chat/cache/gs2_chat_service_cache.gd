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
class_name Gs2ChatServiceCache
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
        Gs2ChatDescribeNamespacesMethodCache.put_cache(
            Gs2ChatDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2ChatCreateNamespaceMethodCache.put_cache(
            Gs2ChatCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2ChatGetNamespaceStatusMethodCache.put_cache(
            Gs2ChatGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2ChatGetNamespaceMethodCache.put_cache(
            Gs2ChatGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2ChatUpdateNamespaceMethodCache.put_cache(
            Gs2ChatUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2ChatDeleteNamespaceMethodCache.put_cache(
            Gs2ChatDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ChatGetServiceVersionMethodCache.put_cache(
            Gs2ChatGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2ChatDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ChatDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2ChatCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2ChatCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2ChatCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ChatCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2ChatCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2ChatCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2ChatPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2ChatPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2ChatImportUserDataByUserIdMethodCache.put_cache(
            Gs2ChatImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2ChatCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2ChatCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRooms":
        Gs2ChatDescribeRoomsMethodCache.put_cache(
            Gs2ChatDescribeRoomsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeRoomsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRoom":
        Gs2ChatCreateRoomMethodCache.put_cache(
            Gs2ChatCreateRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCreateRoomRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createRoomFromBackend":
        Gs2ChatCreateRoomFromBackendMethodCache.put_cache(
            Gs2ChatCreateRoomFromBackendResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCreateRoomFromBackendRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRoom":
        Gs2ChatGetRoomMethodCache.put_cache(
            Gs2ChatGetRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetRoomRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRoom":
        Gs2ChatUpdateRoomMethodCache.put_cache(
            Gs2ChatUpdateRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateRoomRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateRoomFromBackend":
        Gs2ChatUpdateRoomFromBackendMethodCache.put_cache(
            Gs2ChatUpdateRoomFromBackendResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateRoomFromBackendRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRoom":
        Gs2ChatDeleteRoomMethodCache.put_cache(
            Gs2ChatDeleteRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDeleteRoomRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRoomFromBackend":
        Gs2ChatDeleteRoomFromBackendMethodCache.put_cache(
            Gs2ChatDeleteRoomFromBackendResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDeleteRoomFromBackendRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMessages":
        Gs2ChatDescribeMessagesMethodCache.put_cache(
            Gs2ChatDescribeMessagesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeMessagesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMessagesByUserId":
        Gs2ChatDescribeMessagesByUserIdMethodCache.put_cache(
            Gs2ChatDescribeMessagesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeMessagesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLatestMessages":
        Gs2ChatDescribeLatestMessagesMethodCache.put_cache(
            Gs2ChatDescribeLatestMessagesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeLatestMessagesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLatestMessagesByUserId":
        Gs2ChatDescribeLatestMessagesByUserIdMethodCache.put_cache(
            Gs2ChatDescribeLatestMessagesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeLatestMessagesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "post":
        Gs2ChatPostMethodCache.put_cache(
            Gs2ChatPostResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatPostRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "postByUserId":
        Gs2ChatPostByUserIdMethodCache.put_cache(
            Gs2ChatPostByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatPostByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMessage":
        Gs2ChatGetMessageMethodCache.put_cache(
            Gs2ChatGetMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMessageByUserId":
        Gs2ChatGetMessageByUserIdMethodCache.put_cache(
            Gs2ChatGetMessageByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetMessageByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMessage":
        Gs2ChatDeleteMessageMethodCache.put_cache(
            Gs2ChatDeleteMessageResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDeleteMessageRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribes":
        Gs2ChatDescribeSubscribesMethodCache.put_cache(
            Gs2ChatDescribeSubscribesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeSubscribesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribesByUserId":
        Gs2ChatDescribeSubscribesByUserIdMethodCache.put_cache(
            Gs2ChatDescribeSubscribesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeSubscribesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribesByRoomName":
        Gs2ChatDescribeSubscribesByRoomNameMethodCache.put_cache(
            Gs2ChatDescribeSubscribesByRoomNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeSubscribesByRoomNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subscribe":
        Gs2ChatSubscribeMethodCache.put_cache(
            Gs2ChatSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subscribeByUserId":
        Gs2ChatSubscribeByUserIdMethodCache.put_cache(
            Gs2ChatSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribe":
        Gs2ChatGetSubscribeMethodCache.put_cache(
            Gs2ChatGetSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeByUserId":
        Gs2ChatGetSubscribeByUserIdMethodCache.put_cache(
            Gs2ChatGetSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNotificationType":
        Gs2ChatUpdateNotificationTypeMethodCache.put_cache(
            Gs2ChatUpdateNotificationTypeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateNotificationTypeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNotificationTypeByUserId":
        Gs2ChatUpdateNotificationTypeByUserIdMethodCache.put_cache(
            Gs2ChatUpdateNotificationTypeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateNotificationTypeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unsubscribe":
        Gs2ChatUnsubscribeMethodCache.put_cache(
            Gs2ChatUnsubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUnsubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unsubscribeByUserId":
        Gs2ChatUnsubscribeByUserIdMethodCache.put_cache(
            Gs2ChatUnsubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUnsubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCategoryModels":
        Gs2ChatDescribeCategoryModelsMethodCache.put_cache(
            Gs2ChatDescribeCategoryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeCategoryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCategoryModel":
        Gs2ChatGetCategoryModelMethodCache.put_cache(
            Gs2ChatGetCategoryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetCategoryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCategoryModelMasters":
        Gs2ChatDescribeCategoryModelMastersMethodCache.put_cache(
            Gs2ChatDescribeCategoryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDescribeCategoryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createCategoryModelMaster":
        Gs2ChatCreateCategoryModelMasterMethodCache.put_cache(
            Gs2ChatCreateCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatCreateCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCategoryModelMaster":
        Gs2ChatGetCategoryModelMasterMethodCache.put_cache(
            Gs2ChatGetCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCategoryModelMaster":
        Gs2ChatUpdateCategoryModelMasterMethodCache.put_cache(
            Gs2ChatUpdateCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCategoryModelMaster":
        Gs2ChatDeleteCategoryModelMasterMethodCache.put_cache(
            Gs2ChatDeleteCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatDeleteCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2ChatExportMasterMethodCache.put_cache(
            Gs2ChatExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentModelMaster":
        Gs2ChatGetCurrentModelMasterMethodCache.put_cache(
            Gs2ChatGetCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatGetCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentModelMaster":
        Gs2ChatPreUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2ChatPreUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatPreUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMaster":
        Gs2ChatUpdateCurrentModelMasterMethodCache.put_cache(
            Gs2ChatUpdateCurrentModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateCurrentModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentModelMasterFromGitHub":
        Gs2ChatUpdateCurrentModelMasterFromGitHubMethodCache.put_cache(
            Gs2ChatUpdateCurrentModelMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ChatUpdateCurrentModelMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass