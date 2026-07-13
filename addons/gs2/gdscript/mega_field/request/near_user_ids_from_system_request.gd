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
class_name Gs2MegaFieldNearUserIdsFromSystemRequest
extends Gs2Request


var namespace_name = null
var area_model_name = null
var layer_model_name = null
var point = null
var r = null
var limit = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    namespace_name = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    layer_model_name = v
    return self


func with_point(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    point = v
    return self


func with_r(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    r = v
    return self


func with_limit(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    limit = v
    return self


func with_duplication_avoider(v) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MegaFieldNearUserIdsFromSystemRequest:
    if data == null:
        return null
    var ret = Gs2MegaFieldNearUserIdsFromSystemRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.area_model_name = null if data.get("areaModelName") == null else str(data.get("areaModelName"))
    ret.layer_model_name = null if data.get("layerModelName") == null else str(data.get("layerModelName"))
    ret.point = null if data.get("point") == null else Gs2MegaFieldPosition.from_dict(data.get("point"))
    ret.r = null if data.get("r") == null else float(data.get("r"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["areaModelName"] = area_model_name
    ret["layerModelName"] = layer_model_name
    ret["point"] = null if point == null else point.to_dict()
    ret["r"] = r
    ret["limit"] = limit
    return ret