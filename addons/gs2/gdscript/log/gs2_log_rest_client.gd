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
class_name Gs2LogRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2LogDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2LogDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2LogCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/"
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.description != null:
        body["description"] = request.description
    if request.type != null:
        body["type"] = request.type
    if request.gcp_credential_json != null:
        body["gcpCredentialJson"] = request.gcp_credential_json
    if request.big_query_dataset_name != null:
        body["bigQueryDatasetName"] = request.big_query_dataset_name
    if request.log_expire_days != null:
        body["logExpireDays"] = request.log_expire_days
    if request.aws_region != null:
        body["awsRegion"] = request.aws_region
    if request.aws_access_key_id != null:
        body["awsAccessKeyId"] = request.aws_access_key_id
    if request.aws_secret_access_key != null:
        body["awsSecretAccessKey"] = request.aws_secret_access_key
    if request.firehose_stream_name != null:
        body["firehoseStreamName"] = request.firehose_stream_name
    if request.firehose_compress_data != null:
        body["firehoseCompressData"] = request.firehose_compress_data
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2LogGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2LogGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2LogGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2LogGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2LogUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.type != null:
        body["type"] = request.type
    if request.gcp_credential_json != null:
        body["gcpCredentialJson"] = request.gcp_credential_json
    if request.big_query_dataset_name != null:
        body["bigQueryDatasetName"] = request.big_query_dataset_name
    if request.log_expire_days != null:
        body["logExpireDays"] = request.log_expire_days
    if request.aws_region != null:
        body["awsRegion"] = request.aws_region
    if request.aws_access_key_id != null:
        body["awsAccessKeyId"] = request.aws_access_key_id
    if request.aws_secret_access_key != null:
        body["awsSecretAccessKey"] = request.aws_secret_access_key
    if request.firehose_stream_name != null:
        body["firehoseStreamName"] = request.firehose_stream_name
    if request.firehose_compress_data != null:
        body["firehoseCompressData"] = request.firehose_compress_data
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2LogDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2LogDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2LogGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2LogGetServiceVersionResult.from_dict(response.body), null)


