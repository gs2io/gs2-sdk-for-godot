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
class_name Gs2LogQueryTimeseriesRequest
extends Gs2Request


var namespace_name = null
var begin = null
var end = null
var query = null
var group_by = null
var aggregation = null
var interval = null
var series_limit = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2LogQueryTimeseriesRequest:
    namespace_name = v
    return self


func with_begin(v) -> Gs2LogQueryTimeseriesRequest:
    begin = v
    return self


func with_end(v) -> Gs2LogQueryTimeseriesRequest:
    end = v
    return self


func with_query(v) -> Gs2LogQueryTimeseriesRequest:
    query = v
    return self


func with_group_by(v) -> Gs2LogQueryTimeseriesRequest:
    group_by = v
    return self


func with_aggregation(v) -> Gs2LogQueryTimeseriesRequest:
    aggregation = v
    return self


func with_interval(v) -> Gs2LogQueryTimeseriesRequest:
    interval = v
    return self


func with_series_limit(v) -> Gs2LogQueryTimeseriesRequest:
    series_limit = v
    return self


func with_page_token(v) -> Gs2LogQueryTimeseriesRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2LogQueryTimeseriesRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2LogQueryTimeseriesRequest:
    if data == null:
        return null
    var ret = Gs2LogQueryTimeseriesRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.begin = null if data.get("begin") == null else int(data.get("begin"))
    ret.end = null if data.get("end") == null else int(data.get("end"))
    ret.query = null if data.get("query") == null else str(data.get("query"))
    ret.group_by = null if data.get("groupBy") == null else data.get("groupBy").map(func(v): return str(v))
    ret.aggregation = null if data.get("aggregation") == null else Gs2LogAggregationConfig.from_dict(data.get("aggregation"))
    ret.interval = null if data.get("interval") == null else int(data.get("interval"))
    ret.series_limit = null if data.get("seriesLimit") == null else int(data.get("seriesLimit"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["begin"] = begin
    ret["end"] = end
    ret["query"] = query
    ret["groupBy"] = group_by
    ret["aggregation"] = null if aggregation == null else aggregation.to_dict()
    ret["interval"] = interval
    ret["seriesLimit"] = series_limit
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret