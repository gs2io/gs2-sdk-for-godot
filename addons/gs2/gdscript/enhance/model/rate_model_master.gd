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
class_name Gs2EnhanceRateModelMaster
extends RefCounted


var rate_model_id = null
var name = null
var description = null
var metadata = null
var target_inventory_model_id = null
var acquire_experience_suffix = null
var material_inventory_model_id = null
var acquire_experience_hierarchy = null
var experience_model_id = null
var bonus_rates = null
var created_at = null
var updated_at = null
var revision = null


func with_rate_model_id(v) -> Gs2EnhanceRateModelMaster:
    rate_model_id = v
    return self


func with_name(v) -> Gs2EnhanceRateModelMaster:
    name = v
    return self


func with_description(v) -> Gs2EnhanceRateModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2EnhanceRateModelMaster:
    metadata = v
    return self


func with_target_inventory_model_id(v) -> Gs2EnhanceRateModelMaster:
    target_inventory_model_id = v
    return self


func with_acquire_experience_suffix(v) -> Gs2EnhanceRateModelMaster:
    acquire_experience_suffix = v
    return self


func with_material_inventory_model_id(v) -> Gs2EnhanceRateModelMaster:
    material_inventory_model_id = v
    return self


func with_acquire_experience_hierarchy(v) -> Gs2EnhanceRateModelMaster:
    acquire_experience_hierarchy = v
    return self


func with_experience_model_id(v) -> Gs2EnhanceRateModelMaster:
    experience_model_id = v
    return self


func with_bonus_rates(v) -> Gs2EnhanceRateModelMaster:
    bonus_rates = v
    return self


func with_created_at(v) -> Gs2EnhanceRateModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2EnhanceRateModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2EnhanceRateModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):rateModelMaster:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):rateModelMaster:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):rateModelMaster:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_rate_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):rateModelMaster:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rateName")


static func from_dict(data) -> Gs2EnhanceRateModelMaster:
    if data == null:
        return null
    var ret = Gs2EnhanceRateModelMaster.new()
    ret.rate_model_id = null if data.get("rateModelId") == null else str(data.get("rateModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.target_inventory_model_id = null if data.get("targetInventoryModelId") == null else str(data.get("targetInventoryModelId"))
    ret.acquire_experience_suffix = null if data.get("acquireExperienceSuffix") == null else str(data.get("acquireExperienceSuffix"))
    ret.material_inventory_model_id = null if data.get("materialInventoryModelId") == null else str(data.get("materialInventoryModelId"))
    ret.acquire_experience_hierarchy = null if data.get("acquireExperienceHierarchy") == null else data.get("acquireExperienceHierarchy").map(func(v): return str(v))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.bonus_rates = null if data.get("bonusRates") == null else data.get("bonusRates").map(func(v): return Gs2EnhanceBonusRate.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rateModelId"] = rate_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["targetInventoryModelId"] = target_inventory_model_id
    ret["acquireExperienceSuffix"] = acquire_experience_suffix
    ret["materialInventoryModelId"] = material_inventory_model_id
    ret["acquireExperienceHierarchy"] = acquire_experience_hierarchy
    ret["experienceModelId"] = experience_model_id
    ret["bonusRates"] = null if bonus_rates == null else bonus_rates.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret