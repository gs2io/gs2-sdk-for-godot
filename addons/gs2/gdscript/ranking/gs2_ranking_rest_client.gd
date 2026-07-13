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
class_name Gs2RankingRestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2RankingDescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2RankingDescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2RankingCreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2RankingCreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2RankingGetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2RankingGetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2RankingGetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2RankingGetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2RankingUpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2RankingUpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2RankingDeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2RankingDeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2RankingGetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2RankingGetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2RankingDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2RankingDumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2RankingCheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2RankingCheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2RankingCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2RankingCleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2RankingCheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2RankingCheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2RankingPrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
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
    return Gs2AsyncResult.new(Gs2RankingPrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2RankingImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/import/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2RankingImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2RankingCheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
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
    return Gs2AsyncResult.new(Gs2RankingCheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_category_models(request: Gs2RankingDescribeCategoryModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/category"
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
    return Gs2AsyncResult.new(Gs2RankingDescribeCategoryModelsResult.from_dict(response.body), null)


func get_category_model(request: Gs2RankingGetCategoryModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/category/{categoryName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
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
    return Gs2AsyncResult.new(Gs2RankingGetCategoryModelResult.from_dict(response.body), null)


func describe_category_model_masters(request: Gs2RankingDescribeCategoryModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/category"
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
    return Gs2AsyncResult.new(Gs2RankingDescribeCategoryModelMastersResult.from_dict(response.body), null)


func create_category_model_master(request: Gs2RankingCreateCategoryModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/category"
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
    if request.minimum_value != null:
        body["minimumValue"] = request.minimum_value
    if request.maximum_value != null:
        body["maximumValue"] = request.maximum_value
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.scope != null:
        body["scope"] = request.scope
    if request.global_ranking_setting != null:
        body["globalRankingSetting"] = request.global_ranking_setting.to_dict()
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.unique_by_user_id != null:
        body["uniqueByUserId"] = request.unique_by_user_id
    if request.sum != null:
        body["sum"] = request.sum
    if request.calculate_fixed_timing_hour != null:
        body["calculateFixedTimingHour"] = request.calculate_fixed_timing_hour
    if request.calculate_fixed_timing_minute != null:
        body["calculateFixedTimingMinute"] = request.calculate_fixed_timing_minute
    if request.calculate_interval_minutes != null:
        body["calculateIntervalMinutes"] = request.calculate_interval_minutes
    if request.additional_scopes != null:
        body["additionalScopes"] = request.additional_scopes.map(func(v): return null if v == null else v.to_dict())
    if request.ignore_user_ids != null:
        body["ignoreUserIds"] = request.ignore_user_ids
    if request.generation != null:
        body["generation"] = request.generation
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCreateCategoryModelMasterResult.from_dict(response.body), null)


func get_category_model_master(request: Gs2RankingGetCategoryModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/category/{categoryName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
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
    return Gs2AsyncResult.new(Gs2RankingGetCategoryModelMasterResult.from_dict(response.body), null)


func update_category_model_master(request: Gs2RankingUpdateCategoryModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/category/{categoryName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.minimum_value != null:
        body["minimumValue"] = request.minimum_value
    if request.maximum_value != null:
        body["maximumValue"] = request.maximum_value
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.scope != null:
        body["scope"] = request.scope
    if request.global_ranking_setting != null:
        body["globalRankingSetting"] = request.global_ranking_setting.to_dict()
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.unique_by_user_id != null:
        body["uniqueByUserId"] = request.unique_by_user_id
    if request.sum != null:
        body["sum"] = request.sum
    if request.calculate_fixed_timing_hour != null:
        body["calculateFixedTimingHour"] = request.calculate_fixed_timing_hour
    if request.calculate_fixed_timing_minute != null:
        body["calculateFixedTimingMinute"] = request.calculate_fixed_timing_minute
    if request.calculate_interval_minutes != null:
        body["calculateIntervalMinutes"] = request.calculate_interval_minutes
    if request.additional_scopes != null:
        body["additionalScopes"] = request.additional_scopes.map(func(v): return null if v == null else v.to_dict())
    if request.ignore_user_ids != null:
        body["ignoreUserIds"] = request.ignore_user_ids
    if request.generation != null:
        body["generation"] = request.generation
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingUpdateCategoryModelMasterResult.from_dict(response.body), null)


func delete_category_model_master(request: Gs2RankingDeleteCategoryModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/category/{categoryName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
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
    return Gs2AsyncResult.new(Gs2RankingDeleteCategoryModelMasterResult.from_dict(response.body), null)


func subscribe(request: Gs2RankingSubscribeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/category/{categoryName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingSubscribeResult.from_dict(response.body), null)


func subscribe_by_user_id(request: Gs2RankingSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/category/{categoryName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingSubscribeByUserIdResult.from_dict(response.body), null)


func describe_scores(request: Gs2RankingDescribeScoresRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/category/{categoryName}/scorer/{scorerUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{scorerUserId}", "null" if (request.scorer_user_id == null or str(request.scorer_user_id) == "") else str(request.scorer_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingDescribeScoresResult.from_dict(response.body), null)


func describe_scores_by_user_id(request: Gs2RankingDescribeScoresByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/category/{categoryName}/scorer/{scorerUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{scorerUserId}", "null" if (request.scorer_user_id == null or str(request.scorer_user_id) == "") else str(request.scorer_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingDescribeScoresByUserIdResult.from_dict(response.body), null)


func get_score(request: Gs2RankingGetScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/category/{categoryName}/scorer/{scorerUserId}/score/{uniqueId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{scorerUserId}", "null" if (request.scorer_user_id == null or str(request.scorer_user_id) == "") else str(request.scorer_user_id))
    url = url.replace("{uniqueId}", "null" if (request.unique_id == null or str(request.unique_id) == "") else str(request.unique_id))
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
    return Gs2AsyncResult.new(Gs2RankingGetScoreResult.from_dict(response.body), null)


func get_score_by_user_id(request: Gs2RankingGetScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/category/{categoryName}/scorer/{scorerUserId}/score/{uniqueId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{scorerUserId}", "null" if (request.scorer_user_id == null or str(request.scorer_user_id) == "") else str(request.scorer_user_id))
    url = url.replace("{uniqueId}", "null" if (request.unique_id == null or str(request.unique_id) == "") else str(request.unique_id))
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
    return Gs2AsyncResult.new(Gs2RankingGetScoreByUserIdResult.from_dict(response.body), null)


func describe_rankings(request: Gs2RankingDescribeRankingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/category/{categoryName}/ranking"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.additional_scope_name != null:
        query_strings["additionalScopeName"] = request.additional_scope_name
    if request.start_index != null:
        query_strings["startIndex"] = request.start_index
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
    return Gs2AsyncResult.new(Gs2RankingDescribeRankingsResult.from_dict(response.body), null)


func describe_rankingss_by_user_id(request: Gs2RankingDescribeRankingssByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/category/{categoryName}/ranking"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.additional_scope_name != null:
        query_strings["additionalScopeName"] = request.additional_scope_name
    if request.start_index != null:
        query_strings["startIndex"] = request.start_index
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
    return Gs2AsyncResult.new(Gs2RankingDescribeRankingssByUserIdResult.from_dict(response.body), null)


func describe_near_rankings(request: Gs2RankingDescribeNearRankingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/category/{categoryName}/ranking/near"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.additional_scope_name != null:
        query_strings["additionalScopeName"] = request.additional_scope_name
    if request.score != null:
        query_strings["score"] = request.score
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingDescribeNearRankingsResult.from_dict(response.body), null)


func get_ranking(request: Gs2RankingGetRankingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/category/{categoryName}/ranking/scorer/{scorerUserId}/score/{uniqueId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{scorerUserId}", "null" if (request.scorer_user_id == null or str(request.scorer_user_id) == "") else str(request.scorer_user_id))
    url = url.replace("{uniqueId}", "null" if (request.unique_id == null or str(request.unique_id) == "") else str(request.unique_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.additional_scope_name != null:
        query_strings["additionalScopeName"] = request.additional_scope_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetRankingResult.from_dict(response.body), null)


func get_ranking_by_user_id(request: Gs2RankingGetRankingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/category/{categoryName}/ranking/scorer/{scorerUserId}/score/{uniqueId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{scorerUserId}", "null" if (request.scorer_user_id == null or str(request.scorer_user_id) == "") else str(request.scorer_user_id))
    url = url.replace("{uniqueId}", "null" if (request.unique_id == null or str(request.unique_id) == "") else str(request.unique_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.additional_scope_name != null:
        query_strings["additionalScopeName"] = request.additional_scope_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingGetRankingByUserIdResult.from_dict(response.body), null)


func put_score(request: Gs2RankingPutScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/category/{categoryName}/ranking"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingPutScoreResult.from_dict(response.body), null)


func put_score_by_user_id(request: Gs2RankingPutScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/category/{categoryName}/ranking"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.score != null:
        body["score"] = request.score
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.duplication_avoider != null:
        headers["X-GS2-DUPLICATION-AVOIDER"] = request.duplication_avoider
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingPutScoreByUserIdResult.from_dict(response.body), null)


func calc_ranking(request: Gs2RankingCalcRankingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/category/{categoryName}/calc/ranking"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.additional_scope_name != null:
        body["additionalScopeName"] = request.additional_scope_name
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingCalcRankingResult.from_dict(response.body), null)


func export_master(request: Gs2RankingExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/export"
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
    return Gs2AsyncResult.new(Gs2RankingExportMasterResult.from_dict(response.body), null)


func get_current_ranking_master(request: Gs2RankingGetCurrentRankingMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2RankingGetCurrentRankingMasterResult.from_dict(response.body), null)


func pre_update_current_ranking_master(request: Gs2RankingPreUpdateCurrentRankingMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2RankingPreUpdateCurrentRankingMasterResult.from_dict(response.body), null)


func update_current_ranking_master(request: Gs2RankingUpdateCurrentRankingMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2RankingPreUpdateCurrentRankingMasterRequest.new()
        pre_request.context_stack = request.context_stack
        pre_request.namespace_name = request.namespace_name
        var pre_async_result = await pre_update_current_ranking_master(pre_request)
        if pre_async_result.error != null:
            return pre_async_result
        var upload_response = await session.upload(pre_async_result.result.upload_url, request.settings)
        if upload_response.error != null:
            return Gs2AsyncResult.new(null, upload_response.error)
        request.mode = "preUpload"
        request.upload_token = pre_async_result.result.upload_token
        request.settings = null
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2RankingUpdateCurrentRankingMasterResult.from_dict(response.body), null)


func update_current_ranking_master_from_git_hub(request: Gs2RankingUpdateCurrentRankingMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
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
    return Gs2AsyncResult.new(Gs2RankingUpdateCurrentRankingMasterFromGitHubResult.from_dict(response.body), null)


func get_subscribe(request: Gs2RankingGetSubscribeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/category/{categoryName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingGetSubscribeResult.from_dict(response.body), null)


func get_subscribe_by_user_id(request: Gs2RankingGetSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/category/{categoryName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingGetSubscribeByUserIdResult.from_dict(response.body), null)


func unsubscribe(request: Gs2RankingUnsubscribeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/category/{categoryName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2RankingUnsubscribeResult.from_dict(response.body), null)


func unsubscribe_by_user_id(request: Gs2RankingUnsubscribeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/category/{categoryName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{targetUserId}", "null" if (request.target_user_id == null or str(request.target_user_id) == "") else str(request.target_user_id))
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
    return Gs2AsyncResult.new(Gs2RankingUnsubscribeByUserIdResult.from_dict(response.body), null)


func describe_subscribes_by_category_name(request: Gs2RankingDescribeSubscribesByCategoryNameRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/category/{categoryName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
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
    return Gs2AsyncResult.new(Gs2RankingDescribeSubscribesByCategoryNameResult.from_dict(response.body), null)


func describe_subscribes_by_category_name_and_user_id(request: Gs2RankingDescribeSubscribesByCategoryNameAndUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/category/{categoryName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{categoryName}", "null" if (request.category_name == null or str(request.category_name) == "") else str(request.category_name))
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
    return Gs2AsyncResult.new(Gs2RankingDescribeSubscribesByCategoryNameAndUserIdResult.from_dict(response.body), null)