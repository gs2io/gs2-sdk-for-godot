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
class_name Gs2ProjectRestClient
extends Gs2AbstractRestClient


func create_account(request: Gs2ProjectCreateAccountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCreateAccountResult.from_dict(response.body), null)


func verify(request: Gs2ProjectVerifyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/verify"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.verify_token != null:
        body["verifyToken"] = request.verify_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectVerifyResult.from_dict(response.body), null)


func sign_in(request: Gs2ProjectSignInRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/signIn"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.email != null:
        body["email"] = request.email
    if request.password != null:
        body["password"] = request.password
    if request.otp != null:
        body["otp"] = request.otp
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectSignInResult.from_dict(response.body), null)


func forget(request: Gs2ProjectForgetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/forget"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.email != null:
        body["email"] = request.email
    if request.lang != null:
        body["lang"] = request.lang
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectForgetResult.from_dict(response.body), null)


func issue_password(request: Gs2ProjectIssuePasswordRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/password/issue"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.issue_password_token != null:
        body["issuePasswordToken"] = request.issue_password_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectIssuePasswordResult.from_dict(response.body), null)


func update_account(request: Gs2ProjectUpdateAccountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectUpdateAccountResult.from_dict(response.body), null)


func enable_mfa(request: Gs2ProjectEnableMfaRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/mfa"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectEnableMfaResult.from_dict(response.body), null)


func challenge_mfa(request: Gs2ProjectChallengeMfaRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/mfa/challenge"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.passcode != null:
        body["passcode"] = request.passcode
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectChallengeMfaResult.from_dict(response.body), null)


func disable_mfa(request: Gs2ProjectDisableMfaRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/mfa"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDisableMfaResult.from_dict(response.body), null)


func delete_account(request: Gs2ProjectDeleteAccountRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDeleteAccountResult.from_dict(response.body), null)


func get_service_version(request: Gs2ProjectGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/system/version"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetServiceVersionResult.from_dict(response.body), null)


func describe_projects(request: Gs2ProjectDescribeProjectsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeProjectsResult.from_dict(response.body), null)


func create_project(request: Gs2ProjectCreateProjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCreateProjectResult.from_dict(response.body), null)


func get_project(request: Gs2ProjectGetProjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/{projectName}"
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetProjectResult.from_dict(response.body), null)


func get_project_token(request: Gs2ProjectGetProjectTokenRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/project/{projectName}/projectToken"
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetProjectTokenResult.from_dict(response.body), null)


func get_project_token_by_identifier(request: Gs2ProjectGetProjectTokenByIdentifierRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/{accountName}/project/{projectName}/user/{userName}/projectToken"
    url = url.replace("{accountName}", "null" if (request.account_name == null or str(request.account_name) == "") else str(request.account_name))
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.password != null:
        body["password"] = request.password
    if request.otp != null:
        body["otp"] = request.otp
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetProjectTokenByIdentifierResult.from_dict(response.body), null)


func update_project(request: Gs2ProjectUpdateProjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/{projectName}"
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.account_token != null:
        body["accountToken"] = request.account_token
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectUpdateProjectResult.from_dict(response.body), null)


func activate_region(request: Gs2ProjectActivateRegionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/{projectName}/region/{regionName}/activate"
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    url = url.replace("{regionName}", "null" if (request.region_name == null or str(request.region_name) == "") else str(request.region_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectActivateRegionResult.from_dict(response.body), null)


func wait_activate_region(request: Gs2ProjectWaitActivateRegionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/system/{ownerId}/project/region/{regionName}/activate/wait"
    url = url.replace("{ownerId}", "null" if (request.owner_id == null or str(request.owner_id) == "") else str(request.owner_id))
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    url = url.replace("{regionName}", "null" if (request.region_name == null or str(request.region_name) == "") else str(request.region_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitActivateRegionResult.from_dict(response.body), null)


func delete_project(request: Gs2ProjectDeleteProjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/{projectName}"
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDeleteProjectResult.from_dict(response.body), null)


func describe_billing_methods(request: Gs2ProjectDescribeBillingMethodsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/billingMethod"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeBillingMethodsResult.from_dict(response.body), null)


func create_billing_method(request: Gs2ProjectCreateBillingMethodRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/billingMethod"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCreateBillingMethodResult.from_dict(response.body), null)


func get_billing_method(request: Gs2ProjectGetBillingMethodRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/billingMethod/{billingMethodName}"
    url = url.replace("{billingMethodName}", "null" if (request.billing_method_name == null or str(request.billing_method_name) == "") else str(request.billing_method_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetBillingMethodResult.from_dict(response.body), null)


func update_billing_method(request: Gs2ProjectUpdateBillingMethodRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/billingMethod/{billingMethodName}"
    url = url.replace("{billingMethodName}", "null" if (request.billing_method_name == null or str(request.billing_method_name) == "") else str(request.billing_method_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.account_token != null:
        body["accountToken"] = request.account_token
    if request.description != null:
        body["description"] = request.description
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectUpdateBillingMethodResult.from_dict(response.body), null)


func delete_billing_method(request: Gs2ProjectDeleteBillingMethodRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/billingMethod/{billingMethodName}"
    url = url.replace("{billingMethodName}", "null" if (request.billing_method_name == null or str(request.billing_method_name) == "") else str(request.billing_method_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDeleteBillingMethodResult.from_dict(response.body), null)


func describe_receipts(request: Gs2ProjectDescribeReceiptsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/receipt"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeReceiptsResult.from_dict(response.body), null)


func describe_billings(request: Gs2ProjectDescribeBillingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/billing/{projectName}/{year}/{month}"
    url = url.replace("{projectName}", "null" if (request.project_name == null or str(request.project_name) == "") else str(request.project_name))
    url = url.replace("{year}", "null" if (request.year == null or str(request.year) == "") else str(request.year))
    url = url.replace("{month}", "null" if (request.month == null or str(request.month) == "") else str(request.month))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.account_token != null:
        query_strings["accountToken"] = request.account_token
    if request.region != null:
        query_strings["region"] = request.region
    if request.service != null:
        query_strings["service"] = request.service
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeBillingsResult.from_dict(response.body), null)


func describe_dump_progresses(request: Gs2ProjectDescribeDumpProgressesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/dump/progress"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeDumpProgressesResult.from_dict(response.body), null)


func get_dump_progress(request: Gs2ProjectGetDumpProgressRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/dump/progress/{transactionId}"
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetDumpProgressResult.from_dict(response.body), null)


func wait_dump_user_data(request: Gs2ProjectWaitDumpUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/system/{ownerId}/project/dump/progress/{transactionId}/wait"
    url = url.replace("{ownerId}", "null" if (request.owner_id == null or str(request.owner_id) == "") else str(request.owner_id))
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitDumpUserDataResult.from_dict(response.body), null)


func archive_dump_user_data(request: Gs2ProjectArchiveDumpUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/system/{ownerId}/project/dump/progress/{transactionId}/archive"
    url = url.replace("{ownerId}", "null" if (request.owner_id == null or str(request.owner_id) == "") else str(request.owner_id))
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectArchiveDumpUserDataResult.from_dict(response.body), null)


func dump_user_data(request: Gs2ProjectDumpUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/dump/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDumpUserDataResult.from_dict(response.body), null)


func get_dump_user_data(request: Gs2ProjectGetDumpUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/dump/{transactionId}"
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetDumpUserDataResult.from_dict(response.body), null)


func describe_clean_progresses(request: Gs2ProjectDescribeCleanProgressesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/clean/progress"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeCleanProgressesResult.from_dict(response.body), null)


func get_clean_progress(request: Gs2ProjectGetCleanProgressRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/clean/progress/{transactionId}"
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetCleanProgressResult.from_dict(response.body), null)


func wait_clean_user_data(request: Gs2ProjectWaitCleanUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/system/{ownerId}/project/clean/progress/{transactionId}/wait"
    url = url.replace("{ownerId}", "null" if (request.owner_id == null or str(request.owner_id) == "") else str(request.owner_id))
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitCleanUserDataResult.from_dict(response.body), null)


func clean_user_data(request: Gs2ProjectCleanUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/clean/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectCleanUserDataResult.from_dict(response.body), null)


func describe_import_progresses(request: Gs2ProjectDescribeImportProgressesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/import/progress"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeImportProgressesResult.from_dict(response.body), null)


func get_import_progress(request: Gs2ProjectGetImportProgressRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/import/progress/{transactionId}"
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetImportProgressResult.from_dict(response.body), null)


func wait_import_user_data(request: Gs2ProjectWaitImportUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/system/{ownerId}/project/import/progress/{transactionId}/wait"
    url = url.replace("{ownerId}", "null" if (request.owner_id == null or str(request.owner_id) == "") else str(request.owner_id))
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectWaitImportUserDataResult.from_dict(response.body), null)


func prepare_import_user_data(request: Gs2ProjectPrepareImportUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/import/{userId}/prepare"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectPrepareImportUserDataResult.from_dict(response.body), null)


func import_user_data(request: Gs2ProjectImportUserDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/import/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectImportUserDataResult.from_dict(response.body), null)


func describe_import_error_logs(request: Gs2ProjectDescribeImportErrorLogsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/import/progress/{transactionId}/log"
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectDescribeImportErrorLogsResult.from_dict(response.body), null)


func get_import_error_log(request: Gs2ProjectGetImportErrorLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "project").replace("{region}", session.region) + "/account/me/project/import/progress/{transactionId}/log/{errorLogName}"
    url = url.replace("{transactionId}", "null" if (request.transaction_id == null or str(request.transaction_id) == "") else str(request.transaction_id))
    url = url.replace("{errorLogName}", "null" if (request.error_log_name == null or str(request.error_log_name) == "") else str(request.error_log_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2ProjectGetImportErrorLogResult.from_dict(response.body), null)