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
class_name Gs2LogTrace
extends RefCounted


var trace_id = null
var spans = null
var truncated = null


func with_trace_id(v) -> Gs2LogTrace:
    trace_id = v
    return self


func with_spans(v) -> Gs2LogTrace:
    spans = v
    return self


func with_truncated(v) -> Gs2LogTrace:
    truncated = v
    return self


static func from_dict(data) -> Gs2LogTrace:
    if data == null:
        return null
    var ret = Gs2LogTrace.new()
    ret.trace_id = null if data.get("traceId") == null else str(data.get("traceId"))
    ret.spans = null if data.get("spans") == null else data.get("spans").map(func(v): return Gs2LogLogEntry.from_dict(v))
    ret.truncated = null if data.get("truncated") == null else bool(data.get("truncated"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["traceId"] = trace_id
    ret["spans"] = null if spans == null else spans.map(func(v): return null if v == null else v.to_dict())
    ret["truncated"] = truncated
    return ret