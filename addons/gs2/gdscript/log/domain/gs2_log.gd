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
class_name Gs2Log
extends RefCounted



var _gs2: Gs2Domain
var _client: Gs2LogRestClient


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2LogCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LogCreateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2LogNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func namespaces(
) -> Gs2LogDescribeNamespacesIterator:
    return Gs2LogDescribeNamespacesIterator.new(
        _gs2,
        _client
    )


func subscribe_namespaces(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogNamespace",
        Gs2LogNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogNamespace",
        Gs2LogNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogNamespace",
        Gs2LogNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2LogNamespaceDomain:
    return Gs2LogNamespaceDomain.new(
        _gs2,
        namespace_name
    )


func log(
    namespace_name,
    begin = null,
    end = null,
    query = null
) -> Gs2LogQueryLogIterator:
    return Gs2LogQueryLogIterator.new(
        _gs2,
        _client,
        namespace_name,
        begin,
        end,
        query
    )


func subscribe_log(
    callback: Callable,
    namespace_name,
    begin = null,
    end = null,
    query = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogLogEntry",
        Gs2LogLogEntryCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_log(
    callback_id: int,
    namespace_name,
    begin = null,
    end = null,
    query = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogLogEntry",
        Gs2LogLogEntryCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_log(
    namespace_name,
    begin = null,
    end = null,
    query = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogLogEntry",
        Gs2LogLogEntryCache.cache_parent_key(
            null
        )
    )


func timeseries(
    namespace_name,
    aggregation,
    begin = null,
    end = null,
    query = null,
    group_by = null,
    interval = null,
    series_limit = null
) -> Gs2LogQueryTimeseriesIterator:
    return Gs2LogQueryTimeseriesIterator.new(
        _gs2,
        _client,
        namespace_name,
        aggregation,
        begin,
        end,
        query,
        group_by,
        interval,
        series_limit
    )


func subscribe_timeseries(
    callback: Callable,
    namespace_name,
    aggregation,
    begin = null,
    end = null,
    query = null,
    group_by = null,
    interval = null,
    series_limit = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2LogTimeseriesPoint",
        Gs2LogTimeseriesPointCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_timeseries(
    callback_id: int,
    namespace_name,
    aggregation,
    begin = null,
    end = null,
    query = null,
    group_by = null,
    interval = null,
    series_limit = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2LogTimeseriesPoint",
        Gs2LogTimeseriesPointCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_timeseries(
    namespace_name,
    aggregation,
    begin = null,
    end = null,
    query = null,
    group_by = null,
    interval = null,
    series_limit = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2LogTimeseriesPoint",
        Gs2LogTimeseriesPointCache.cache_parent_key(
            null
        )
    )
func log_entry(
) -> Gs2LogLogEntryDomain:
    return Gs2LogLogEntryDomain.new(
        _gs2
    )


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    pass