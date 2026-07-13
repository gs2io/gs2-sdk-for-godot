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
class_name Gs2LogQueryMetricsTimeseriesRequest
extends Gs2Request


var namespace_name = null
var begin = null
var end = null
var query = null
var group_by = null
var aggregations = null
var interval = null
var series_limit = null
var order_key = null
var order_by = null


func with_namespace_name(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    namespace_name = v
    return self


func with_begin(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    begin = v
    return self


func with_end(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    end = v
    return self


func with_query(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    query = v
    return self


func with_group_by(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    group_by = v
    return self


func with_aggregations(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    aggregations = v
    return self


func with_interval(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    interval = v
    return self


func with_series_limit(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    series_limit = v
    return self


func with_order_key(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    order_key = v
    return self


func with_order_by(v) -> Gs2LogQueryMetricsTimeseriesRequest:
    order_by = v
    return self


static func from_dict(data) -> Gs2LogQueryMetricsTimeseriesRequest:
    if data == null:
        return null
    var ret = Gs2LogQueryMetricsTimeseriesRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.begin = null if data.get("begin") == null else int(data.get("begin"))
    ret.end = null if data.get("end") == null else int(data.get("end"))
    ret.query = null if data.get("query") == null else str(data.get("query"))
    ret.group_by = null if data.get("groupBy") == null else data.get("groupBy").map(func(v): return str(v))
    ret.aggregations = null if data.get("aggregations") == null else data.get("aggregations").map(func(v): return Gs2LogAggregationConfig.from_dict(v))
    ret.interval = null if data.get("interval") == null else int(data.get("interval"))
    ret.series_limit = null if data.get("seriesLimit") == null else int(data.get("seriesLimit"))
    ret.order_key = null if data.get("orderKey") == null else str(data.get("orderKey"))
    ret.order_by = null if data.get("orderBy") == null else str(data.get("orderBy"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["begin"] = begin
    ret["end"] = end
    ret["query"] = query
    ret["groupBy"] = group_by
    ret["aggregations"] = null if aggregations == null else aggregations.map(func(v): return null if v == null else v.to_dict())
    ret["interval"] = interval
    ret["seriesLimit"] = series_limit
    ret["orderKey"] = order_key
    ret["orderBy"] = order_by
    return ret