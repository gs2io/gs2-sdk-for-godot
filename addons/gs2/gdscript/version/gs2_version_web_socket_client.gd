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
class_name Gs2VersionWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2VersionCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.assume_user_id != null:
        body["assumeUserId"] = request.assume_user_id
    if request.accept_version_script != null:
        body["acceptVersionScript"] = request.accept_version_script.to_dict()
    if request.check_version_trigger_script_id != null:
        body["checkVersionTriggerScriptId"] = request.check_version_trigger_script_id
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2VersionGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2VersionGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2VersionUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.transaction_setting_v2 != null:
        body["transactionSettingV2"] = request.transaction_setting_v2.to_dict()
    if request.assume_user_id != null:
        body["assumeUserId"] = request.assume_user_id
    if request.accept_version_script != null:
        body["acceptVersionScript"] = request.accept_version_script.to_dict()
    if request.check_version_trigger_script_id != null:
        body["checkVersionTriggerScriptId"] = request.check_version_trigger_script_id
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2VersionDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2VersionGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2VersionDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2VersionCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2VersionCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2VersionCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2VersionPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2VersionImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("version", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2VersionCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("version", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func create_version_model_master(request: Gs2VersionCreateVersionModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.scope != null:
        body["scope"] = request.scope
    if request.type != null:
        body["type"] = request.type
    if request.current_version != null:
        body["currentVersion"] = request.current_version.to_dict()
    if request.warning_version != null:
        body["warningVersion"] = request.warning_version.to_dict()
    if request.error_version != null:
        body["errorVersion"] = request.error_version.to_dict()
    if request.schedule_versions != null:
        body["scheduleVersions"] = request.schedule_versions.map(func(v): return null if v == null else v.to_dict())
    if request.need_signature != null:
        body["needSignature"] = request.need_signature
    if request.signature_key_id != null:
        body["signatureKeyId"] = request.signature_key_id
    if request.approve_requirement != null:
        body["approveRequirement"] = request.approve_requirement
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "versionModelMaster", "createVersionModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionCreateVersionModelMasterResult.from_dict(response.body), null)


func get_version_model_master(request: Gs2VersionGetVersionModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "versionModelMaster", "getVersionModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetVersionModelMasterResult.from_dict(response.body), null)


func update_version_model_master(request: Gs2VersionUpdateVersionModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.scope != null:
        body["scope"] = request.scope
    if request.type != null:
        body["type"] = request.type
    if request.current_version != null:
        body["currentVersion"] = request.current_version.to_dict()
    if request.warning_version != null:
        body["warningVersion"] = request.warning_version.to_dict()
    if request.error_version != null:
        body["errorVersion"] = request.error_version.to_dict()
    if request.schedule_versions != null:
        body["scheduleVersions"] = request.schedule_versions.map(func(v): return null if v == null else v.to_dict())
    if request.need_signature != null:
        body["needSignature"] = request.need_signature
    if request.signature_key_id != null:
        body["signatureKeyId"] = request.signature_key_id
    if request.approve_requirement != null:
        body["approveRequirement"] = request.approve_requirement
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "versionModelMaster", "updateVersionModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionUpdateVersionModelMasterResult.from_dict(response.body), null)


func delete_version_model_master(request: Gs2VersionDeleteVersionModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "versionModelMaster", "deleteVersionModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionDeleteVersionModelMasterResult.from_dict(response.body), null)


func get_version_model(request: Gs2VersionGetVersionModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "versionModel", "getVersionModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetVersionModelResult.from_dict(response.body), null)


func accept(request: Gs2VersionAcceptRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.version != null:
        body["version"] = request.version.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "accept", body)
    if response.error != null:
        if response.error.has_error_code("version.accept.version.invalid"):
            return Gs2AsyncResult.new(null, Gs2VersionAcceptVersionInvalidException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionAcceptResult.from_dict(response.body), null)


func accept_by_user_id(request: Gs2VersionAcceptByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.version != null:
        body["version"] = request.version.to_dict()
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "acceptByUserId", body)
    if response.error != null:
        if response.error.has_error_code("version.accept.version.invalid"):
            return Gs2AsyncResult.new(null, Gs2VersionAcceptVersionInvalidException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionAcceptByUserIdResult.from_dict(response.body), null)


func reject(request: Gs2VersionRejectRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.version != null:
        body["version"] = request.version.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "reject", body)
    if response.error != null:
        if response.error.has_error_code("version.accept.version.invalid"):
            return Gs2AsyncResult.new(null, Gs2VersionAcceptVersionInvalidException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionRejectResult.from_dict(response.body), null)


func reject_by_user_id(request: Gs2VersionRejectByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.version != null:
        body["version"] = request.version.to_dict()
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "rejectByUserId", body)
    if response.error != null:
        if response.error.has_error_code("version.accept.version.invalid"):
            return Gs2AsyncResult.new(null, Gs2VersionAcceptVersionInvalidException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionRejectByUserIdResult.from_dict(response.body), null)


func get_accept_version(request: Gs2VersionGetAcceptVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "getAcceptVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetAcceptVersionResult.from_dict(response.body), null)


func get_accept_version_by_user_id(request: Gs2VersionGetAcceptVersionByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "getAcceptVersionByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionGetAcceptVersionByUserIdResult.from_dict(response.body), null)


func delete_accept_version(request: Gs2VersionDeleteAcceptVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "deleteAcceptVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionDeleteAcceptVersionResult.from_dict(response.body), null)


func delete_accept_version_by_user_id(request: Gs2VersionDeleteAcceptVersionByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.version_name != null:
        body["versionName"] = request.version_name
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "acceptVersion", "deleteAcceptVersionByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionDeleteAcceptVersionByUserIdResult.from_dict(response.body), null)


func pre_update_current_version_master(request: Gs2VersionPreUpdateCurrentVersionMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("version", "currentVersionMaster", "preUpdateCurrentVersionMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2VersionPreUpdateCurrentVersionMasterResult.from_dict(response.body), null)