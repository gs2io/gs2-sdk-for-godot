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
class_name Gs2EnhanceEzUnleashQuantityMaterialSetting
extends RefCounted


var match_type = null
var material_inventory_model_id = null
var item_model_id = null
var count = 0


func with_match_type(v) -> Gs2EnhanceEzUnleashQuantityMaterialSetting:
    match_type = v
    return self


func with_material_inventory_model_id(v) -> Gs2EnhanceEzUnleashQuantityMaterialSetting:
    material_inventory_model_id = v
    return self


func with_item_model_id(v) -> Gs2EnhanceEzUnleashQuantityMaterialSetting:
    item_model_id = v
    return self


func with_count(v) -> Gs2EnhanceEzUnleashQuantityMaterialSetting:
    count = v
    return self


func to_model() -> Gs2EnhanceUnleashQuantityMaterialSetting:
    var ret = Gs2EnhanceUnleashQuantityMaterialSetting.new()
    ret.match_type = match_type
    ret.material_inventory_model_id = material_inventory_model_id
    ret.item_model_id = item_model_id
    ret.count = count
    return ret


static func from_model(model) -> Gs2EnhanceEzUnleashQuantityMaterialSetting:
    var ret = Gs2EnhanceEzUnleashQuantityMaterialSetting.new()
    ret.match_type = model.match_type
    ret.material_inventory_model_id = model.material_inventory_model_id
    ret.item_model_id = model.item_model_id
    ret.count = 0 if model.count == null else model.count
    return ret