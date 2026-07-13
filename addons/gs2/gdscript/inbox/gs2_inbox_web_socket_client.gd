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
class_name Gs2InboxWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2InboxCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.is_automatic_deleting_enabled != null:
        body["isAutomaticDeletingEnabled"] = request.is_automatic_deleting_enabled
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.receive_message_script != null:
        body["receiveMessageScript"] = request.receive_message_script.to_dict()
    if request.read_message_script != null:
        body["readMessageScript"] = request.read_message_script.to_dict()
    if request.delete_message_script != null:
        body["deleteMessageScript"] = request.delete_message_script.to_dict()
    if request.receive_notification != null:
        body["receiveNotification"] = request.receive_notification.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.queue_namespace_id != null:
        body["queueNamespaceId"] = request.queue_namespace_id
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2InboxGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2InboxGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2InboxUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.is_automatic_deleting_enabled != null:
        body["isAutomaticDeletingEnabled"] = request.is_automatic_deleting_enabled
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.receive_message_script != null:
        body["receiveMessageScript"] = request.receive_message_script.to_dict()
    if request.read_message_script != null:
        body["readMessageScript"] = request.read_message_script.to_dict()
    if request.delete_message_script != null:
        body["deleteMessageScript"] = request.delete_message_script.to_dict()
    if request.receive_notification != null:
        body["receiveNotification"] = request.receive_notification.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.queue_namespace_id != null:
        body["queueNamespaceId"] = request.queue_namespace_id
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2InboxDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2InboxGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2InboxDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2InboxCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2InboxCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2InboxCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2InboxPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2InboxImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("inbox", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2InboxCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("inbox", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func pre_update_current_message_master(request: Gs2InboxPreUpdateCurrentMessageMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "currentMessageMaster", "preUpdateCurrentMessageMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxPreUpdateCurrentMessageMasterResult.from_dict(response.body), null)


func get_received_by_user_id(request: Gs2InboxGetReceivedByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "received", "getReceivedByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxGetReceivedByUserIdResult.from_dict(response.body), null)


func update_received_by_user_id(request: Gs2InboxUpdateReceivedByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.received_global_message_names != null:
        body["receivedGlobalMessageNames"] = request.received_global_message_names
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("inbox", "received", "updateReceivedByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxUpdateReceivedByUserIdResult.from_dict(response.body), null)


func delete_received_by_user_id(request: Gs2InboxDeleteReceivedByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
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
    var response = await session.send("inbox", "received", "deleteReceivedByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2InboxDeleteReceivedByUserIdResult.from_dict(response.body), null)