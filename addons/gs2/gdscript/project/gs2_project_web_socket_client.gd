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
class_name Gs2ProjectWebSocketClient
extends Gs2AbstractWebSocketClient


func create_account(request: Gs2ProjectCreateAccountRequest) -> Gs2AsyncResult:
    var body = {}
    if request.email != null:
        body["email"] = request.email
    if request.full_name != null:
        body["fullName"] = request.full_name
    if request.company_name != null:
        body["companyName"] = request.company_name
    if request.password != null:
        body["password"] = request.password
    if request.lang != null:
        body["lang"] = request.lang
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "createAccount", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCreateAccountResult.from_dict(response.body), null)


func verify(request: Gs2ProjectVerifyRequest) -> Gs2AsyncResult:
    var body = {}
    if request.verify_token != null:
        body["verifyToken"] = request.verify_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "verify", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectVerifyResult.from_dict(response.body), null)


func sign_in(request: Gs2ProjectSignInRequest) -> Gs2AsyncResult:
    var body = {}
    if request.email != null:
        body["email"] = request.email
    if request.password != null:
        body["password"] = request.password
    if request.otp != null:
        body["otp"] = request.otp
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "signIn", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectSignInResult.from_dict(response.body), null)


func forget(request: Gs2ProjectForgetRequest) -> Gs2AsyncResult:
    var body = {}
    if request.email != null:
        body["email"] = request.email
    if request.lang != null:
        body["lang"] = request.lang
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "forget", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectForgetResult.from_dict(response.body), null)


func update_account(request: Gs2ProjectUpdateAccountRequest) -> Gs2AsyncResult:
    var body = {}
    if request.email != null:
        body["email"] = request.email
    if request.full_name != null:
        body["fullName"] = request.full_name
    if request.company_name != null:
        body["companyName"] = request.company_name
    if request.password != null:
        body["password"] = request.password
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "updateAccount", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectUpdateAccountResult.from_dict(response.body), null)


func enable_mfa(request: Gs2ProjectEnableMfaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "enableMfa", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectEnableMfaResult.from_dict(response.body), null)


func challenge_mfa(request: Gs2ProjectChallengeMfaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.passcode != null:
        body["passcode"] = request.passcode
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "challengeMfa", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectChallengeMfaResult.from_dict(response.body), null)


func disable_mfa(request: Gs2ProjectDisableMfaRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "disableMfa", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDisableMfaResult.from_dict(response.body), null)


func delete_account(request: Gs2ProjectDeleteAccountRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "deleteAccount", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDeleteAccountResult.from_dict(response.body), null)


func get_service_version(request: Gs2ProjectGetServiceVersionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "account", "getServiceVersion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetServiceVersionResult.from_dict(response.body), null)


func create_project(request: Gs2ProjectCreateProjectRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.plan != null:
        body["plan"] = request.plan
    if request.currency != null:
        body["currency"] = request.currency
    if request.activate_region_name != null:
        body["activateRegionName"] = request.activate_region_name
    if request.billing_method_name != null:
        body["billingMethodName"] = request.billing_method_name
    if request.enable_event_bridge != null:
        body["enableEventBridge"] = request.enable_event_bridge
    if request.event_bridge_aws_account_id != null:
        body["eventBridgeAwsAccountId"] = request.event_bridge_aws_account_id
    if request.event_bridge_aws_region != null:
        body["eventBridgeAwsRegion"] = request.event_bridge_aws_region
    if request.data_store_key_scheme != null:
        body["dataStoreKeyScheme"] = request.data_store_key_scheme
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "createProject", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCreateProjectResult.from_dict(response.body), null)


func get_project(request: Gs2ProjectGetProjectRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "getProject", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetProjectResult.from_dict(response.body), null)


func get_project_token(request: Gs2ProjectGetProjectTokenRequest) -> Gs2AsyncResult:
    var body = {}
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "getProjectToken", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetProjectTokenResult.from_dict(response.body), null)


func get_project_token_by_identifier(request: Gs2ProjectGetProjectTokenByIdentifierRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_name != null:
        body["accountName"] = request.account_name
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.user_name != null:
        body["userName"] = request.user_name
    if request.password != null:
        body["password"] = request.password
    if request.otp != null:
        body["otp"] = request.otp
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "getProjectTokenByIdentifier", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetProjectTokenByIdentifierResult.from_dict(response.body), null)


func update_project(request: Gs2ProjectUpdateProjectRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.description != null:
        body["description"] = request.description
    if request.plan != null:
        body["plan"] = request.plan
    if request.billing_method_name != null:
        body["billingMethodName"] = request.billing_method_name
    if request.enable_event_bridge != null:
        body["enableEventBridge"] = request.enable_event_bridge
    if request.event_bridge_aws_account_id != null:
        body["eventBridgeAwsAccountId"] = request.event_bridge_aws_account_id
    if request.event_bridge_aws_region != null:
        body["eventBridgeAwsRegion"] = request.event_bridge_aws_region
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "updateProject", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectUpdateProjectResult.from_dict(response.body), null)


