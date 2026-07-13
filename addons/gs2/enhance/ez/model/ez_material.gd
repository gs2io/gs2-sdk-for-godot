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
class_name Gs2EnhanceEzMaterial
extends RefCounted


var material_item_set_id = null
var count = 0


func with_material_item_set_id(v) -> Gs2EnhanceEzMaterial:
    material_item_set_id = v
    return self


func with_count(v) -> Gs2EnhanceEzMaterial:
    count = v
    return self


func to_model() -> Gs2EnhanceMaterial:
    var ret = Gs2EnhanceMaterial.new()
    ret.material_item_set_id = material_item_set_id
    ret.count = count
    return ret


static func from_model(model) -> Gs2EnhanceEzMaterial:
    var ret = Gs2EnhanceEzMaterial.new()
    ret.material_item_set_id = model.material_item_set_id
    ret.count = 0 if model.count == null else model.count
    return ret