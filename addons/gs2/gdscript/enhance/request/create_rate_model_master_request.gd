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
class_name Gs2EnhanceCreateRateModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var target_inventory_model_id = null
var acquire_experience_suffix = null
var material_inventory_model_id = null
var acquire_experience_hierarchy = null
var experience_model_id = null
var bonus_rates = null


func with_namespace_name(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    metadata = v
    return self


func with_target_inventory_model_id(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    target_inventory_model_id = v
    return self


func with_acquire_experience_suffix(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    acquire_experience_suffix = v
    return self


func with_material_inventory_model_id(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    material_inventory_model_id = v
    return self


func with_acquire_experience_hierarchy(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    acquire_experience_hierarchy = v
    return self


func with_experience_model_id(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    experience_model_id = v
    return self


func with_bonus_rates(v) -> Gs2EnhanceCreateRateModelMasterRequest:
    bonus_rates = v
    return self


static func from_dict(data) -> Gs2EnhanceCreateRateModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2EnhanceCreateRateModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.target_inventory_model_id = null if data.get("targetInventoryModelId") == null else str(data.get("targetInventoryModelId"))
    ret.acquire_experience_suffix = null if data.get("acquireExperienceSuffix") == null else str(data.get("acquireExperienceSuffix"))
    ret.material_inventory_model_id = null if data.get("materialInventoryModelId") == null else str(data.get("materialInventoryModelId"))
    ret.acquire_experience_hierarchy = null if data.get("acquireExperienceHierarchy") == null else data.get("acquireExperienceHierarchy").map(func(v): return str(v))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.bonus_rates = null if data.get("bonusRates") == null else data.get("bonusRates").map(func(v): return Gs2EnhanceBonusRate.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["targetInventoryModelId"] = target_inventory_model_id
    ret["acquireExperienceSuffix"] = acquire_experience_suffix
    ret["materialInventoryModelId"] = material_inventory_model_id
    ret["acquireExperienceHierarchy"] = acquire_experience_hierarchy
    ret["experienceModelId"] = experience_model_id
    ret["bonusRates"] = null if bonus_rates == null else bonus_rates.map(func(v): return null if v == null else v.to_dict())
    return ret