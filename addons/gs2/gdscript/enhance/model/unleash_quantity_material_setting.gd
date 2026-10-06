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
class_name Gs2EnhanceUnleashQuantityMaterialSetting
extends RefCounted


var match_type = null
var material_inventory_model_id = null
var item_model_id = null
var count = null


func with_match_type(v) -> Gs2EnhanceUnleashQuantityMaterialSetting:
    match_type = v
    return self


func with_material_inventory_model_id(v) -> Gs2EnhanceUnleashQuantityMaterialSetting:
    material_inventory_model_id = v
    return self


func with_item_model_id(v) -> Gs2EnhanceUnleashQuantityMaterialSetting:
    item_model_id = v
    return self


func with_count(v) -> Gs2EnhanceUnleashQuantityMaterialSetting:
    count = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashQuantityMaterialSetting:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashQuantityMaterialSetting.new()
    ret.match_type = null if data.get("matchType") == null else str(data.get("matchType"))
    ret.material_inventory_model_id = null if data.get("materialInventoryModelId") == null else str(data.get("materialInventoryModelId"))
    ret.item_model_id = null if data.get("itemModelId") == null else str(data.get("itemModelId"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["matchType"] = match_type
    ret["materialInventoryModelId"] = material_inventory_model_id
    ret["itemModelId"] = item_model_id
    ret["count"] = count
    return ret