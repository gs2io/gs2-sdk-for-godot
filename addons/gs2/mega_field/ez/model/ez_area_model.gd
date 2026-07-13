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
class_name Gs2MegaFieldEzAreaModel
extends RefCounted


var name = null
var metadata = null
var layer_models = []


func with_name(v) -> Gs2MegaFieldEzAreaModel:
    name = v
    return self


func with_metadata(v) -> Gs2MegaFieldEzAreaModel:
    metadata = v
    return self


func with_layer_models(v) -> Gs2MegaFieldEzAreaModel:
    layer_models = v
    return self


func to_model() -> Gs2MegaFieldAreaModel:
    var ret = Gs2MegaFieldAreaModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.layer_models = null if layer_models == null else layer_models.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2MegaFieldEzAreaModel:
    var ret = Gs2MegaFieldEzAreaModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.layer_models = [] if model.layer_models == null else model.layer_models.map(func(v): return Gs2MegaFieldEzLayerModel.from_model(v))
    return ret