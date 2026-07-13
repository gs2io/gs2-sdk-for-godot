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
class_name Gs2StaminaMaxStaminaTableMaster
extends RefCounted


var max_stamina_table_id = null
var name = null
var metadata = null
var description = null
var experience_model_id = null
var values = null
var created_at = null
var updated_at = null
var revision = null


func with_max_stamina_table_id(v) -> Gs2StaminaMaxStaminaTableMaster:
    max_stamina_table_id = v
    return self


func with_name(v) -> Gs2StaminaMaxStaminaTableMaster:
    name = v
    return self


func with_metadata(v) -> Gs2StaminaMaxStaminaTableMaster:
    metadata = v
    return self


func with_description(v) -> Gs2StaminaMaxStaminaTableMaster:
    description = v
    return self


func with_experience_model_id(v) -> Gs2StaminaMaxStaminaTableMaster:
    experience_model_id = v
    return self


func with_values(v) -> Gs2StaminaMaxStaminaTableMaster:
    values = v
    return self


func with_created_at(v) -> Gs2StaminaMaxStaminaTableMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2StaminaMaxStaminaTableMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2StaminaMaxStaminaTableMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):maxStaminaTable:(?<maxStaminaTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):maxStaminaTable:(?<maxStaminaTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):maxStaminaTable:(?<maxStaminaTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_max_stamina_table_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):maxStaminaTable:(?<maxStaminaTableName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("maxStaminaTableName")


static func from_dict(data) -> Gs2StaminaMaxStaminaTableMaster:
    if data == null:
        return null
    var ret = Gs2StaminaMaxStaminaTableMaster.new()
    ret.max_stamina_table_id = null if data.get("maxStaminaTableId") == null else str(data.get("maxStaminaTableId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return int(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["maxStaminaTableId"] = max_stamina_table_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["description"] = description
    ret["experienceModelId"] = experience_model_id
    ret["values"] = values
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret