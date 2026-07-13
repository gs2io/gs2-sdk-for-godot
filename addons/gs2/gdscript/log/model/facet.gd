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
class_name Gs2LogFacet
extends RefCounted


var field = null
var values = null
var range = null
var global_range = null


func with_field(v) -> Gs2LogFacet:
    field = v
    return self


func with_values(v) -> Gs2LogFacet:
    values = v
    return self


func with_range(v) -> Gs2LogFacet:
    range = v
    return self


func with_global_range(v) -> Gs2LogFacet:
    global_range = v
    return self


static func from_dict(data) -> Gs2LogFacet:
    if data == null:
        return null
    var ret = Gs2LogFacet.new()
    ret.field = null if data.get("field") == null else str(data.get("field"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return Gs2LogFacetValueCount.from_dict(v))
    ret.range = null if data.get("range") == null else Gs2LogNumericRange.from_dict(data.get("range"))
    ret.global_range = null if data.get("globalRange") == null else Gs2LogNumericRange.from_dict(data.get("globalRange"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["field"] = field
    ret["values"] = null if values == null else values.map(func(v): return null if v == null else v.to_dict())
    ret["range"] = null if range == null else range.to_dict()
    ret["globalRange"] = null if global_range == null else global_range.to_dict()
    return ret