func query_access_log(request: Gs2LogQueryAccessLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/access"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryAccessLogResult.from_dict(response.body), null)


func count_access_log(request: Gs2LogCountAccessLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/access/count"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCountAccessLogResult.from_dict(response.body), null)


func query_issue_stamp_sheet_log(request: Gs2LogQueryIssueStampSheetLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/issue/stamp/sheet"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.action != null:
        query_strings["action"] = request.action
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryIssueStampSheetLogResult.from_dict(response.body), null)


func count_issue_stamp_sheet_log(request: Gs2LogCountIssueStampSheetLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/issue/stamp/sheet/count"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.action != null:
        query_strings["action"] = request.action
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCountIssueStampSheetLogResult.from_dict(response.body), null)


func query_execute_stamp_sheet_log(request: Gs2LogQueryExecuteStampSheetLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/execute/stamp/sheet"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.action != null:
        query_strings["action"] = request.action
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryExecuteStampSheetLogResult.from_dict(response.body), null)


func count_execute_stamp_sheet_log(request: Gs2LogCountExecuteStampSheetLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/execute/stamp/sheet/count"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.action != null:
        query_strings["action"] = request.action
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCountExecuteStampSheetLogResult.from_dict(response.body), null)


func query_execute_stamp_task_log(request: Gs2LogQueryExecuteStampTaskLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/execute/stamp/task"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.action != null:
        query_strings["action"] = request.action
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryExecuteStampTaskLogResult.from_dict(response.body), null)


func count_execute_stamp_task_log(request: Gs2LogCountExecuteStampTaskLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/execute/stamp/task/count"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.service != null:
        query_strings["service"] = request.service
    if request.method != null:
        query_strings["method"] = request.method
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.action != null:
        query_strings["action"] = request.action
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCountExecuteStampTaskLogResult.from_dict(response.body), null)


func query_in_game_log(request: Gs2LogQueryInGameLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/ingame/log"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.user_id != null:
        body["userId"] = request.user_id
    if request.tags != null:
        body["tags"] = request.tags.map(func(v): return null if v == null else v.to_dict())
    if request.begin != null:
        body["begin"] = request.begin
    if request.end != null:
        body["end"] = request.end
    if request.long_term != null:
        body["longTerm"] = request.long_term
    if request.page_token != null:
        body["pageToken"] = request.page_token
    if request.limit != null:
        body["limit"] = request.limit
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
    return Gs2AsyncResult.new(Gs2LogQueryInGameLogResult.from_dict(response.body), null)


func send_in_game_log(request: Gs2LogSendInGameLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/ingame/log/user/me/send"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.tags != null:
        body["tags"] = request.tags.map(func(v): return null if v == null else v.to_dict())
    if request.payload != null:
        body["payload"] = request.payload
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
    return Gs2AsyncResult.new(Gs2LogSendInGameLogResult.from_dict(response.body), null)


func send_in_game_log_by_user_id(request: Gs2LogSendInGameLogByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/ingame/log/user/{userId}/send"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.tags != null:
        body["tags"] = request.tags.map(func(v): return null if v == null else v.to_dict())
    if request.payload != null:
        body["payload"] = request.payload
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
    return Gs2AsyncResult.new(Gs2LogSendInGameLogByUserIdResult.from_dict(response.body), null)


func query_access_log_with_telemetry(request: Gs2LogQueryAccessLogWithTelemetryRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/access/telemetry"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.user_id != null:
        query_strings["userId"] = request.user_id
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.long_term != null:
        query_strings["longTerm"] = request.long_term
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryAccessLogWithTelemetryResult.from_dict(response.body), null)


func describe_insights(request: Gs2LogDescribeInsightsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/insight"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
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
    return Gs2AsyncResult.new(Gs2LogDescribeInsightsResult.from_dict(response.body), null)


func create_insight(request: Gs2LogCreateInsightRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/insight"
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
    return Gs2AsyncResult.new(Gs2LogCreateInsightResult.from_dict(response.body), null)


func get_insight(request: Gs2LogGetInsightRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/insight/{insightName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{insightName}", "null" if (request.insight_name == null or str(request.insight_name) == "") else str(request.insight_name))
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
    return Gs2AsyncResult.new(Gs2LogGetInsightResult.from_dict(response.body), null)


func delete_insight(request: Gs2LogDeleteInsightRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/insight/{insightName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{insightName}", "null" if (request.insight_name == null or str(request.insight_name) == "") else str(request.insight_name))
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
    return Gs2AsyncResult.new(Gs2LogDeleteInsightResult.from_dict(response.body), null)


func describe_facet_models(request: Gs2LogDescribeFacetModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/facet"
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
    return Gs2AsyncResult.new(Gs2LogDescribeFacetModelsResult.from_dict(response.body), null)


func create_facet_model(request: Gs2LogCreateFacetModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/facet"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.field != null:
        body["field"] = request.field
    if request.type != null:
        body["type"] = request.type
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.order != null:
        body["order"] = request.order
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCreateFacetModelResult.from_dict(response.body), null)


func get_facet_model(request: Gs2LogGetFacetModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/facet/{field}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{field}", "null" if (request.field == null or str(request.field) == "") else str(request.field))
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
    return Gs2AsyncResult.new(Gs2LogGetFacetModelResult.from_dict(response.body), null)


func update_facet_model(request: Gs2LogUpdateFacetModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/facet/{field}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{field}", "null" if (request.field == null or str(request.field) == "") else str(request.field))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.type != null:
        body["type"] = request.type
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.order != null:
        body["order"] = request.order
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogUpdateFacetModelResult.from_dict(response.body), null)


func delete_facet_model(request: Gs2LogDeleteFacetModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/facet/{field}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{field}", "null" if (request.field == null or str(request.field) == "") else str(request.field))
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
    return Gs2AsyncResult.new(Gs2LogDeleteFacetModelResult.from_dict(response.body), null)


func describe_dashboards(request: Gs2LogDescribeDashboardsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/dashboard"
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
    return Gs2AsyncResult.new(Gs2LogDescribeDashboardsResult.from_dict(response.body), null)


func create_dashboard(request: Gs2LogCreateDashboardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/dashboard"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.description != null:
        body["description"] = request.description
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogCreateDashboardResult.from_dict(response.body), null)


func get_dashboard(request: Gs2LogGetDashboardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/dashboard/{dashboardName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dashboardName}", "null" if (request.dashboard_name == null or str(request.dashboard_name) == "") else str(request.dashboard_name))
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
    return Gs2AsyncResult.new(Gs2LogGetDashboardResult.from_dict(response.body), null)


func update_dashboard(request: Gs2LogUpdateDashboardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/dashboard/{dashboardName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dashboardName}", "null" if (request.dashboard_name == null or str(request.dashboard_name) == "") else str(request.dashboard_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.display_name != null:
        body["displayName"] = request.display_name
    if request.description != null:
        body["description"] = request.description
    if request.payload != null:
        body["payload"] = request.payload
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogUpdateDashboardResult.from_dict(response.body), null)


func duplicate_dashboard(request: Gs2LogDuplicateDashboardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/dashboard/{dashboardName}/copy"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dashboardName}", "null" if (request.dashboard_name == null or str(request.dashboard_name) == "") else str(request.dashboard_name))
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
    return Gs2AsyncResult.new(Gs2LogDuplicateDashboardResult.from_dict(response.body), null)


func delete_dashboard(request: Gs2LogDeleteDashboardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/dashboard/{dashboardName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dashboardName}", "null" if (request.dashboard_name == null or str(request.dashboard_name) == "") else str(request.dashboard_name))
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
    return Gs2AsyncResult.new(Gs2LogDeleteDashboardResult.from_dict(response.body), null)


func query_log(request: Gs2LogQueryLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/v2/query"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.begin != null:
        body["begin"] = request.begin
    if request.end != null:
        body["end"] = request.end
    if request.query != null:
        body["query"] = request.query
    if request.page_token != null:
        body["pageToken"] = request.page_token
    if request.limit != null:
        body["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryLogResult.from_dict(response.body), null)


func get_log(request: Gs2LogGetLogRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/v2/query/{logRequestId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{logRequestId}", "null" if (request.log_request_id == null or str(request.log_request_id) == "") else str(request.log_request_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetLogResult.from_dict(response.body), null)


func query_facets(request: Gs2LogQueryFacetsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/v2/query/facet"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.begin != null:
        body["begin"] = request.begin
    if request.end != null:
        body["end"] = request.end
    if request.query != null:
        body["query"] = request.query
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryFacetsResult.from_dict(response.body), null)


func query_timeseries(request: Gs2LogQueryTimeseriesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/v2/timeseries"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.begin != null:
        body["begin"] = request.begin
    if request.end != null:
        body["end"] = request.end
    if request.query != null:
        body["query"] = request.query
    if request.group_by != null:
        body["groupBy"] = request.group_by
    if request.aggregation != null:
        body["aggregation"] = request.aggregation.to_dict()
    if request.interval != null:
        body["interval"] = request.interval
    if request.series_limit != null:
        body["seriesLimit"] = request.series_limit
    if request.page_token != null:
        body["pageToken"] = request.page_token
    if request.limit != null:
        body["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryTimeseriesResult.from_dict(response.body), null)


func get_trace(request: Gs2LogGetTraceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/log/v2/trace/{traceId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{traceId}", "null" if (request.trace_id == null or str(request.trace_id) == "") else str(request.trace_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.begin != null:
        query_strings["begin"] = request.begin
    if request.end != null:
        query_strings["end"] = request.end
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogGetTraceResult.from_dict(response.body), null)


func query_metrics_timeseries(request: Gs2LogQueryMetricsTimeseriesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/metrics/timeseries"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.begin != null:
        body["begin"] = request.begin
    if request.end != null:
        body["end"] = request.end
    if request.query != null:
        body["query"] = request.query
    if request.group_by != null:
        body["groupBy"] = request.group_by
    if request.aggregations != null:
        body["aggregations"] = request.aggregations.map(func(v): return null if v == null else v.to_dict())
    if request.interval != null:
        body["interval"] = request.interval
    if request.series_limit != null:
        body["seriesLimit"] = request.series_limit
    if request.order_key != null:
        body["orderKey"] = request.order_key
    if request.order_by != null:
        body["orderBy"] = request.order_by
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LogQueryMetricsTimeseriesResult.from_dict(response.body), null)


func describe_metrics(request: Gs2LogDescribeMetricsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/metrics"
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
    return Gs2AsyncResult.new(Gs2LogDescribeMetricsResult.from_dict(response.body), null)


func describe_label_values(request: Gs2LogDescribeLabelValuesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "log").replace("{region}", session.region) + "/{namespaceName}/model/metrics/{metricName}/label"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{metricName}", "null" if (request.metric_name == null or str(request.metric_name) == "") else str(request.metric_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.label_name_prefix != null:
        query_strings["labelNamePrefix"] = request.label_name_prefix
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
    return Gs2AsyncResult.new(Gs2LogDescribeLabelValuesResult.from_dict(response.body), null)