func activate_region(request: Gs2ProjectActivateRegionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.region_name != null:
        body["regionName"] = request.region_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "activateRegion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectActivateRegionResult.from_dict(response.body), null)


func wait_activate_region(request: Gs2ProjectWaitActivateRegionRequest) -> Gs2AsyncResult:
    var body = {}
    if request.owner_id != null:
        body["ownerId"] = request.owner_id
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.region_name != null:
        body["regionName"] = request.region_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "waitActivateRegion", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitActivateRegionResult.from_dict(response.body), null)


func delete_project(request: Gs2ProjectDeleteProjectRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.project_name != null:
        body["projectName"] = request.project_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "project", "deleteProject", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDeleteProjectResult.from_dict(response.body), null)


func create_billing_method(request: Gs2ProjectCreateBillingMethodRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.description != null:
        body["description"] = request.description
    if request.method_type != null:
        body["methodType"] = request.method_type
    if request.card_customer_id != null:
        body["cardCustomerId"] = request.card_customer_id
    if request.partner_id != null:
        body["partnerId"] = request.partner_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "billingMethod", "createBillingMethod", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCreateBillingMethodResult.from_dict(response.body), null)


func get_billing_method(request: Gs2ProjectGetBillingMethodRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.billing_method_name != null:
        body["billingMethodName"] = request.billing_method_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "billingMethod", "getBillingMethod", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetBillingMethodResult.from_dict(response.body), null)


func update_billing_method(request: Gs2ProjectUpdateBillingMethodRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.billing_method_name != null:
        body["billingMethodName"] = request.billing_method_name
    if request.description != null:
        body["description"] = request.description
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "billingMethod", "updateBillingMethod", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectUpdateBillingMethodResult.from_dict(response.body), null)


func delete_billing_method(request: Gs2ProjectDeleteBillingMethodRequest) -> Gs2AsyncResult:
    var body = {}
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.billing_method_name != null:
        body["billingMethodName"] = request.billing_method_name
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "billingMethod", "deleteBillingMethod", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDeleteBillingMethodResult.from_dict(response.body), null)


func get_dump_progress(request: Gs2ProjectGetDumpProgressRequest) -> Gs2AsyncResult:
    var body = {}
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "dumpProgress", "getDumpProgress", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetDumpProgressResult.from_dict(response.body), null)


func wait_dump_user_data(request: Gs2ProjectWaitDumpUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.owner_id != null:
        body["ownerId"] = request.owner_id
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
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
    var response = await session.send("project", "dumpProgress", "waitDumpUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitDumpUserDataResult.from_dict(response.body), null)


func archive_dump_user_data(request: Gs2ProjectArchiveDumpUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.owner_id != null:
        body["ownerId"] = request.owner_id
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "dumpProgress", "archiveDumpUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectArchiveDumpUserDataResult.from_dict(response.body), null)


func dump_user_data(request: Gs2ProjectDumpUserDataRequest) -> Gs2AsyncResult:
    var body = {}
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
    var response = await session.send("project", "dumpProgress", "dumpUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDumpUserDataResult.from_dict(response.body), null)


func get_dump_user_data(request: Gs2ProjectGetDumpUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "dumpProgress", "getDumpUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetDumpUserDataResult.from_dict(response.body), null)


func get_clean_progress(request: Gs2ProjectGetCleanProgressRequest) -> Gs2AsyncResult:
    var body = {}
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "cleanProgress", "getCleanProgress", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetCleanProgressResult.from_dict(response.body), null)


func wait_clean_user_data(request: Gs2ProjectWaitCleanUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.owner_id != null:
        body["ownerId"] = request.owner_id
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.exclude_microservices != null:
        body["excludeMicroservices"] = request.exclude_microservices
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "cleanProgress", "waitCleanUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitCleanUserDataResult.from_dict(response.body), null)


func clean_user_data(request: Gs2ProjectCleanUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.exclude_microservices != null:
        body["excludeMicroservices"] = request.exclude_microservices
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "cleanProgress", "cleanUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCleanUserDataResult.from_dict(response.body), null)


func get_import_progress(request: Gs2ProjectGetImportProgressRequest) -> Gs2AsyncResult:
    var body = {}
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "importProgress", "getImportProgress", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetImportProgressResult.from_dict(response.body), null)


func wait_import_user_data(request: Gs2ProjectWaitImportUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.owner_id != null:
        body["ownerId"] = request.owner_id
    if request.transaction_id != null:
        body["transactionId"] = request.transaction_id
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
    var response = await session.send("project", "importProgress", "waitImportUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitImportUserDataResult.from_dict(response.body), null)


func prepare_import_user_data(request: Gs2ProjectPrepareImportUserDataRequest) -> Gs2AsyncResult:
    var body = {}
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
    var response = await session.send("project", "importProgress", "prepareImportUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectPrepareImportUserDataResult.from_dict(response.body), null)


func import_user_data(request: Gs2ProjectImportUserDataRequest) -> Gs2AsyncResult:
    var body = {}
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.time_offset_token != null:
        body["timeOffsetToken"] = request.time_offset_token
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.duplication_avoider != null:
        body["xGs2DuplicationAvoider"] = request.duplication_avoider
    if request.dry_run:
        body["xGs2DryRun"] = "true"
    var response = await session.send("project", "importProgress", "importUserData", body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectImportUserDataResult.from_dict(response.body), null)