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
class_name Gs2DatastoreRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2DatastoreDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2DatastoreDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2DatastoreCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/"
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
    if request.done_upload_script != null:
        body["doneUploadScript"] = request.done_upload_script.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2DatastoreGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2DatastoreGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2DatastoreGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2DatastoreGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2DatastoreUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}"
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
    if request.done_upload_script != null:
        body["doneUploadScript"] = request.done_upload_script.to_dict()
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2DatastoreDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2DatastoreDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2DatastoreGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2DatastoreGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2DatastoreDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2DatastoreDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2DatastoreCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2DatastoreCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2DatastoreCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2DatastoreCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2DatastoreCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2DatastoreCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2DatastorePrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2DatastoreImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/import/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2DatastoreImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2DatastoreCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
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
    return Gs2AsyncResult.new(Gs2DatastoreCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_data_objects(request: Gs2DatastoreDescribeDataObjectsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.status != null:
        query_strings["status"] = request.status
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
    return Gs2AsyncResult.new(Gs2DatastoreDescribeDataObjectsResult.from_dict(response.body), null)


func describe_data_objects_by_user_id(request: Gs2DatastoreDescribeDataObjectsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.status != null:
        query_strings["status"] = request.status
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
    return Gs2AsyncResult.new(Gs2DatastoreDescribeDataObjectsByUserIdResult.from_dict(response.body), null)


func prepare_upload(request: Gs2DatastorePrepareUploadRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/file"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.content_type != null:
        body["contentType"] = request.content_type
    if request.scope != null:
        body["scope"] = request.scope
    if request.allow_user_ids != null:
        body["allowUserIds"] = request.allow_user_ids
    if request.update_if_exists != null:
        body["updateIfExists"] = request.update_if_exists
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareUploadResult.from_dict(response.body), null)


func prepare_upload_by_user_id(request: Gs2DatastorePrepareUploadByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/file"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.name != null:
        body["name"] = request.name
    if request.content_type != null:
        body["contentType"] = request.content_type
    if request.scope != null:
        body["scope"] = request.scope
    if request.allow_user_ids != null:
        body["allowUserIds"] = request.allow_user_ids
    if request.update_if_exists != null:
        body["updateIfExists"] = request.update_if_exists
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareUploadByUserIdResult.from_dict(response.body), null)


func update_data_object(request: Gs2DatastoreUpdateDataObjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.scope != null:
        body["scope"] = request.scope
    if request.allow_user_ids != null:
        body["allowUserIds"] = request.allow_user_ids
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
    return Gs2AsyncResult.new(Gs2DatastoreUpdateDataObjectResult.from_dict(response.body), null)


func update_data_object_by_user_id(request: Gs2DatastoreUpdateDataObjectByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.scope != null:
        body["scope"] = request.scope
    if request.allow_user_ids != null:
        body["allowUserIds"] = request.allow_user_ids
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
    return Gs2AsyncResult.new(Gs2DatastoreUpdateDataObjectByUserIdResult.from_dict(response.body), null)


func prepare_re_upload(request: Gs2DatastorePrepareReUploadRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}/file/reUpload"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.content_type != null:
        body["contentType"] = request.content_type
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareReUploadResult.from_dict(response.body), null)


func prepare_re_upload_by_user_id(request: Gs2DatastorePrepareReUploadByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}/file/reUpload"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.content_type != null:
        body["contentType"] = request.content_type
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareReUploadByUserIdResult.from_dict(response.body), null)


func done_upload(request: Gs2DatastoreDoneUploadRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}/done"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
        if response.error.has_error_code("dataObject.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2DatastoreInvalidStatusException.new(response.error))
        if response.error.has_error_code("dataObject.file.notUploaded"):
            return Gs2AsyncResult.new(null, Gs2DatastoreNotUploadedException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreDoneUploadResult.from_dict(response.body), null)


func done_upload_by_user_id(request: Gs2DatastoreDoneUploadByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}/done"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
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
        if response.error.has_error_code("dataObject.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2DatastoreInvalidStatusException.new(response.error))
        if response.error.has_error_code("dataObject.file.notUploaded"):
            return Gs2AsyncResult.new(null, Gs2DatastoreNotUploadedException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreDoneUploadByUserIdResult.from_dict(response.body), null)


func delete_data_object(request: Gs2DatastoreDeleteDataObjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("DELETE", url, headers, query_strings, null)
    if response.error != null:
        if response.error.has_error_code("dataObject.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2DatastoreInvalidStatusException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreDeleteDataObjectResult.from_dict(response.body), null)


func delete_data_object_by_user_id(request: Gs2DatastoreDeleteDataObjectByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
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
        if response.error.has_error_code("dataObject.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2DatastoreInvalidStatusException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreDeleteDataObjectByUserIdResult.from_dict(response.body), null)


func prepare_download(request: Gs2DatastorePrepareDownloadRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/file"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data_object_id != null:
        body["dataObjectId"] = request.data_object_id
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadResult.from_dict(response.body), null)


func prepare_download_by_user_id(request: Gs2DatastorePrepareDownloadByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/file"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data_object_id != null:
        body["dataObjectId"] = request.data_object_id
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadByUserIdResult.from_dict(response.body), null)


func prepare_download_by_generation(request: Gs2DatastorePrepareDownloadByGenerationRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/file/generation/{generation}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{generation}", "null" if (request.generation == null or str(request.generation) == "") else str(request.generation))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data_object_id != null:
        body["dataObjectId"] = request.data_object_id
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadByGenerationResult.from_dict(response.body), null)


func prepare_download_by_generation_and_user_id(request: Gs2DatastorePrepareDownloadByGenerationAndUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/file/generation/{generation}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{generation}", "null" if (request.generation == null or str(request.generation) == "") else str(request.generation))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data_object_id != null:
        body["dataObjectId"] = request.data_object_id
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadByGenerationAndUserIdResult.from_dict(response.body), null)


func prepare_download_own_data(request: Gs2DatastorePrepareDownloadOwnDataRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}/file"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadOwnDataResult.from_dict(response.body), null)


func prepare_download_by_user_id_and_data_object_name(request: Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}/file"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
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
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameResult.from_dict(response.body), null)


func prepare_download_own_data_by_generation(request: Gs2DatastorePrepareDownloadOwnDataByGenerationRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}/generation/{generation}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    url = url.replace("{generation}", "null" if (request.generation == null or str(request.generation) == "") else str(request.generation))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadOwnDataByGenerationResult.from_dict(response.body), null)


func prepare_download_by_user_id_and_data_object_name_and_generation(request: Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}/generation/{generation}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    url = url.replace("{generation}", "null" if (request.generation == null or str(request.generation) == "") else str(request.generation))
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
    return Gs2AsyncResult.new(Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationResult.from_dict(response.body), null)


func restore_data_object(request: Gs2DatastoreRestoreDataObjectRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/file/restore"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.data_object_id != null:
        body["dataObjectId"] = request.data_object_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        if response.error.has_error_code("dataObject.status.invalid"):
            return Gs2AsyncResult.new(null, Gs2DatastoreInvalidStatusException.new(response.error))
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreRestoreDataObjectResult.from_dict(response.body), null)


func describe_data_object_histories(request: Gs2DatastoreDescribeDataObjectHistoriesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}/history"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
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
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreDescribeDataObjectHistoriesResult.from_dict(response.body), null)


func describe_data_object_histories_by_user_id(request: Gs2DatastoreDescribeDataObjectHistoriesByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}/history"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
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
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreDescribeDataObjectHistoriesByUserIdResult.from_dict(response.body), null)


func get_data_object_history(request: Gs2DatastoreGetDataObjectHistoryRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/me/data/{dataObjectName}/history/{generation}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    url = url.replace("{generation}", "null" if (request.generation == null or str(request.generation) == "") else str(request.generation))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2DatastoreGetDataObjectHistoryResult.from_dict(response.body), null)


func get_data_object_history_by_user_id(request: Gs2DatastoreGetDataObjectHistoryByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "datastore").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/data/{dataObjectName}/history/{generation}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{dataObjectName}", "null" if (request.data_object_name == null or str(request.data_object_name) == "") else str(request.data_object_name))
    url = url.replace("{generation}", "null" if (request.generation == null or str(request.generation) == "") else str(request.generation))
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
    return Gs2AsyncResult.new(Gs2DatastoreGetDataObjectHistoryByUserIdResult.from_dict(response.body), null)