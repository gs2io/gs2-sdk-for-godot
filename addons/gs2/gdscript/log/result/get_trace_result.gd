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
class_name Gs2LogGetTraceResult
extends RefCounted


var trace = null
var parallels = null
var parallel_truncated = null
var metadata = null


func with_trace(v) -> Gs2LogGetTraceResult:
    trace = v
    return self


func with_parallels(v) -> Gs2LogGetTraceResult:
    parallels = v
    return self


func with_parallel_truncated(v) -> Gs2LogGetTraceResult:
    parallel_truncated = v
    return self


func with_metadata(v) -> Gs2LogGetTraceResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2LogGetTraceResult:
    if data == null:
        return null
    var ret = Gs2LogGetTraceResult.new()
    ret.trace = null if data.get("trace") == null else Gs2LogTrace.from_dict(data.get("trace"))
    ret.parallels = null if data.get("parallels") == null else data.get("parallels").map(func(v): return Gs2LogTrace.from_dict(v))
    ret.parallel_truncated = null if data.get("parallelTruncated") == null else bool(data.get("parallelTruncated"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["trace"] = null if trace == null else trace.to_dict()
    ret["parallels"] = null if parallels == null else parallels.map(func(v): return null if v == null else v.to_dict())
    ret["parallelTruncated"] = parallel_truncated
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret