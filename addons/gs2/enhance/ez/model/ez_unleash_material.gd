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
class_name Gs2EnhanceEzUnleashMaterial
extends RefCounted


var name = null
var material_type = null
var individual_setting = null
var quantity_setting = null


func with_name(v) -> Gs2EnhanceEzUnleashMaterial:
    name = v
    return self


func with_material_type(v) -> Gs2EnhanceEzUnleashMaterial:
    material_type = v
    return self


func with_individual_setting(v) -> Gs2EnhanceEzUnleashMaterial:
    individual_setting = v
    return self


func with_quantity_setting(v) -> Gs2EnhanceEzUnleashMaterial:
    quantity_setting = v
    return self


func to_model() -> Gs2EnhanceUnleashMaterial:
    var ret = Gs2EnhanceUnleashMaterial.new()
    ret.name = name
    ret.material_type = material_type
    ret.individual_setting = null if individual_setting == null else individual_setting.to_model()
    ret.quantity_setting = null if quantity_setting == null else quantity_setting.to_model()
    return ret


static func from_model(model) -> Gs2EnhanceEzUnleashMaterial:
    var ret = Gs2EnhanceEzUnleashMaterial.new()
    ret.name = model.name
    ret.material_type = model.material_type
    ret.individual_setting = null if model.individual_setting == null else Gs2EnhanceEzUnleashIndividualMaterialSetting.from_model(model.individual_setting)
    ret.quantity_setting = null if model.quantity_setting == null else Gs2EnhanceEzUnleashQuantityMaterialSetting.from_model(model.quantity_setting)
    return ret