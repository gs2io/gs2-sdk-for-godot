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
class_name Gs2LogTimeseriesPoint
extends RefCounted


var timestamp = null
var values = null


func with_timestamp(v) -> Gs2LogTimeseriesPoint:
    timestamp = v
    return self


func with_values(v) -> Gs2LogTimeseriesPoint:
    values = v
    return self


static func from_dict(data) -> Gs2LogTimeseriesPoint:
    if data == null:
        return null
    var ret = Gs2LogTimeseriesPoint.new()
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return Gs2LogTimeseriesValue.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["timestamp"] = timestamp
    ret["values"] = null if values == null else values.map(func(v): return null if v == null else v.to_dict())
    return ret