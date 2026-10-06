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
class_name Gs2EnhanceUnleashMaterial
extends RefCounted


var name = null
var material_type = null
var individual_setting = null
var quantity_setting = null


func with_name(v) -> Gs2EnhanceUnleashMaterial:
    name = v
    return self


func with_material_type(v) -> Gs2EnhanceUnleashMaterial:
    material_type = v
    return self


func with_individual_setting(v) -> Gs2EnhanceUnleashMaterial:
    individual_setting = v
    return self


func with_quantity_setting(v) -> Gs2EnhanceUnleashMaterial:
    quantity_setting = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashMaterial:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashMaterial.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.material_type = null if data.get("materialType") == null else str(data.get("materialType"))
    ret.individual_setting = null if data.get("individualSetting") == null else Gs2EnhanceUnleashIndividualMaterialSetting.from_dict(data.get("individualSetting"))
    ret.quantity_setting = null if data.get("quantitySetting") == null else Gs2EnhanceUnleashQuantityMaterialSetting.from_dict(data.get("quantitySetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["materialType"] = material_type
    ret["individualSetting"] = null if individual_setting == null else individual_setting.to_dict()
    ret["quantitySetting"] = null if quantity_setting == null else quantity_setting.to_dict()
    return ret