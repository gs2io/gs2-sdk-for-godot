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
class_name Gs2MegaFieldActionByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var area_model_name = null
var layer_model_name = null
var position = null
var scopes = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MegaFieldActionByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2MegaFieldActionByUserIdRequest:
    user_id = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldActionByUserIdRequest:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldActionByUserIdRequest:
    layer_model_name = v
    return self


func with_position(v) -> Gs2MegaFieldActionByUserIdRequest:
    position = v
    return self


func with_scopes(v) -> Gs2MegaFieldActionByUserIdRequest:
    scopes = v
    return self


func with_time_offset_token(v) -> Gs2MegaFieldActionByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2MegaFieldActionByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MegaFieldActionByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MegaFieldActionByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.area_model_name = null if data.get("areaModelName") == null else str(data.get("areaModelName"))
    ret.layer_model_name = null if data.get("layerModelName") == null else str(data.get("layerModelName"))
    ret.position = null if data.get("position") == null else Gs2MegaFieldMyPosition.from_dict(data.get("position"))
    ret.scopes = null if data.get("scopes") == null else data.get("scopes").map(func(v): return Gs2MegaFieldScope.from_dict(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["areaModelName"] = area_model_name
    ret["layerModelName"] = layer_model_name
    ret["position"] = null if position == null else position.to_dict()
    ret["scopes"] = null if scopes == null else scopes.map(func(v): return null if v == null else v.to_dict())
    ret["timeOffsetToken"] = time_offset_token
    return ret