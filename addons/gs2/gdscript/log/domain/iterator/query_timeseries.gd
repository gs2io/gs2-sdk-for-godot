
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
class_name Gs2LogQueryTimeseriesIterator
extends RefCounted


static var fetch_size: Variant = null

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var namespace_name: Variant = null
var begin: Variant = null
var end: Variant = null
var query: Variant = null
var group_by: Variant = null
var aggregation: Variant = null
var interval: Variant = null
var series_limit: Variant = null
var _page_token: Variant = null
var _last: bool = false


func _init(
    gs2: Gs2Domain,
    client,
    namespace_name_,
    aggregation_,
    begin_ = null,
    end_ = null,
    query_ = null,
    group_by_ = null,
    interval_ = null,
    series_limit_ = null
):
    _gs2 = gs2
    _client = client
    namespace_name = namespace_name_
    begin = begin_
    end = end_
    query = query_
    group_by = group_by_
    aggregation = aggregation_
    interval = interval_
    series_limit = series_limit_
    _last = false


func load() -> Gs2AsyncResult:
    var result = []
    _page_token = null
    _last = false
    var cached = _gs2.cache.try_get_list(
        "Gs2LogTimeseriesPoint",
        
        Gs2LogTimeseriesPointCache.cache_parent_key(
            null
        )
    )
    if cached[1]:
        var list = []
        for item in cached[0]:
            if not (namespace_name == null or item.namespace_name == namespace_name):
                continue
            if not (begin == null or item.timestamp >= begin):
                continue
            if not (end == null or item.timestamp <= end):
                continue
            if not (query == null or item.query == query):
                continue
            if not (group_by == null or item.group_by == group_by):
                continue
            if not (aggregation == null or item.aggregation == aggregation):
                continue
            if not (interval == null or item.interval == interval):
                continue
            if not (series_limit == null or item.series_limit == series_limit):
                continue
            list.append(item)
        return Gs2AsyncResult.new(list, null)
    while not _last:
        var request = Gs2LogQueryTimeseriesRequest.new()
        request = request.with_context_stack(_gs2.default_context_stack)
        request = request.with_namespace_name(namespace_name)
        request = request.with_begin(begin)
        request = request.with_end(end)
        request = request.with_aggregation(aggregation)
        request = request.with_interval(interval)
        request = request.with_series_limit(series_limit)
        request = request.with_page_token(_page_token)
        request = request.with_limit(fetch_size)
        var r = await _client.query_timeseries(request)
        if r.error != null:
            return r
        var page = []
        for item in (r.result.items if r.result.items != null else []):
            if not (namespace_name == null or item.namespace_name == namespace_name):
                continue
            if not (begin == null or item.timestamp >= begin):
                continue
            if not (end == null or item.timestamp <= end):
                continue
            if not (query == null or item.query == query):
                continue
            if not (group_by == null or item.group_by == group_by):
                continue
            if not (aggregation == null or item.aggregation == aggregation):
                continue
            if not (interval == null or item.interval == interval):
                continue
            if not (series_limit == null or item.series_limit == series_limit):
                continue
            page.append(item)
        result.append_array(page)
        _page_token = r.result.next_page_token
        _last = _page_token == null
        Gs2LogQueryTimeseriesMethodCache.put_cache(
            r.result,
            _gs2.cache,
            null,
            null,
            request
        )
    _gs2.cache.set_list_cached(
        "Gs2LogTimeseriesPoint",
        
        Gs2LogTimeseriesPointCache.cache_parent_key(
            null
        )
    )
    return Gs2AsyncResult.new(result, null)