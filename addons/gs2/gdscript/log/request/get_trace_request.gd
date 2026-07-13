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
class_name Gs2LogGetTraceRequest
extends Gs2Request


var namespace_name = null
var trace_id = null
var begin = null
var end = null


func with_namespace_name(v) -> Gs2LogGetTraceRequest:
    namespace_name = v
    return self


func with_trace_id(v) -> Gs2LogGetTraceRequest:
    trace_id = v
    return self


func with_begin(v) -> Gs2LogGetTraceRequest:
    begin = v
    return self


func with_end(v) -> Gs2LogGetTraceRequest:
    end = v
    return self


static func from_dict(data) -> Gs2LogGetTraceRequest:
    if data == null:
        return null
    var ret = Gs2LogGetTraceRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.trace_id = null if data.get("traceId") == null else str(data.get("traceId"))
    ret.begin = null if data.get("begin") == null else int(data.get("begin"))
    ret.end = null if data.get("end") == null else int(data.get("end"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["traceId"] = trace_id
    ret["begin"] = begin
    ret["end"] = end
    return ret