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
class_name Gs2LogNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var namespace_name: Variant = null
var status: Variant = null
var next_page_token: Variant = null
var total_count: Variant = null
var scan_size: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2LogGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogGetNamespaceStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2LogGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogGetNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2LogUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogUpdateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2LogDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogDeleteNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_namespace(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_insight(
    request: Gs2LogCreateInsightRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogCreateInsightMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_insight(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LogInsightDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_dashboard(
    request: Gs2LogCreateDashboardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogCreateDashboardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_dashboard(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LogDashboardDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func metrics_timeseries(
    request: Gs2LogQueryMetricsTimeseriesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LogQueryMetricsTimeseriesMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.query_metrics_timeseries(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2LogTimeseriesPointDomain.new(
                _gs2
            ))
    return Gs2AsyncResult.new(domain, null)


func access_log(
    service = null,
    method = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogQueryAccessLogIterator:
    return Gs2LogQueryAccessLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_access_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogAccessLog",
        Gs2LogAccessLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_access_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogAccessLog",
        Gs2LogAccessLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_access_log(
    service = null,
    method = null,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogAccessLog",
        Gs2LogAccessLogCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func count_access_log(
    service = null,
    method = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogCountAccessLogIterator:
    return Gs2LogCountAccessLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_count_access_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogAccessLogCount",
        Gs2LogAccessLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_count_access_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogAccessLogCount",
        Gs2LogAccessLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_count_access_log(
    service = null,
    method = null,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogAccessLogCount",
        Gs2LogAccessLogCountCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func access_log_(
) -> Gs2LogAccessLogDomain:
    return Gs2LogAccessLogDomain.new(
        _gs2,
        namespace_name
    )


func execute_stamp_sheet_log(
    service = null,
    method = null,
    action = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogQueryExecuteStampSheetLogIterator:
    return Gs2LogQueryExecuteStampSheetLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        action,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_execute_stamp_sheet_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogExecuteStampSheetLog",
        Gs2LogExecuteStampSheetLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_execute_stamp_sheet_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogExecuteStampSheetLog",
        Gs2LogExecuteStampSheetLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_execute_stamp_sheet_log(
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogExecuteStampSheetLog",
        Gs2LogExecuteStampSheetLogCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func count_execute_stamp_sheet_log(
    service = null,
    method = null,
    action = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogCountExecuteStampSheetLogIterator:
    return Gs2LogCountExecuteStampSheetLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        action,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_count_execute_stamp_sheet_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogExecuteStampSheetLogCount",
        Gs2LogExecuteStampSheetLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_count_execute_stamp_sheet_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogExecuteStampSheetLogCount",
        Gs2LogExecuteStampSheetLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_count_execute_stamp_sheet_log(
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogExecuteStampSheetLogCount",
        Gs2LogExecuteStampSheetLogCountCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func execute_stamp_sheet_log_(
) -> Gs2LogExecuteStampSheetLogDomain:
    return Gs2LogExecuteStampSheetLogDomain.new(
        _gs2,
        namespace_name
    )


func execute_stamp_task_log(
    service = null,
    method = null,
    action = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogQueryExecuteStampTaskLogIterator:
    return Gs2LogQueryExecuteStampTaskLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        action,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_execute_stamp_task_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogExecuteStampTaskLog",
        Gs2LogExecuteStampTaskLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_execute_stamp_task_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogExecuteStampTaskLog",
        Gs2LogExecuteStampTaskLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_execute_stamp_task_log(
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogExecuteStampTaskLog",
        Gs2LogExecuteStampTaskLogCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func count_execute_stamp_task_log(
    service = null,
    method = null,
    action = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogCountExecuteStampTaskLogIterator:
    return Gs2LogCountExecuteStampTaskLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        action,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_count_execute_stamp_task_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogExecuteStampTaskLogCount",
        Gs2LogExecuteStampTaskLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_count_execute_stamp_task_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogExecuteStampTaskLogCount",
        Gs2LogExecuteStampTaskLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_count_execute_stamp_task_log(
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogExecuteStampTaskLogCount",
        Gs2LogExecuteStampTaskLogCountCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func execute_stamp_task_log_(
) -> Gs2LogExecuteStampTaskLogDomain:
    return Gs2LogExecuteStampTaskLogDomain.new(
        _gs2,
        namespace_name
    )


func issue_stamp_sheet_log(
    service = null,
    method = null,
    action = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogQueryIssueStampSheetLogIterator:
    return Gs2LogQueryIssueStampSheetLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        action,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_issue_stamp_sheet_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogIssueStampSheetLog",
        Gs2LogIssueStampSheetLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_issue_stamp_sheet_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogIssueStampSheetLog",
        Gs2LogIssueStampSheetLogCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_issue_stamp_sheet_log(
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogIssueStampSheetLog",
        Gs2LogIssueStampSheetLogCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func count_issue_stamp_sheet_log(
    service = null,
    method = null,
    action = null,
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogCountIssueStampSheetLogIterator:
    return Gs2LogCountIssueStampSheetLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        service,
        method,
        null,
        action,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_count_issue_stamp_sheet_log(
    callback: Callable,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogIssueStampSheetLogCount",
        Gs2LogIssueStampSheetLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_count_issue_stamp_sheet_log(
    callback_id: int,
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogIssueStampSheetLogCount",
        Gs2LogIssueStampSheetLogCountCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_count_issue_stamp_sheet_log(
    service = null,
    method = null,
    user_id = null,
    action = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogIssueStampSheetLogCount",
        Gs2LogIssueStampSheetLogCountCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func issue_stamp_sheet_log_(
) -> Gs2LogIssueStampSheetLogDomain:
    return Gs2LogIssueStampSheetLogDomain.new(
        _gs2,
        namespace_name
    )


func insights(
) -> Gs2LogDescribeInsightsIterator:
    return Gs2LogDescribeInsightsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_insights(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogInsight",
        Gs2LogInsightCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_insights(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogInsight",
        Gs2LogInsightCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_insights(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogInsight",
        Gs2LogInsightCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func insight(
    insight_name
) -> Gs2LogInsightDomain:
    return Gs2LogInsightDomain.new(
        _gs2,
        namespace_name,
        insight_name
    )


func access_log_with_telemetry(
    begin = null,
    end = null,
    long_term = null,
    time_offset_token = null
) -> Gs2LogQueryAccessLogWithTelemetryIterator:
    return Gs2LogQueryAccessLogWithTelemetryIterator.new(
        _gs2,
        _client,
        namespace_name,
        null,
        begin,
        end,
        long_term,
        time_offset_token
    )


func subscribe_access_log_with_telemetry(
    callback: Callable,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogAccessLogWithTelemetry",
        Gs2LogAccessLogWithTelemetryCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_access_log_with_telemetry(
    callback_id: int,
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogAccessLogWithTelemetry",
        Gs2LogAccessLogWithTelemetryCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_access_log_with_telemetry(
    user_id = null,
    begin = null,
    end = null,
    long_term = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogAccessLogWithTelemetry",
        Gs2LogAccessLogWithTelemetryCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func user(
    user_id
) -> Gs2LogUserDomain:
    return Gs2LogUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2LogUserAccessTokenDomain:
    return Gs2LogUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func facet_models(
    name_prefix = null
) -> Gs2LogDescribeFacetModelsIterator:
    return Gs2LogDescribeFacetModelsIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_facet_models(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogFacetModel",
        Gs2LogFacetModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_facet_models(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogFacetModel",
        Gs2LogFacetModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_facet_models(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogFacetModel",
        Gs2LogFacetModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func facet_model(
    field
) -> Gs2LogFacetModelDomain:
    return Gs2LogFacetModelDomain.new(
        _gs2,
        namespace_name,
        field
    )


func dashboards(
    name_prefix = null
) -> Gs2LogDescribeDashboardsIterator:
    return Gs2LogDescribeDashboardsIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_dashboards(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogDashboard",
        Gs2LogDashboardCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_dashboards(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogDashboard",
        Gs2LogDashboardCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_dashboards(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogDashboard",
        Gs2LogDashboardCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func dashboard(
    dashboard_name
) -> Gs2LogDashboardDomain:
    return Gs2LogDashboardDomain.new(
        _gs2,
        namespace_name,
        dashboard_name
    )


func metrics(
    name_prefix = null
) -> Gs2LogDescribeMetricsIterator:
    return Gs2LogDescribeMetricsIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_metrics(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogMetricModel",
        Gs2LogMetricModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_metrics(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogMetricModel",
        Gs2LogMetricModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_metrics(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogMetricModel",
        Gs2LogMetricModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )


func label_values(
    metric_name,
    label_name_prefix = null
) -> Gs2LogDescribeLabelValuesIterator:
    return Gs2LogDescribeLabelValuesIterator.new(
        _gs2,
        _client,
        namespace_name,
        metric_name,
        label_name_prefix
    )


func subscribe_label_values(
    callback: Callable,
    metric_name,
    label_name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogLabel",
        Gs2LogLabelCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_label_values(
    callback_id: int,
    metric_name,
    label_name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogLabel",
        Gs2LogLabelCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_label_values(
    metric_name,
    label_name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogLabel",
        Gs2LogLabelCache.cache_parent_key(
            null
        )
    )
func metric_model(
    name
) -> Gs2LogMetricModelDomain:
    return Gs2LogMetricModelDomain.new(
        _gs2,
        namespace_name,
        name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2LogNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2LogNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2LogGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2LogNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LogNamespace",
        Gs2LogNamespaceCache.cache_parent_key(
            null
        ),
        Gs2LogNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LogNamespace",
        Gs2LogNamespaceCache.cache_parent_key(
            null
        ),
        Gs2LogNamespaceCache.cache_key(
            namespace_name
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)