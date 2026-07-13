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
class_name Gs2LogTimeseriesMetadata
extends RefCounted


var keys = null
var group_by = null


func with_keys(v) -> Gs2LogTimeseriesMetadata:
    keys = v
    return self


func with_group_by(v) -> Gs2LogTimeseriesMetadata:
    group_by = v
    return self


static func from_dict(data) -> Gs2LogTimeseriesMetadata:
    if data == null:
        return null
    var ret = Gs2LogTimeseriesMetadata.new()
    ret.keys = null if data.get("keys") == null else data.get("keys").map(func(v): return str(v))
    ret.group_by = null if data.get("groupBy") == null else data.get("groupBy").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["keys"] = keys
    ret["groupBy"] = group_by
    return ret