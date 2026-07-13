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
class_name Gs2EnhanceUnleashRateModel
extends RefCounted


var unleash_rate_model_id = null
var name = null
var description = null
var metadata = null
var target_inventory_model_id = null
var grade_model_id = null
var grade_entries = null


func with_unleash_rate_model_id(v) -> Gs2EnhanceUnleashRateModel:
    unleash_rate_model_id = v
    return self


func with_name(v) -> Gs2EnhanceUnleashRateModel:
    name = v
    return self


func with_description(v) -> Gs2EnhanceUnleashRateModel:
    description = v
    return self


func with_metadata(v) -> Gs2EnhanceUnleashRateModel:
    metadata = v
    return self


func with_target_inventory_model_id(v) -> Gs2EnhanceUnleashRateModel:
    target_inventory_model_id = v
    return self


func with_grade_model_id(v) -> Gs2EnhanceUnleashRateModel:
    grade_model_id = v
    return self


func with_grade_entries(v) -> Gs2EnhanceUnleashRateModel:
    grade_entries = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):unleashRateModel:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):unleashRateModel:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):unleashRateModel:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_rate_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):unleashRateModel:(?<rateName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rateName")


static func from_dict(data) -> Gs2EnhanceUnleashRateModel:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashRateModel.new()
    ret.unleash_rate_model_id = null if data.get("unleashRateModelId") == null else str(data.get("unleashRateModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.target_inventory_model_id = null if data.get("targetInventoryModelId") == null else str(data.get("targetInventoryModelId"))
    ret.grade_model_id = null if data.get("gradeModelId") == null else str(data.get("gradeModelId"))
    ret.grade_entries = null if data.get("gradeEntries") == null else data.get("gradeEntries").map(func(v): return Gs2EnhanceUnleashRateEntryModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["unleashRateModelId"] = unleash_rate_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["targetInventoryModelId"] = target_inventory_model_id
    ret["gradeModelId"] = grade_model_id
    ret["gradeEntries"] = null if grade_entries == null else grade_entries.map(func(v): return null if v == null else v.to_dict())
    return ret