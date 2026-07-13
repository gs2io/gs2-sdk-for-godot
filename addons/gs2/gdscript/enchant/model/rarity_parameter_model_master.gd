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
class_name Gs2EnchantRarityParameterModelMaster
extends RefCounted


var rarity_parameter_model_id = null
var name = null
var description = null
var metadata = null
var maximum_parameter_count = null
var parameter_counts = null
var parameters = null
var created_at = null
var updated_at = null
var revision = null


func with_rarity_parameter_model_id(v) -> Gs2EnchantRarityParameterModelMaster:
    rarity_parameter_model_id = v
    return self


func with_name(v) -> Gs2EnchantRarityParameterModelMaster:
    name = v
    return self


func with_description(v) -> Gs2EnchantRarityParameterModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2EnchantRarityParameterModelMaster:
    metadata = v
    return self


func with_maximum_parameter_count(v) -> Gs2EnchantRarityParameterModelMaster:
    maximum_parameter_count = v
    return self


func with_parameter_counts(v) -> Gs2EnchantRarityParameterModelMaster:
    parameter_counts = v
    return self


func with_parameters(v) -> Gs2EnchantRarityParameterModelMaster:
    parameters = v
    return self


func with_created_at(v) -> Gs2EnchantRarityParameterModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2EnchantRarityParameterModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2EnchantRarityParameterModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:rarity:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:rarity:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:rarity:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_parameter_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:rarity:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("parameterName")


static func from_dict(data) -> Gs2EnchantRarityParameterModelMaster:
    if data == null:
        return null
    var ret = Gs2EnchantRarityParameterModelMaster.new()
    ret.rarity_parameter_model_id = null if data.get("rarityParameterModelId") == null else str(data.get("rarityParameterModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.maximum_parameter_count = null if data.get("maximumParameterCount") == null else int(data.get("maximumParameterCount"))
    ret.parameter_counts = null if data.get("parameterCounts") == null else data.get("parameterCounts").map(func(v): return Gs2EnchantRarityParameterCountModel.from_dict(v))
    ret.parameters = null if data.get("parameters") == null else data.get("parameters").map(func(v): return Gs2EnchantRarityParameterValueModel.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rarityParameterModelId"] = rarity_parameter_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["maximumParameterCount"] = maximum_parameter_count
    ret["parameterCounts"] = null if parameter_counts == null else parameter_counts.map(func(v): return null if v == null else v.to_dict())
    ret["parameters"] = null if parameters == null else parameters.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret