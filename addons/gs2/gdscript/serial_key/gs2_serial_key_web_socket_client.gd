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
class_name Gs2SerialKeyWebSocketClient
extends Gs2AbstractWebSocketClient


func create_namespace(request: Gs2SerialKeyCreateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "createNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2SerialKeyGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "getNamespaceStatus", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2SerialKeyGetNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "getNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2SerialKeyUpdateNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "updateNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2SerialKeyDeleteNamespaceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "deleteNamespace", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2SerialKeyGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2SerialKeyDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "dumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2SerialKeyCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "checkDumpUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2SerialKeyCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "cleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2SerialKeyCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "checkCleanUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2SerialKeyPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "namespace", "prepareImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2SerialKeyImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("serialKey", "namespace", "importUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2SerialKeyCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
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
    var response = await session.send("serialKey", "namespace", "checkImportUserDataByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func get_issue_job(request: Gs2SerialKeyGetIssueJobRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.issue_job_name != null:
        body["issueJobName"] = request.issue_job_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "issueJob", "getIssueJob", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetIssueJobResult.from_dict(response.body), null)


func issue(request: Gs2SerialKeyIssueRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.issue_request_count != null:
        body["issueRequestCount"] = request.issue_request_count
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "issueJob", "issue", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyIssueResult.from_dict(response.body), null)


func download_serial_codes(request: Gs2SerialKeyDownloadSerialCodesRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.issue_job_name != null:
        body["issueJobName"] = request.issue_job_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "downloadSerialCodes", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyDownloadSerialCodesResult.from_dict(response.body), null)


func issue_once(request: Gs2SerialKeyIssueOnceRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "issueOnce", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyIssueOnceResult.from_dict(response.body), null)


func get_serial_key(request: Gs2SerialKeyGetSerialKeyRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.code != null:
        body["code"] = request.code
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "getSerialKey", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetSerialKeyResult.from_dict(response.body), null)


func verify_code(request: Gs2SerialKeyVerifyCodeRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.code != null:
        body["code"] = request.code
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "verifyCode", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyVerifyCodeResult.from_dict(response.body), null)


func verify_code_by_user_id(request: Gs2SerialKeyVerifyCodeByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.code != null:
        body["code"] = request.code
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "verifyCodeByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyVerifyCodeByUserIdResult.from_dict(response.body), null)


func use(request: Gs2SerialKeyUseRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.access_token != null:
        body["accessToken"] = request.access_token
    if request.code != null:
        body["code"] = request.code
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.access_token != null:
        body["xGs2AccessToken"] = request.access_token
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "use", body)
    if response.error != null:
        if response.error.has_error_code("code.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2SerialKeyAlreadyUsedException.new(response.error))
        if response.error.has_error_code("code.code.notFound"):
            return Gs2AsyncResult.new(null, Gs2SerialKeyCodeNotFoundException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUseResult.from_dict(response.body), null)


func use_by_user_id(request: Gs2SerialKeyUseByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.code != null:
        body["code"] = request.code
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "useByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUseByUserIdResult.from_dict(response.body), null)


func revert_use_by_user_id(request: Gs2SerialKeyRevertUseByUserIdRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.code != null:
        body["code"] = request.code
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "revertUseByUserId", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyRevertUseByUserIdResult.from_dict(response.body), null)


func revert_use_by_stamp_sheet(request: Gs2SerialKeyRevertUseByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "revertUseByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyRevertUseByStampSheetResult.from_dict(response.body), null)


func issue_once_by_stamp_sheet(request: Gs2SerialKeyIssueOnceByStampSheetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "serialKey", "issueOnceByStampSheet", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyIssueOnceByStampSheetResult.from_dict(response.body), null)


func get_campaign_model(request: Gs2SerialKeyGetCampaignModelRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "campaignModel", "getCampaignModel", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetCampaignModelResult.from_dict(response.body), null)


func create_campaign_model_master(request: Gs2SerialKeyCreateCampaignModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.enable_campaign_code != null:
        body["enableCampaignCode"] = request.enable_campaign_code
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "campaignModelMaster", "createCampaignModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCreateCampaignModelMasterResult.from_dict(response.body), null)


func get_campaign_model_master(request: Gs2SerialKeyGetCampaignModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "campaignModelMaster", "getCampaignModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyGetCampaignModelMasterResult.from_dict(response.body), null)


func update_campaign_model_master(request: Gs2SerialKeyUpdateCampaignModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.enable_campaign_code != null:
        body["enableCampaignCode"] = request.enable_campaign_code
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "campaignModelMaster", "updateCampaignModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUpdateCampaignModelMasterResult.from_dict(response.body), null)


func delete_campaign_model_master(request: Gs2SerialKeyDeleteCampaignModelMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "campaignModelMaster", "deleteCampaignModelMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyDeleteCampaignModelMasterResult.from_dict(response.body), null)


func pre_update_current_campaign_master(request: Gs2SerialKeyPreUpdateCurrentCampaignMasterRequest) -> Gs2AsyncResult:
    var body = {}
    if request.namespace_name != null:
        body["namespaceName"] = request.namespace_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("serialKey", "currentCampaignMaster", "preUpdateCurrentCampaignMaster", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyPreUpdateCurrentCampaignMasterResult.from_dict(response.body), null)