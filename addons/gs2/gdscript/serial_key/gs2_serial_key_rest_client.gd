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
class_name Gs2SerialKeyRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2SerialKeyDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.name_prefix != null:
        query_strings["namePrefix"] = request.name_prefix
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
    return Gs2AsyncResult.new(Gs2SerialKeyDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2SerialKeyCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2SerialKeyGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/status"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2SerialKeyGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2SerialKeyUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2SerialKeyDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2SerialKeyGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2SerialKeyDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/dump/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2SerialKeyCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/dump/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2SerialKeyCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/clean/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2SerialKeyCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/clean/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2SerialKeyPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2SerialKeyImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/import/user/{userId}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2SerialKeyCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{uploadToken}", "null" if (request.upload_token == null or str(request.upload_token) == "") else str(request.upload_token))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_issue_jobs(request: Gs2SerialKeyDescribeIssueJobsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}/issue"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyDescribeIssueJobsResult.from_dict(response.body), null)


func get_issue_job(request: Gs2SerialKeyGetIssueJobRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}/issue/{issueJobName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
    url = url.replace("{issueJobName}", "null" if (request.issue_job_name == null or str(request.issue_job_name) == "") else str(request.issue_job_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetIssueJobResult.from_dict(response.body), null)


func issue(request: Gs2SerialKeyIssueRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.issue_request_count != null:
        body["issueRequestCount"] = request.issue_request_count
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyIssueResult.from_dict(response.body), null)


func describe_serial_keys(request: Gs2SerialKeyDescribeSerialKeysRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}/issue/{issueJobName}/serialKey"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
    url = url.replace("{issueJobName}", "null" if (request.issue_job_name == null or str(request.issue_job_name) == "") else str(request.issue_job_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyDescribeSerialKeysResult.from_dict(response.body), null)


func download_serial_codes(request: Gs2SerialKeyDownloadSerialCodesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}/issue/{issueJobName}/serialCode/download"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
    url = url.replace("{issueJobName}", "null" if (request.issue_job_name == null or str(request.issue_job_name) == "") else str(request.issue_job_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyDownloadSerialCodesResult.from_dict(response.body), null)


func issue_once(request: Gs2SerialKeyIssueOnceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}/serialKey"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyIssueOnceResult.from_dict(response.body), null)


func get_serial_key(request: Gs2SerialKeyGetSerialKeyRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/serialKey/{code}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{code}", "null" if (request.code == null or str(request.code) == "") else str(request.code))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetSerialKeyResult.from_dict(response.body), null)


func verify_code(request: Gs2SerialKeyVerifyCodeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/user/me/serialKey/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.code != null:
        body["code"] = request.code
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyVerifyCodeResult.from_dict(response.body), null)


func verify_code_by_user_id(request: Gs2SerialKeyVerifyCodeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/serialKey/verify"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.code != null:
        body["code"] = request.code
    if request.campaign_model_name != null:
        body["campaignModelName"] = request.campaign_model_name
    if request.verify_type != null:
        body["verifyType"] = request.verify_type
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
    return Gs2AsyncResult.new(Gs2SerialKeyVerifyCodeByUserIdResult.from_dict(response.body), null)


func use(request: Gs2SerialKeyUseRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/user/me/serialKey"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.code != null:
        body["code"] = request.code
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        if response.error.has_error_code("code.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2SerialKeyAlreadyUsedException.new(response.error))
        if response.error.has_error_code("code.code.notFound"):
            return Gs2AsyncResult.new(null, Gs2SerialKeyCodeNotFoundException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUseResult.from_dict(response.body), null)


func use_by_user_id(request: Gs2SerialKeyUseByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/serialKey"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.code != null:
        body["code"] = request.code
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
    return Gs2AsyncResult.new(Gs2SerialKeyUseByUserIdResult.from_dict(response.body), null)


func revert_use_by_user_id(request: Gs2SerialKeyRevertUseByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/serialKey/revert"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.code != null:
        body["code"] = request.code
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
    return Gs2AsyncResult.new(Gs2SerialKeyRevertUseByUserIdResult.from_dict(response.body), null)


func use_by_stamp_task(request: Gs2SerialKeyUseByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/serialKey/use"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_task != null:
        body["stampTask"] = request.stamp_task
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUseByStampTaskResult.from_dict(response.body), null)


func revert_use_by_stamp_sheet(request: Gs2SerialKeyRevertUseByStampSheetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/serialKey/revert"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyRevertUseByStampSheetResult.from_dict(response.body), null)


func verify_by_stamp_task(request: Gs2SerialKeyVerifyByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/serialKey/verify"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_task != null:
        body["stampTask"] = request.stamp_task
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyVerifyByStampTaskResult.from_dict(response.body), null)


func issue_once_by_stamp_sheet(request: Gs2SerialKeyIssueOnceByStampSheetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/serialKey/issueOnce"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.stamp_sheet != null:
        body["stampSheet"] = request.stamp_sheet
    if request.key_id != null:
        body["keyId"] = request.key_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyIssueOnceByStampSheetResult.from_dict(response.body), null)


func describe_campaign_models(request: Gs2SerialKeyDescribeCampaignModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyDescribeCampaignModelsResult.from_dict(response.body), null)


func get_campaign_model(request: Gs2SerialKeyGetCampaignModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/campaign/{campaignModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetCampaignModelResult.from_dict(response.body), null)


func describe_campaign_model_masters(request: Gs2SerialKeyDescribeCampaignModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/campaign"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.name_prefix != null:
        query_strings["namePrefix"] = request.name_prefix
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
    return Gs2AsyncResult.new(Gs2SerialKeyDescribeCampaignModelMastersResult.from_dict(response.body), null)


func create_campaign_model_master(request: Gs2SerialKeyCreateCampaignModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/campaign"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.enable_campaign_code != null:
        body["enableCampaignCode"] = request.enable_campaign_code
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyCreateCampaignModelMasterResult.from_dict(response.body), null)


func get_campaign_model_master(request: Gs2SerialKeyGetCampaignModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/campaign/{campaignModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetCampaignModelMasterResult.from_dict(response.body), null)


func update_campaign_model_master(request: Gs2SerialKeyUpdateCampaignModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/campaign/{campaignModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.enable_campaign_code != null:
        body["enableCampaignCode"] = request.enable_campaign_code
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUpdateCampaignModelMasterResult.from_dict(response.body), null)


func delete_campaign_model_master(request: Gs2SerialKeyDeleteCampaignModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/campaign/{campaignModelName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{campaignModelName}", "null" if (request.campaign_model_name == null or str(request.campaign_model_name) == "") else str(request.campaign_model_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyDeleteCampaignModelMasterResult.from_dict(response.body), null)


func export_master(request: Gs2SerialKeyExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/export"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyExportMasterResult.from_dict(response.body), null)


func get_current_campaign_master(request: Gs2SerialKeyGetCurrentCampaignMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyGetCurrentCampaignMasterResult.from_dict(response.body), null)


func pre_update_current_campaign_master(request: Gs2SerialKeyPreUpdateCurrentCampaignMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2SerialKeyPreUpdateCurrentCampaignMasterResult.from_dict(response.body), null)


func update_current_campaign_master(request: Gs2SerialKeyUpdateCurrentCampaignMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2SerialKeyPreUpdateCurrentCampaignMasterRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.namespace_name = request.namespace_name
        var pre_async_result = await pre_update_current_campaign_master(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.settings)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.settings = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.mode != null:
        body["mode"] = request.mode
    if request.settings != null:
        body["settings"] = request.settings
    if request.upload_token != null:
        body["uploadToken"] = request.upload_token
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUpdateCurrentCampaignMasterResult.from_dict(response.body), null)


func update_current_campaign_master_from_git_hub(request: Gs2SerialKeyUpdateCurrentCampaignMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "serial-key").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.checkout_setting != null:
        body["checkoutSetting"] = request.checkout_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2SerialKeyUpdateCurrentCampaignMasterFromGitHubResult.from_dict(response.body), null)