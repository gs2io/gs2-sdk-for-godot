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
class_name Gs2MegaFieldEzSpatial
extends RefCounted


var user_id = null
var area_model_name = null
var layer_model_name = null
var position = null
var vector = null


func with_user_id(v) -> Gs2MegaFieldEzSpatial:
    user_id = v
    return self


func with_area_model_name(v) -> Gs2MegaFieldEzSpatial:
    area_model_name = v
    return self


func with_layer_model_name(v) -> Gs2MegaFieldEzSpatial:
    layer_model_name = v
    return self


func with_position(v) -> Gs2MegaFieldEzSpatial:
    position = v
    return self


func with_vector(v) -> Gs2MegaFieldEzSpatial:
    vector = v
    return self


func to_model() -> Gs2MegaFieldSpatial:
    var ret = Gs2MegaFieldSpatial.new()
    ret.user_id = user_id
    ret.area_model_name = area_model_name
    ret.layer_model_name = layer_model_name
    ret.position = null if position == null else position.to_model()
    ret.vector = null if vector == null else vector.to_model()
    return ret


static func from_model(model) -> Gs2MegaFieldEzSpatial:
    var ret = Gs2MegaFieldEzSpatial.new()
    ret.user_id = model.user_id
    ret.area_model_name = model.area_model_name
    ret.layer_model_name = model.layer_model_name
    ret.position = null if model.position == null else Gs2MegaFieldEzPosition.from_model(model.position)
    ret.vector = null if model.vector == null else Gs2MegaFieldEzVector.from_model(model.vector)
    return ret