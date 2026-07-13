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
class_name Gs2LimitRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2LimitDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2LimitDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2LimitCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/"
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
    if request.count_up_script != null:
        body["countUpScript"] = request.count_up_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2LimitGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2LimitGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2LimitGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2LimitGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2LimitUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.transaction_setting != null:
        body["transactionSetting"] = request.transaction_setting.to_dict()
    if request.count_up_script != null:
        body["countUpScript"] = request.count_up_script.to_dict()
    if request.log_setting != null:
        body["logSetting"] = request.log_setting.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2LimitDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2LimitDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2LimitGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2LimitGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2LimitDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2LimitDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2LimitCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2LimitCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2LimitCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2LimitCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2LimitCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2LimitCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2LimitPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
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
    return Gs2AsyncResult.new(Gs2LimitPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2LimitImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/import/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2LimitImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2LimitCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
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
    return Gs2AsyncResult.new(Gs2LimitCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_counters(request: Gs2LimitDescribeCountersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/me/counter"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.limit_name != null:
        query_strings["limitName"] = request.limit_name
    if request.page_token != null:
        query_strings["pageToken"] = request.page_token
    if request.limit != null:
        query_strings["limit"] = request.limit
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitDescribeCountersResult.from_dict(response.body), null)


func describe_counters_by_user_id(request: Gs2LimitDescribeCountersByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/counter"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.limit_name != null:
        query_strings["limitName"] = request.limit_name
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
    return Gs2AsyncResult.new(Gs2LimitDescribeCountersByUserIdResult.from_dict(response.body), null)


func get_counter(request: Gs2LimitGetCounterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/me/counter/{limitName}/{counterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitGetCounterResult.from_dict(response.body), null)


func get_counter_by_user_id(request: Gs2LimitGetCounterByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/counter/{limitName}/{counterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
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
    return Gs2AsyncResult.new(Gs2LimitGetCounterByUserIdResult.from_dict(response.body), null)


func count_up(request: Gs2LimitCountUpRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/me/counter/{limitName}/{counterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.count_up_value != null:
        body["countUpValue"] = request.count_up_value
    if request.max_value != null:
        body["maxValue"] = request.max_value
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
        if response.error.has_error_code("limit.counter.overflow"):
            return Gs2AsyncResult.new(null, Gs2LimitOverflowException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitCountUpResult.from_dict(response.body), null)


func count_up_by_user_id(request: Gs2LimitCountUpByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/counter/{limitName}/{counterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.count_up_value != null:
        body["countUpValue"] = request.count_up_value
    if request.max_value != null:
        body["maxValue"] = request.max_value
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
        if response.error.has_error_code("limit.counter.overflow"):
            return Gs2AsyncResult.new(null, Gs2LimitOverflowException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitCountUpByUserIdResult.from_dict(response.body), null)


func count_down_by_user_id(request: Gs2LimitCountDownByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/counter/{limitName}/{counterName}/decrease"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.count_down_value != null:
        body["countDownValue"] = request.count_down_value
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
    return Gs2AsyncResult.new(Gs2LimitCountDownByUserIdResult.from_dict(response.body), null)


func delete_counter_by_user_id(request: Gs2LimitDeleteCounterByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/counter/{limitName}/{counterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitDeleteCounterByUserIdResult.from_dict(response.body), null)


func verify_counter(request: Gs2LimitVerifyCounterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/me/counter/{limitName}/{counterName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.count != null:
        body["count"] = request.count
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
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
    return Gs2AsyncResult.new(Gs2LimitVerifyCounterResult.from_dict(response.body), null)


func verify_counter_by_user_id(request: Gs2LimitVerifyCounterByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/counter/{limitName}/{counterName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    url = url.replace("{counterName}", "null" if (request.counter_name == null or str(request.counter_name) == "") else str(request.counter_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.count != null:
        body["count"] = request.count
    if request.multiply_value_specifying_quantity != null:
        body["multiplyValueSpecifyingQuantity"] = request.multiply_value_specifying_quantity
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
    return Gs2AsyncResult.new(Gs2LimitVerifyCounterByUserIdResult.from_dict(response.body), null)


func count_up_by_stamp_task(request: Gs2LimitCountUpByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/stamp/counter/increase"
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
    return Gs2AsyncResult.new(Gs2LimitCountUpByStampTaskResult.from_dict(response.body), null)


func count_down_by_stamp_sheet(request: Gs2LimitCountDownByStampSheetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/stamp/counter/decrease"
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
    return Gs2AsyncResult.new(Gs2LimitCountDownByStampSheetResult.from_dict(response.body), null)


func delete_by_stamp_sheet(request: Gs2LimitDeleteByStampSheetRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/stamp/counter/delete"
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
    return Gs2AsyncResult.new(Gs2LimitDeleteByStampSheetResult.from_dict(response.body), null)


func verify_counter_by_stamp_task(request: Gs2LimitVerifyCounterByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/stamp/counter/verify"
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
    return Gs2AsyncResult.new(Gs2LimitVerifyCounterByStampTaskResult.from_dict(response.body), null)


func describe_limit_model_masters(request: Gs2LimitDescribeLimitModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/limit"
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
    return Gs2AsyncResult.new(Gs2LimitDescribeLimitModelMastersResult.from_dict(response.body), null)


func create_limit_model_master(request: Gs2LimitCreateLimitModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/limit"
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
    if request.reset_type != null:
        body["resetType"] = request.reset_type
    if request.reset_day_of_month != null:
        body["resetDayOfMonth"] = request.reset_day_of_month
    if request.reset_day_of_week != null:
        body["resetDayOfWeek"] = request.reset_day_of_week
    if request.reset_hour != null:
        body["resetHour"] = request.reset_hour
    if request.anchor_timestamp != null:
        body["anchorTimestamp"] = request.anchor_timestamp
    if request.days != null:
        body["days"] = request.days
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitCreateLimitModelMasterResult.from_dict(response.body), null)


func get_limit_model_master(request: Gs2LimitGetLimitModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/limit/{limitName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
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
    return Gs2AsyncResult.new(Gs2LimitGetLimitModelMasterResult.from_dict(response.body), null)


func update_limit_model_master(request: Gs2LimitUpdateLimitModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/limit/{limitName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.reset_type != null:
        body["resetType"] = request.reset_type
    if request.reset_day_of_month != null:
        body["resetDayOfMonth"] = request.reset_day_of_month
    if request.reset_day_of_week != null:
        body["resetDayOfWeek"] = request.reset_day_of_week
    if request.reset_hour != null:
        body["resetHour"] = request.reset_hour
    if request.anchor_timestamp != null:
        body["anchorTimestamp"] = request.anchor_timestamp
    if request.days != null:
        body["days"] = request.days
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2LimitUpdateLimitModelMasterResult.from_dict(response.body), null)


func delete_limit_model_master(request: Gs2LimitDeleteLimitModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/limit/{limitName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
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
    return Gs2AsyncResult.new(Gs2LimitDeleteLimitModelMasterResult.from_dict(response.body), null)


func export_master(request: Gs2LimitExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/export"
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
    return Gs2AsyncResult.new(Gs2LimitExportMasterResult.from_dict(response.body), null)


func get_current_limit_master(request: Gs2LimitGetCurrentLimitMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2LimitGetCurrentLimitMasterResult.from_dict(response.body), null)


func pre_update_current_limit_master(request: Gs2LimitPreUpdateCurrentLimitMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2LimitPreUpdateCurrentLimitMasterResult.from_dict(response.body), null)


func update_current_limit_master(request: Gs2LimitUpdateCurrentLimitMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2LimitPreUpdateCurrentLimitMasterRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.namespace_name = request.namespace_name
        var pre_async_result = await pre_update_current_limit_master(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.settings)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.settings = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2LimitUpdateCurrentLimitMasterResult.from_dict(response.body), null)


func update_current_limit_master_from_git_hub(request: Gs2LimitUpdateCurrentLimitMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
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
    return Gs2AsyncResult.new(Gs2LimitUpdateCurrentLimitMasterFromGitHubResult.from_dict(response.body), null)


func describe_limit_models(request: Gs2LimitDescribeLimitModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/limit"
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
    return Gs2AsyncResult.new(Gs2LimitDescribeLimitModelsResult.from_dict(response.body), null)


func get_limit_model(request: Gs2LimitGetLimitModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "limit").replace("{region}", session.region) + "/{namespaceName}/limit/{limitName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{limitName}", "null" if (request.limit_name == null or str(request.limit_name) == "") else str(request.limit_name))
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
    return Gs2AsyncResult.new(Gs2LimitGetLimitModelResult.from_dict(response.body), null)