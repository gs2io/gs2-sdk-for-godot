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
class_name Gs2MegaFieldActionRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var area_model_name = null
var layer_model_name = null
var position = null
var scopes = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MegaFieldActionRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2MegaFieldActionRequest:
    access_token = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldActionRequest:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldActionRequest:
    layer_model_name = v
    return self


func with_position(v) -> Gs2MegaFieldActionRequest:
    position = v
    return self


func with_scopes(v) -> Gs2MegaFieldActionRequest:
    scopes = v
    return self


func with_duplication_avoider(v) -> Gs2MegaFieldActionRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MegaFieldActionRequest:
    if data == null:
        return null
    var ret = Gs2MegaFieldActionRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.area_model_name = null if data.get("areaModelName") == null else str(data.get("areaModelName"))
    ret.layer_model_name = null if data.get("layerModelName") == null else str(data.get("layerModelName"))
    ret.position = null if data.get("position") == null else Gs2MegaFieldMyPosition.from_dict(data.get("position"))
    ret.scopes = null if data.get("scopes") == null else data.get("scopes").map(func(v): return Gs2MegaFieldScope.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["areaModelName"] = area_model_name
    ret["layerModelName"] = layer_model_name
    ret["position"] = null if position == null else position.to_dict()
    ret["scopes"] = null if scopes == null else scopes.map(func(v): return null if v == null else v.to_dict())
    return ret