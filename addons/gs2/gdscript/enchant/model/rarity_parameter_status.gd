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
class_name Gs2EnchantRarityParameterStatus
extends RefCounted


var rarity_parameter_status_id = null
var user_id = null
var parameter_name = null
var property_id = null
var parameter_values = null
var created_at = null
var updated_at = null
var revision = null


func with_rarity_parameter_status_id(v) -> Gs2EnchantRarityParameterStatus:
    rarity_parameter_status_id = v
    return self


func with_user_id(v) -> Gs2EnchantRarityParameterStatus:
    user_id = v
    return self


func with_parameter_name(v) -> Gs2EnchantRarityParameterStatus:
    parameter_name = v
    return self


func with_property_id(v) -> Gs2EnchantRarityParameterStatus:
    property_id = v
    return self


func with_parameter_values(v) -> Gs2EnchantRarityParameterStatus:
    parameter_values = v
    return self


func with_created_at(v) -> Gs2EnchantRarityParameterStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2EnchantRarityParameterStatus:
    updated_at = v
    return self


func with_revision(v) -> Gs2EnchantRarityParameterStatus:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):user:(?<userId>.+):rarity:(?<parameterName>.+):(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):user:(?<userId>.+):rarity:(?<parameterName>.+):(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):user:(?<userId>.+):rarity:(?<parameterName>.+):(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):user:(?<userId>.+):rarity:(?<parameterName>.+):(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_parameter_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):user:(?<userId>.+):rarity:(?<parameterName>.+):(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("parameterName")


static func get_property_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):user:(?<userId>.+):rarity:(?<parameterName>.+):(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("propertyId")


static func from_dict(data) -> Gs2EnchantRarityParameterStatus:
    if data == null:
        return null
    var ret = Gs2EnchantRarityParameterStatus.new()
    ret.rarity_parameter_status_id = null if data.get("rarityParameterStatusId") == null else str(data.get("rarityParameterStatusId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.parameter_values = null if data.get("parameterValues") == null else data.get("parameterValues").map(func(v): return Gs2EnchantRarityParameterValue.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rarityParameterStatusId"] = rarity_parameter_status_id
    ret["userId"] = user_id
    ret["parameterName"] = parameter_name
    ret["propertyId"] = property_id
    ret["parameterValues"] = null if parameter_values == null else parameter_values.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret