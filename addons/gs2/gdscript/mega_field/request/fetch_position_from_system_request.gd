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
class_name Gs2MegaFieldFetchPositionFromSystemRequest
extends Gs2Request


var namespace_name = null
var area_model_name = null
var layer_model_name = null
var user_ids = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MegaFieldFetchPositionFromSystemRequest:
    namespace_name = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldFetchPositionFromSystemRequest:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldFetchPositionFromSystemRequest:
    layer_model_name = v
    return self


func with_user_ids(v) -> Gs2MegaFieldFetchPositionFromSystemRequest:
    user_ids = v
    return self


func with_duplication_avoider(v) -> Gs2MegaFieldFetchPositionFromSystemRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MegaFieldFetchPositionFromSystemRequest:
    if data == null:
        return null
    var ret = Gs2MegaFieldFetchPositionFromSystemRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.area_model_name = null if data.get("areaModelName") == null else str(data.get("areaModelName"))
    ret.layer_model_name = null if data.get("layerModelName") == null else str(data.get("layerModelName"))
    ret.user_ids = null if data.get("userIds") == null else data.get("userIds").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["areaModelName"] = area_model_name
    ret["layerModelName"] = layer_model_name
    ret["userIds"] = user_ids
    return ret