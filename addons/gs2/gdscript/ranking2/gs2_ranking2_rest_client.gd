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
class_name Gs2Ranking2RestClient
extends Gs2AbstractRestClient


func describe_namespaces(request: Gs2Ranking2DescribeNamespacesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeNamespacesResult.from_dict(response.body), null)


func create_namespace(request: Gs2Ranking2CreateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/"
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateNamespaceResult.from_dict(response.body), null)


func get_namespace_status(request: Gs2Ranking2GetNamespaceStatusRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/status"
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
    return Gs2AsyncResult.new(Gs2Ranking2GetNamespaceStatusResult.from_dict(response.body), null)


func get_namespace(request: Gs2Ranking2GetNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2Ranking2GetNamespaceResult.from_dict(response.body), null)


func update_namespace(request: Gs2Ranking2UpdateNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2Ranking2UpdateNamespaceResult.from_dict(response.body), null)


func delete_namespace(request: Gs2Ranking2DeleteNamespaceRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}"
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteNamespaceResult.from_dict(response.body), null)


func get_service_version(request: Gs2Ranking2GetServiceVersionRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/version"
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
    return Gs2AsyncResult.new(Gs2Ranking2GetServiceVersionResult.from_dict(response.body), null)


func dump_user_data_by_user_id(request: Gs2Ranking2DumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2Ranking2DumpUserDataByUserIdResult.from_dict(response.body), null)


func check_dump_user_data_by_user_id(request: Gs2Ranking2CheckDumpUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/dump/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2Ranking2CheckDumpUserDataByUserIdResult.from_dict(response.body), null)


func clean_user_data_by_user_id(request: Gs2Ranking2CleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2Ranking2CleanUserDataByUserIdResult.from_dict(response.body), null)


func check_clean_user_data_by_user_id(request: Gs2Ranking2CheckCleanUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/clean/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2Ranking2CheckCleanUserDataByUserIdResult.from_dict(response.body), null)


func prepare_import_user_data_by_user_id(request: Gs2Ranking2PrepareImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/import/user/{userId}/prepare"
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
    return Gs2AsyncResult.new(Gs2Ranking2PrepareImportUserDataByUserIdResult.from_dict(response.body), null)


func import_user_data_by_user_id(request: Gs2Ranking2ImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/import/user/{userId}"
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
    return Gs2AsyncResult.new(Gs2Ranking2ImportUserDataByUserIdResult.from_dict(response.body), null)


func check_import_user_data_by_user_id(request: Gs2Ranking2CheckImportUserDataByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/system/import/user/{userId}/{uploadToken}"
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
    return Gs2AsyncResult.new(Gs2Ranking2CheckImportUserDataByUserIdResult.from_dict(response.body), null)


func describe_global_ranking_models(request: Gs2Ranking2DescribeGlobalRankingModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/model/global"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingModelsResult.from_dict(response.body), null)


func get_global_ranking_model(request: Gs2Ranking2GetGlobalRankingModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/model/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingModelResult.from_dict(response.body), null)


func describe_global_ranking_model_masters(request: Gs2Ranking2DescribeGlobalRankingModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/global"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingModelMastersResult.from_dict(response.body), null)


func create_global_ranking_model_master(request: Gs2Ranking2CreateGlobalRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/global"
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
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.ranking_rewards != null:
        body["rankingRewards"] = request.ranking_rewards.map(func(v): return null if v == null else v.to_dict())
    if request.reward_calculation_index != null:
        body["rewardCalculationIndex"] = request.reward_calculation_index
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateGlobalRankingModelMasterResult.from_dict(response.body), null)


func get_global_ranking_model_master(request: Gs2Ranking2GetGlobalRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingModelMasterResult.from_dict(response.body), null)


func update_global_ranking_model_master(request: Gs2Ranking2UpdateGlobalRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.ranking_rewards != null:
        body["rankingRewards"] = request.ranking_rewards.map(func(v): return null if v == null else v.to_dict())
    if request.reward_calculation_index != null:
        body["rewardCalculationIndex"] = request.reward_calculation_index
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2UpdateGlobalRankingModelMasterResult.from_dict(response.body), null)


func delete_global_ranking_model_master(request: Gs2Ranking2DeleteGlobalRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteGlobalRankingModelMasterResult.from_dict(response.body), null)


func describe_global_ranking_scores(request: Gs2Ranking2DescribeGlobalRankingScoresRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/global"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingScoresResult.from_dict(response.body), null)


func describe_global_ranking_scores_by_user_id(request: Gs2Ranking2DescribeGlobalRankingScoresByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/global"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingScoresByUserIdResult.from_dict(response.body), null)


func put_global_ranking_score(request: Gs2Ranking2PutGlobalRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2PutGlobalRankingScoreResult.from_dict(response.body), null)


func put_global_ranking_score_by_user_id(request: Gs2Ranking2PutGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2PutGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func get_global_ranking_score(request: Gs2Ranking2GetGlobalRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingScoreResult.from_dict(response.body), null)


func get_global_ranking_score_by_user_id(request: Gs2Ranking2GetGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/global/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func delete_global_ranking_score_by_user_id(request: Gs2Ranking2DeleteGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/global/{rankingName}/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_global_ranking_score(request: Gs2Ranking2VerifyGlobalRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/global/{rankingName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifyGlobalRankingScoreResult.from_dict(response.body), null)


func verify_global_ranking_score_by_user_id(request: Gs2Ranking2VerifyGlobalRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/global/{rankingName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifyGlobalRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_global_ranking_score_by_stamp_task(request: Gs2Ranking2VerifyGlobalRankingScoreByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/stamp/global/score/verify"
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifyGlobalRankingScoreByStampTaskResult.from_dict(response.body), null)


func describe_global_ranking_received_rewards(request: Gs2Ranking2DescribeGlobalRankingReceivedRewardsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/global/reward/received"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingReceivedRewardsResult.from_dict(response.body), null)


func describe_global_ranking_received_rewards_by_user_id(request: Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/global/reward/received"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdResult.from_dict(response.body), null)


func create_global_ranking_received_reward(request: Gs2Ranking2CreateGlobalRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/global/reward/received/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateGlobalRankingReceivedRewardResult.from_dict(response.body), null)


func create_global_ranking_received_reward_by_user_id(request: Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/global/reward/received/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func receive_global_ranking_received_reward(request: Gs2Ranking2ReceiveGlobalRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/global/reward/received/{rankingName}/{season}/reward/receive"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.config != null:
        body["config"] = request.config.map(func(v): return null if v == null else v.to_dict())
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
    return Gs2AsyncResult.new(Gs2Ranking2ReceiveGlobalRankingReceivedRewardResult.from_dict(response.body), null)


func receive_global_ranking_received_reward_by_user_id(request: Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/global/reward/received/{rankingName}/{season}/reward/receive"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.config != null:
        body["config"] = request.config.map(func(v): return null if v == null else v.to_dict())
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
    return Gs2AsyncResult.new(Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func get_global_ranking_received_reward(request: Gs2Ranking2GetGlobalRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/global/reward/received/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingReceivedRewardResult.from_dict(response.body), null)


func get_global_ranking_received_reward_by_user_id(request: Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/global/reward/received/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func delete_global_ranking_received_reward_by_user_id(request: Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/global/reward/received/{rankingName}/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func create_global_ranking_received_reward_by_stamp_task(request: Gs2Ranking2CreateGlobalRankingReceivedRewardByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/stamp/ranking/global/reward/receive"
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateGlobalRankingReceivedRewardByStampTaskResult.from_dict(response.body), null)


func describe_global_rankings(request: Gs2Ranking2DescribeGlobalRankingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/global/{rankingName}/user/me"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingsResult.from_dict(response.body), null)


func describe_global_rankings_by_user_id(request: Gs2Ranking2DescribeGlobalRankingsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/global/{rankingName}/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeGlobalRankingsByUserIdResult.from_dict(response.body), null)


func get_global_ranking(request: Gs2Ranking2GetGlobalRankingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/global/{rankingName}/user/me/rank"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingResult.from_dict(response.body), null)


func get_global_ranking_by_user_id(request: Gs2Ranking2GetGlobalRankingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/global/{rankingName}/user/{userId}/rank"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetGlobalRankingByUserIdResult.from_dict(response.body), null)


func describe_cluster_ranking_models(request: Gs2Ranking2DescribeClusterRankingModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/model/cluster"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingModelsResult.from_dict(response.body), null)


func get_cluster_ranking_model(request: Gs2Ranking2GetClusterRankingModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/model/cluster/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingModelResult.from_dict(response.body), null)


func describe_cluster_ranking_model_masters(request: Gs2Ranking2DescribeClusterRankingModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/cluster"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingModelMastersResult.from_dict(response.body), null)


func create_cluster_ranking_model_master(request: Gs2Ranking2CreateClusterRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/cluster"
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
    if request.cluster_type != null:
        body["clusterType"] = request.cluster_type
    if request.minimum_value != null:
        body["minimumValue"] = request.minimum_value
    if request.maximum_value != null:
        body["maximumValue"] = request.maximum_value
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.ranking_rewards != null:
        body["rankingRewards"] = request.ranking_rewards.map(func(v): return null if v == null else v.to_dict())
    if request.reward_calculation_index != null:
        body["rewardCalculationIndex"] = request.reward_calculation_index
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateClusterRankingModelMasterResult.from_dict(response.body), null)


func get_cluster_ranking_model_master(request: Gs2Ranking2GetClusterRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/cluster/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingModelMasterResult.from_dict(response.body), null)


func update_cluster_ranking_model_master(request: Gs2Ranking2UpdateClusterRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/cluster/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.description != null:
        body["description"] = request.description
    if request.metadata != null:
        body["metadata"] = request.metadata
    if request.cluster_type != null:
        body["clusterType"] = request.cluster_type
    if request.minimum_value != null:
        body["minimumValue"] = request.minimum_value
    if request.maximum_value != null:
        body["maximumValue"] = request.maximum_value
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.ranking_rewards != null:
        body["rankingRewards"] = request.ranking_rewards.map(func(v): return null if v == null else v.to_dict())
    if request.reward_calculation_index != null:
        body["rewardCalculationIndex"] = request.reward_calculation_index
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2UpdateClusterRankingModelMasterResult.from_dict(response.body), null)


func delete_cluster_ranking_model_master(request: Gs2Ranking2DeleteClusterRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/cluster/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteClusterRankingModelMasterResult.from_dict(response.body), null)


func describe_cluster_ranking_scores(request: Gs2Ranking2DescribeClusterRankingScoresRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/cluster"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        query_strings["clusterName"] = request.cluster_name
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingScoresResult.from_dict(response.body), null)


func describe_cluster_ranking_scores_by_user_id(request: Gs2Ranking2DescribeClusterRankingScoresByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/cluster"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        query_strings["clusterName"] = request.cluster_name
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingScoresByUserIdResult.from_dict(response.body), null)


func put_cluster_ranking_score(request: Gs2Ranking2PutClusterRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/cluster/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2PutClusterRankingScoreResult.from_dict(response.body), null)


func put_cluster_ranking_score_by_user_id(request: Gs2Ranking2PutClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/cluster/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2PutClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func get_cluster_ranking_score(request: Gs2Ranking2GetClusterRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/cluster/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingScoreResult.from_dict(response.body), null)


func get_cluster_ranking_score_by_user_id(request: Gs2Ranking2GetClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/cluster/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func delete_cluster_ranking_score_by_user_id(request: Gs2Ranking2DeleteClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/cluster/{rankingName}/{clusterName}/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_cluster_ranking_score(request: Gs2Ranking2VerifyClusterRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/cluster/{rankingName}/{clusterName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifyClusterRankingScoreResult.from_dict(response.body), null)


func verify_cluster_ranking_score_by_user_id(request: Gs2Ranking2VerifyClusterRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/cluster/{rankingName}/{clusterName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifyClusterRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_cluster_ranking_score_by_stamp_task(request: Gs2Ranking2VerifyClusterRankingScoreByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/stamp/cluster/score/verify"
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifyClusterRankingScoreByStampTaskResult.from_dict(response.body), null)


func describe_cluster_ranking_received_rewards(request: Gs2Ranking2DescribeClusterRankingReceivedRewardsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/cluster/reward/received"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        query_strings["clusterName"] = request.cluster_name
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingReceivedRewardsResult.from_dict(response.body), null)


func describe_cluster_ranking_received_rewards_by_user_id(request: Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/cluster/reward/received"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
    if request.cluster_name != null:
        query_strings["clusterName"] = request.cluster_name
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdResult.from_dict(response.body), null)


func create_cluster_ranking_received_reward(request: Gs2Ranking2CreateClusterRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/cluster/reward/received/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateClusterRankingReceivedRewardResult.from_dict(response.body), null)


func create_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/cluster/reward/received/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func receive_cluster_ranking_received_reward(request: Gs2Ranking2ReceiveClusterRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/cluster/reward/received/{rankingName}/{clusterName}/{season}/reward/receive"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.config != null:
        body["config"] = request.config.map(func(v): return null if v == null else v.to_dict())
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
    return Gs2AsyncResult.new(Gs2Ranking2ReceiveClusterRankingReceivedRewardResult.from_dict(response.body), null)


func receive_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/cluster/reward/received/{rankingName}/{clusterName}/{season}/reward/receive"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{season}", "null" if (request.season == null or str(request.season) == "") else str(request.season))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.config != null:
        body["config"] = request.config.map(func(v): return null if v == null else v.to_dict())
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
    return Gs2AsyncResult.new(Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func get_cluster_ranking_received_reward(request: Gs2Ranking2GetClusterRankingReceivedRewardRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/cluster/reward/received/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingReceivedRewardResult.from_dict(response.body), null)


func get_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/cluster/reward/received/{rankingName}/{clusterName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func delete_cluster_ranking_received_reward_by_user_id(request: Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/cluster/reward/received/{rankingName}/{clusterName}/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdResult.from_dict(response.body), null)


func create_cluster_ranking_received_reward_by_stamp_task(request: Gs2Ranking2CreateClusterRankingReceivedRewardByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/stamp/ranking/cluster/reward/receive"
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
    return Gs2AsyncResult.new(Gs2Ranking2CreateClusterRankingReceivedRewardByStampTaskResult.from_dict(response.body), null)


func describe_cluster_rankings(request: Gs2Ranking2DescribeClusterRankingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/cluster/{rankingName}/{clusterName}/user/me"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingsResult.from_dict(response.body), null)


func describe_cluster_rankings_by_user_id(request: Gs2Ranking2DescribeClusterRankingsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/cluster/{rankingName}/{clusterName}/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeClusterRankingsByUserIdResult.from_dict(response.body), null)


func get_cluster_ranking(request: Gs2Ranking2GetClusterRankingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/cluster/{rankingName}/{clusterName}/user/me/rank"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingResult.from_dict(response.body), null)


func get_cluster_ranking_by_user_id(request: Gs2Ranking2GetClusterRankingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/cluster/{rankingName}/{clusterName}/user/{userId}/rank"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{clusterName}", "null" if (request.cluster_name == null or str(request.cluster_name) == "") else str(request.cluster_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetClusterRankingByUserIdResult.from_dict(response.body), null)


func describe_subscribe_ranking_models(request: Gs2Ranking2DescribeSubscribeRankingModelsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/model/subscribe"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribeRankingModelsResult.from_dict(response.body), null)


func get_subscribe_ranking_model(request: Gs2Ranking2GetSubscribeRankingModelRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/model/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingModelResult.from_dict(response.body), null)


func describe_subscribe_ranking_model_masters(request: Gs2Ranking2DescribeSubscribeRankingModelMastersRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/subscribe"
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribeRankingModelMastersResult.from_dict(response.body), null)


func create_subscribe_ranking_model_master(request: Gs2Ranking2CreateSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/subscribe"
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
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("POST", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2CreateSubscribeRankingModelMasterResult.from_dict(response.body), null)


func get_subscribe_ranking_model_master(request: Gs2Ranking2GetSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingModelMasterResult.from_dict(response.body), null)


func update_subscribe_ranking_model_master(request: Gs2Ranking2UpdateSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    if request.sum != null:
        body["sum"] = request.sum
    if request.order_direction != null:
        body["orderDirection"] = request.order_direction
    if request.entry_period_event_id != null:
        body["entryPeriodEventId"] = request.entry_period_event_id
    if request.access_period_event_id != null:
        body["accessPeriodEventId"] = request.access_period_event_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2UpdateSubscribeRankingModelMasterResult.from_dict(response.body), null)


func delete_subscribe_ranking_model_master(request: Gs2Ranking2DeleteSubscribeRankingModelMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeRankingModelMasterResult.from_dict(response.body), null)


func describe_subscribes(request: Gs2Ranking2DescribeSubscribesRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/score"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribesResult.from_dict(response.body), null)


func describe_subscribes_by_user_id(request: Gs2Ranking2DescribeSubscribesByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/score"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribesByUserIdResult.from_dict(response.body), null)


func add_subscribe(request: Gs2Ranking2AddSubscribeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/{rankingName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2AddSubscribeResult.from_dict(response.body), null)


func add_subscribe_by_user_id(request: Gs2Ranking2AddSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/{rankingName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    var response = await session.send("PUT", url, headers, {}, body)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2AddSubscribeByUserIdResult.from_dict(response.body), null)


func describe_subscribe_ranking_scores(request: Gs2Ranking2DescribeSubscribeRankingScoresRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/subscribe"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribeRankingScoresResult.from_dict(response.body), null)


func describe_subscribe_ranking_scores_by_user_id(request: Gs2Ranking2DescribeSubscribeRankingScoresByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/subscribe"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.ranking_name != null:
        query_strings["rankingName"] = request.ranking_name
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribeRankingScoresByUserIdResult.from_dict(response.body), null)


func put_subscribe_ranking_score(request: Gs2Ranking2PutSubscribeRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2PutSubscribeRankingScoreResult.from_dict(response.body), null)


func put_subscribe_ranking_score_by_user_id(request: Gs2Ranking2PutSubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2PutSubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func get_subscribe_ranking_score(request: Gs2Ranking2GetSubscribeRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/score/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingScoreResult.from_dict(response.body), null)


func get_subscribe_ranking_score_by_user_id(request: Gs2Ranking2GetSubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/subscribe/{rankingName}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func delete_subscribe_ranking_score_by_user_id(request: Gs2Ranking2DeleteSubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/subscribe/{rankingName}/{season}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_subscribe_ranking_score(request: Gs2Ranking2VerifySubscribeRankingScoreRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/subscribe/{rankingName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifySubscribeRankingScoreResult.from_dict(response.body), null)


func verify_subscribe_ranking_score_by_user_id(request: Gs2Ranking2VerifySubscribeRankingScoreByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/score/subscribe/{rankingName}/verify/{verifyType}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{verifyType}", "null" if (request.verify_type == null or str(request.verify_type) == "") else str(request.verify_type))
    var headers = create_authorized_headers()
    var body = {}
    if request.context_stack != null:
        body["contextStack"] = request.context_stack
    if request.season != null:
        body["season"] = request.season
    if request.score != null:
        body["score"] = request.score
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifySubscribeRankingScoreByUserIdResult.from_dict(response.body), null)


func verify_subscribe_ranking_score_by_stamp_task(request: Gs2Ranking2VerifySubscribeRankingScoreByStampTaskRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/stamp/subscribe/score/verify"
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
    return Gs2AsyncResult.new(Gs2Ranking2VerifySubscribeRankingScoreByStampTaskResult.from_dict(response.body), null)


func describe_subscribe_rankings(request: Gs2Ranking2DescribeSubscribeRankingsRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/subscribe/{rankingName}/user/me"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribeRankingsResult.from_dict(response.body), null)


func describe_subscribe_rankings_by_user_id(request: Gs2Ranking2DescribeSubscribeRankingsByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/subscribe/{rankingName}/user/{userId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
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
    return Gs2AsyncResult.new(Gs2Ranking2DescribeSubscribeRankingsByUserIdResult.from_dict(response.body), null)


func get_subscribe_ranking(request: Gs2Ranking2GetSubscribeRankingRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/subscribe/{rankingName}/user/me/rank"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.scorer_user_id != null:
        query_strings["scorerUserId"] = request.scorer_user_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.access_token != null:
        headers["X-GS2-ACCESS-TOKEN"] = request.access_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingResult.from_dict(response.body), null)


func get_subscribe_ranking_by_user_id(request: Gs2Ranking2GetSubscribeRankingByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/ranking/subscribe/{rankingName}/user/{userId}/rank"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
    url = url.replace("{userId}", "null" if (request.user_id == null or str(request.user_id) == "") else str(request.user_id))
    var headers = create_authorized_headers()
    var query_strings = {}
    if request.context_stack != null:
        query_strings["contextStack"] = request.context_stack
    if request.season != null:
        query_strings["season"] = request.season
    if request.scorer_user_id != null:
        query_strings["scorerUserId"] = request.scorer_user_id
    if request.request_id != null:
        headers["X-GS2-REQUEST-ID"] = request.request_id
    if request.time_offset_token != null:
        headers["X-GS2-TIME-OFFSET-TOKEN"] = request.time_offset_token
    if request.dry_run:
        headers["X-GS2-DRY-RUN"] = "true"
    var response = await session.send("GET", url, headers, query_strings, null)
    if response.error != null:
        return Gs2AsyncResult.new(null, response.error)
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeRankingByUserIdResult.from_dict(response.body), null)


func export_master(request: Gs2Ranking2ExportMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/export"
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
    return Gs2AsyncResult.new(Gs2Ranking2ExportMasterResult.from_dict(response.body), null)


func get_current_ranking_master(request: Gs2Ranking2GetCurrentRankingMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2Ranking2GetCurrentRankingMasterResult.from_dict(response.body), null)


func pre_update_current_ranking_master(request: Gs2Ranking2PreUpdateCurrentRankingMasterRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2Ranking2PreUpdateCurrentRankingMasterResult.from_dict(response.body), null)


func update_current_ranking_master(request: Gs2Ranking2UpdateCurrentRankingMasterRequest) -> Gs2AsyncResult:
    if request.settings != null:
        var pre_request = Gs2Ranking2PreUpdateCurrentRankingMasterRequest.new()
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
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master"
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
    return Gs2AsyncResult.new(Gs2Ranking2UpdateCurrentRankingMasterResult.from_dict(response.body), null)


func update_current_ranking_master_from_git_hub(request: Gs2Ranking2UpdateCurrentRankingMasterFromGitHubRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/master/from_git_hub"
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
    return Gs2AsyncResult.new(Gs2Ranking2UpdateCurrentRankingMasterFromGitHubResult.from_dict(response.body), null)


func get_subscribe(request: Gs2Ranking2GetSubscribeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/{rankingName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeResult.from_dict(response.body), null)


func get_subscribe_by_user_id(request: Gs2Ranking2GetSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/{rankingName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2GetSubscribeByUserIdResult.from_dict(response.body), null)


func delete_subscribe(request: Gs2Ranking2DeleteSubscribeRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/me/subscribe/{rankingName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeResult.from_dict(response.body), null)


func delete_subscribe_by_user_id(request: Gs2Ranking2DeleteSubscribeByUserIdRequest) -> Gs2AsyncResult:
    var url = Gs2Constant.ENDPOINT_HOST.replace("{service}", "ranking2").replace("{region}", session.region) + "/{namespaceName}/user/{userId}/subscribe/{rankingName}/target/{targetUserId}"
    url = url.replace("{namespaceName}", "null" if (request.namespace_name == null or str(request.namespace_name) == "") else str(request.namespace_name))
    url = url.replace("{rankingName}", "null" if (request.ranking_name == null or str(request.ranking_name) == "") else str(request.ranking_name))
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
    return Gs2AsyncResult.new(Gs2Ranking2DeleteSubscribeByUserIdResult.from_dict(response.body), null)