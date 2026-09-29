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
class_name Gs2LogServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    return null


static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2LogDescribeNamespacesMethodCache.put_cache(
            Gs2LogDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2LogCreateNamespaceMethodCache.put_cache(
            Gs2LogCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2LogGetNamespaceStatusMethodCache.put_cache(
            Gs2LogGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2LogGetNamespaceMethodCache.put_cache(
            Gs2LogGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2LogUpdateNamespaceMethodCache.put_cache(
            Gs2LogUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2LogDeleteNamespaceMethodCache.put_cache(
            Gs2LogDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2LogGetServiceVersionMethodCache.put_cache(
            Gs2LogGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryAccessLog":
        Gs2LogQueryAccessLogMethodCache.put_cache(
            Gs2LogQueryAccessLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryAccessLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countAccessLog":
        Gs2LogCountAccessLogMethodCache.put_cache(
            Gs2LogCountAccessLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCountAccessLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryIssueStampSheetLog":
        Gs2LogQueryIssueStampSheetLogMethodCache.put_cache(
            Gs2LogQueryIssueStampSheetLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryIssueStampSheetLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countIssueStampSheetLog":
        Gs2LogCountIssueStampSheetLogMethodCache.put_cache(
            Gs2LogCountIssueStampSheetLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCountIssueStampSheetLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryExecuteStampSheetLog":
        Gs2LogQueryExecuteStampSheetLogMethodCache.put_cache(
            Gs2LogQueryExecuteStampSheetLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryExecuteStampSheetLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countExecuteStampSheetLog":
        Gs2LogCountExecuteStampSheetLogMethodCache.put_cache(
            Gs2LogCountExecuteStampSheetLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCountExecuteStampSheetLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryExecuteStampTaskLog":
        Gs2LogQueryExecuteStampTaskLogMethodCache.put_cache(
            Gs2LogQueryExecuteStampTaskLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryExecuteStampTaskLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "countExecuteStampTaskLog":
        Gs2LogCountExecuteStampTaskLogMethodCache.put_cache(
            Gs2LogCountExecuteStampTaskLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCountExecuteStampTaskLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryInGameLog":
        Gs2LogQueryInGameLogMethodCache.put_cache(
            Gs2LogQueryInGameLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryInGameLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendInGameLog":
        Gs2LogSendInGameLogMethodCache.put_cache(
            Gs2LogSendInGameLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogSendInGameLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "sendInGameLogByUserId":
        Gs2LogSendInGameLogByUserIdMethodCache.put_cache(
            Gs2LogSendInGameLogByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogSendInGameLogByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryAccessLogWithTelemetry":
        Gs2LogQueryAccessLogWithTelemetryMethodCache.put_cache(
            Gs2LogQueryAccessLogWithTelemetryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryAccessLogWithTelemetryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeInsights":
        Gs2LogDescribeInsightsMethodCache.put_cache(
            Gs2LogDescribeInsightsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDescribeInsightsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createInsight":
        Gs2LogCreateInsightMethodCache.put_cache(
            Gs2LogCreateInsightResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCreateInsightRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getInsight":
        Gs2LogGetInsightMethodCache.put_cache(
            Gs2LogGetInsightResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetInsightRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteInsight":
        Gs2LogDeleteInsightMethodCache.put_cache(
            Gs2LogDeleteInsightResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDeleteInsightRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeFacetModels":
        Gs2LogDescribeFacetModelsMethodCache.put_cache(
            Gs2LogDescribeFacetModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDescribeFacetModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createFacetModel":
        Gs2LogCreateFacetModelMethodCache.put_cache(
            Gs2LogCreateFacetModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCreateFacetModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getFacetModel":
        Gs2LogGetFacetModelMethodCache.put_cache(
            Gs2LogGetFacetModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetFacetModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateFacetModel":
        Gs2LogUpdateFacetModelMethodCache.put_cache(
            Gs2LogUpdateFacetModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogUpdateFacetModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteFacetModel":
        Gs2LogDeleteFacetModelMethodCache.put_cache(
            Gs2LogDeleteFacetModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDeleteFacetModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDashboards":
        Gs2LogDescribeDashboardsMethodCache.put_cache(
            Gs2LogDescribeDashboardsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDescribeDashboardsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createDashboard":
        Gs2LogCreateDashboardMethodCache.put_cache(
            Gs2LogCreateDashboardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogCreateDashboardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDashboard":
        Gs2LogGetDashboardMethodCache.put_cache(
            Gs2LogGetDashboardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetDashboardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateDashboard":
        Gs2LogUpdateDashboardMethodCache.put_cache(
            Gs2LogUpdateDashboardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogUpdateDashboardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "duplicateDashboard":
        Gs2LogDuplicateDashboardMethodCache.put_cache(
            Gs2LogDuplicateDashboardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDuplicateDashboardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteDashboard":
        Gs2LogDeleteDashboardMethodCache.put_cache(
            Gs2LogDeleteDashboardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDeleteDashboardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryLog":
        Gs2LogQueryLogMethodCache.put_cache(
            Gs2LogQueryLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getLog":
        Gs2LogGetLogMethodCache.put_cache(
            Gs2LogGetLogResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetLogRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryFacets":
        Gs2LogQueryFacetsMethodCache.put_cache(
            Gs2LogQueryFacetsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryFacetsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryTimeseries":
        Gs2LogQueryTimeseriesMethodCache.put_cache(
            Gs2LogQueryTimeseriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryTimeseriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getTrace":
        Gs2LogGetTraceMethodCache.put_cache(
            Gs2LogGetTraceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogGetTraceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "queryMetricsTimeseries":
        Gs2LogQueryMetricsTimeseriesMethodCache.put_cache(
            Gs2LogQueryMetricsTimeseriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogQueryMetricsTimeseriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMetrics":
        Gs2LogDescribeMetricsMethodCache.put_cache(
            Gs2LogDescribeMetricsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDescribeMetricsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeLabelValues":
        Gs2LogDescribeLabelValuesMethodCache.put_cache(
            Gs2LogDescribeLabelValuesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LogDescribeLabelValuesRequest.from_dict(_parse(request_payload))
        )
        return
    pass