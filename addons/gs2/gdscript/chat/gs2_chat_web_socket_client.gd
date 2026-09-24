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
class_name Gs2ChatWebSocketClient
extends Gs2AbstractWebSocketClient


func get_namespace_status(request: Gs2ChatGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetNamespaceStatusResult.from_dict(response.body), null)


func get_service_version(request: Gs2ChatGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2ChatDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2ChatCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2ChatCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2ChatCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2ChatPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2ChatImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2ChatCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func post(request: Gs2ChatPostRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.category != null:
        body["category"] = request.category
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.password != null:
        body["password"] = request.password
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "message", "post", body)
    if response.error != null:
        if response.error.has_error_code("room.allowUserIds.notInclude"):
            return Gs2AsyncResult.new(null, Gs2ChatNoAccessPrivilegesException.new(response.error))
        if response.error.has_error_code("room.password.require"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordRequiredException.new(response.error))
        if response.error.has_error_code("room.password.invalid"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordIncorrectException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatPostResult.from_dict(response.body), null)


func post_by_user_id(request: Gs2ChatPostByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.category != null:
        body["category"] = request.category
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.password != null:
        body["password"] = request.password
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "message", "postByUserId", body)
    if response.error != null:
        if response.error.has_error_code("room.allowUserIds.notInclude"):
            return Gs2AsyncResult.new(null, Gs2ChatNoAccessPrivilegesException.new(response.error))
        if response.error.has_error_code("room.password.require"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordRequiredException.new(response.error))
        if response.error.has_error_code("room.password.invalid"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordIncorrectException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatPostByUserIdResult.from_dict(response.body), null)


func get_message(request: Gs2ChatGetMessageRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.message_name != null:
        body["messageName"] = request.message_name
    if request.password != null:
        body["password"] = request.password
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "message", "getMessage", body)
    if response.error != null:
        if response.error.has_error_code("room.allowUserIds.notInclude"):
            return Gs2AsyncResult.new(null, Gs2ChatNoAccessPrivilegesException.new(response.error))
        if response.error.has_error_code("room.password.require"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordRequiredException.new(response.error))
        if response.error.has_error_code("room.password.invalid"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordIncorrectException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetMessageResult.from_dict(response.body), null)


func get_message_by_user_id(request: Gs2ChatGetMessageByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.message_name != null:
        body["messageName"] = request.message_name
    if request.password != null:
        body["password"] = request.password
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "message", "getMessageByUserId", body)
    if response.error != null:
        if response.error.has_error_code("room.allowUserIds.notInclude"):
            return Gs2AsyncResult.new(null, Gs2ChatNoAccessPrivilegesException.new(response.error))
        if response.error.has_error_code("room.password.require"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordRequiredException.new(response.error))
        if response.error.has_error_code("room.password.invalid"):
            return Gs2AsyncResult.new(null, Gs2ChatPasswordIncorrectException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetMessageByUserIdResult.from_dict(response.body), null)


func delete_message(request: Gs2ChatDeleteMessageRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.message_name != null:
        body["messageName"] = request.message_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "message", "deleteMessage", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatDeleteMessageResult.from_dict(response.body), null)


func subscribe(request: Gs2ChatSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.notification_types != null:
        body["notificationTypes"] = request.notification_types.map(func(v): return null if v == null else v.to_dict())
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "subscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatSubscribeResult.from_dict(response.body), null)


func subscribe_by_user_id(request: Gs2ChatSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.notification_types != null:
        body["notificationTypes"] = request.notification_types.map(func(v): return null if v == null else v.to_dict())
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "subscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatSubscribeByUserIdResult.from_dict(response.body), null)


func get_subscribe(request: Gs2ChatGetSubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "getSubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetSubscribeResult.from_dict(response.body), null)


func get_subscribe_by_user_id(request: Gs2ChatGetSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "getSubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetSubscribeByUserIdResult.from_dict(response.body), null)


func update_notification_type(request: Gs2ChatUpdateNotificationTypeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.notification_types != null:
        body["notificationTypes"] = request.notification_types.map(func(v): return null if v == null else v.to_dict())
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "updateNotificationType", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatUpdateNotificationTypeResult.from_dict(response.body), null)


func update_notification_type_by_user_id(request: Gs2ChatUpdateNotificationTypeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.notification_types != null:
        body["notificationTypes"] = request.notification_types.map(func(v): return null if v == null else v.to_dict())
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "updateNotificationTypeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatUpdateNotificationTypeByUserIdResult.from_dict(response.body), null)


func unsubscribe(request: Gs2ChatUnsubscribeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "unsubscribe", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatUnsubscribeResult.from_dict(response.body), null)


func unsubscribe_by_user_id(request: Gs2ChatUnsubscribeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.room_name != null:
        body["roomName"] = request.room_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "subscribe", "unsubscribeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatUnsubscribeByUserIdResult.from_dict(response.body), null)


func get_category_model(request: Gs2ChatGetCategoryModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category != null:
        body["category"] = request.category
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "categoryModel", "getCategoryModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetCategoryModelResult.from_dict(response.body), null)


func create_category_model_master(request: Gs2ChatCreateCategoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category != null:
        body["category"] = request.category
    if request.description != null:
        body["description"] = request.description
    if request.reject_access_token_post != null:
        body["rejectAccessTokenPost"] = request.reject_access_token_post
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "categoryModelMaster", "createCategoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatCreateCategoryModelMasterResult.from_dict(response.body), null)


func get_category_model_master(request: Gs2ChatGetCategoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category != null:
        body["category"] = request.category
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "categoryModelMaster", "getCategoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatGetCategoryModelMasterResult.from_dict(response.body), null)


func update_category_model_master(request: Gs2ChatUpdateCategoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category != null:
        body["category"] = request.category
    if request.description != null:
        body["description"] = request.description
    if request.reject_access_token_post != null:
        body["rejectAccessTokenPost"] = request.reject_access_token_post
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "categoryModelMaster", "updateCategoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatUpdateCategoryModelMasterResult.from_dict(response.body), null)


func delete_category_model_master(request: Gs2ChatDeleteCategoryModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.category != null:
        body["category"] = request.category
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "categoryModelMaster", "deleteCategoryModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatDeleteCategoryModelMasterResult.from_dict(response.body), null)


func pre_update_current_model_master(request: Gs2ChatPreUpdateCurrentModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("chat", "currentModelMaster", "preUpdateCurrentModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ChatPreUpdateCurrentModelMasterResult.from_dict(response.body), null)