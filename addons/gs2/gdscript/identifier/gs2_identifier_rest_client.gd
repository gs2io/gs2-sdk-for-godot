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
class_name Gs2IdentifierRestClient
extends Gs2AbstractRestClient


func describe_users(request: Gs2IdentifierDescribeUsersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user"
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
    return Gs2AsyncResult.new(Gs2IdentifierDescribeUsersResult.from_dict(response.body), null)


func create_user(request: Gs2IdentifierCreateUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierCreateUserResult.from_dict(response.body), null)


func update_user(request: Gs2IdentifierUpdateUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierUpdateUserResult.from_dict(response.body), null)


func get_user(request: Gs2IdentifierGetUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierGetUserResult.from_dict(response.body), null)


func delete_user(request: Gs2IdentifierDeleteUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeleteUserResult.from_dict(response.body), null)


func describe_security_policies(request: Gs2IdentifierDescribeSecurityPoliciesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/securityPolicy"
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
    return Gs2AsyncResult.new(Gs2IdentifierDescribeSecurityPoliciesResult.from_dict(response.body), null)


func describe_common_security_policies(request: Gs2IdentifierDescribeCommonSecurityPoliciesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/securityPolicy/common"
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
    return Gs2AsyncResult.new(Gs2IdentifierDescribeCommonSecurityPoliciesResult.from_dict(response.body), null)


func create_security_policy(request: Gs2IdentifierCreateSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/securityPolicy"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.policy != null:
        body["policy"] = request.policy
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierCreateSecurityPolicyResult.from_dict(response.body), null)


func update_security_policy(request: Gs2IdentifierUpdateSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/securityPolicy/{securityPolicyName}"
    url = url.replace("{securityPolicyName}", "null" if (request.security_policy_name == null or str(request.security_policy_name) == "") else str(request.security_policy_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.policy != null:
        body["policy"] = request.policy
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierUpdateSecurityPolicyResult.from_dict(response.body), null)


func get_security_policy(request: Gs2IdentifierGetSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/securityPolicy/{securityPolicyName}"
    url = url.replace("{securityPolicyName}", "null" if (request.security_policy_name == null or str(request.security_policy_name) == "") else str(request.security_policy_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierGetSecurityPolicyResult.from_dict(response.body), null)


func delete_security_policy(request: Gs2IdentifierDeleteSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/securityPolicy/{securityPolicyName}"
    url = url.replace("{securityPolicyName}", "null" if (request.security_policy_name == null or str(request.security_policy_name) == "") else str(request.security_policy_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeleteSecurityPolicyResult.from_dict(response.body), null)


func describe_identifiers(request: Gs2IdentifierDescribeIdentifiersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierDescribeIdentifiersResult.from_dict(response.body), null)


func create_identifier(request: Gs2IdentifierCreateIdentifierRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierCreateIdentifierResult.from_dict(response.body), null)


func get_identifier(request: Gs2IdentifierGetIdentifierRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier/{clientId}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    url = url.replace("{clientId}", "null" if (request.client_id == null or str(request.client_id) == "") else str(request.client_id))
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
    return Gs2AsyncResult.new(Gs2IdentifierGetIdentifierResult.from_dict(response.body), null)


func delete_identifier(request: Gs2IdentifierDeleteIdentifierRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier/{clientId}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    url = url.replace("{clientId}", "null" if (request.client_id == null or str(request.client_id) == "") else str(request.client_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeleteIdentifierResult.from_dict(response.body), null)


func describe_attached_guards(request: Gs2IdentifierDescribeAttachedGuardsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier/{clientId}/guard"
    url = url.replace("{clientId}", "null" if (request.client_id == null or str(request.client_id) == "") else str(request.client_id))
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierDescribeAttachedGuardsResult.from_dict(response.body), null)


func attach_guard(request: Gs2IdentifierAttachGuardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier/{clientId}/guard"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    url = url.replace("{clientId}", "null" if (request.client_id == null or str(request.client_id) == "") else str(request.client_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.guard_namespace_id != null:
        body["guardNamespaceId"] = request.guard_namespace_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierAttachGuardResult.from_dict(response.body), null)


func detach_guard(request: Gs2IdentifierDetachGuardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/identifier/{clientId}/guard/{guardNamespaceId}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    url = url.replace("{clientId}", "null" if (request.client_id == null or str(request.client_id) == "") else str(request.client_id))
    url = url.replace("{guardNamespaceId}", "null" if (request.guard_namespace_id == null or str(request.guard_namespace_id) == "") else str(request.guard_namespace_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDetachGuardResult.from_dict(response.body), null)


func get_service_version(request: Gs2IdentifierGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2IdentifierGetServiceVersionResult.from_dict(response.body), null)


func create_password(request: Gs2IdentifierCreatePasswordRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/password"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.password != null:
        body["password"] = request.password
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierCreatePasswordResult.from_dict(response.body), null)


func get_password(request: Gs2IdentifierGetPasswordRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/password/entity"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierGetPasswordResult.from_dict(response.body), null)


func enable_mfa(request: Gs2IdentifierEnableMfaRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/mfa"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierEnableMfaResult.from_dict(response.body), null)


func challenge_mfa(request: Gs2IdentifierChallengeMfaRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/mfa/challenge"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.passcode != null:
        body["passcode"] = request.passcode
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierChallengeMfaResult.from_dict(response.body), null)


func disable_mfa(request: Gs2IdentifierDisableMfaRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/mfa"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDisableMfaResult.from_dict(response.body), null)


func delete_password(request: Gs2IdentifierDeletePasswordRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/password/entity"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDeletePasswordResult.from_dict(response.body), null)


func get_has_security_policy(request: Gs2IdentifierGetHasSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/securityPolicy"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
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
    return Gs2AsyncResult.new(Gs2IdentifierGetHasSecurityPolicyResult.from_dict(response.body), null)


func attach_security_policy(request: Gs2IdentifierAttachSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/securityPolicy"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.security_policy_id != null:
        body["securityPolicyId"] = request.security_policy_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierAttachSecurityPolicyResult.from_dict(response.body), null)


func detach_security_policy(request: Gs2IdentifierDetachSecurityPolicyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/user/{userName}/securityPolicy/{securityPolicyId}"
    url = url.replace("{userName}", "null" if (request.user_name == null or str(request.user_name) == "") else str(request.user_name))
    url = url.replace("{securityPolicyId}", "null" if (request.security_policy_id == null or str(request.security_policy_id) == "") else str(request.security_policy_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierDetachSecurityPolicyResult.from_dict(response.body), null)


func login(request: Gs2IdentifierLoginRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/projectToken/login"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.client_id != null:
        body["clientId"] = request.client_id
    if request.client_secret != null:
        body["clientSecret"] = request.client_secret
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2IdentifierLoginResult.from_dict(response.body), null)


func login_by_user(request: Gs2IdentifierLoginByUserRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "identifier").replace("{region}", session.region) + "/projectToken/login/user"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_name != null:
        body["userName"] = request.user_name
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
    return Gs2AsyncResult.new(Gs2IdentifierLoginByUserResult.from_dict(response.body), null)