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
class_name Gs2StaminaStaminaModelMaster
extends RefCounted


var stamina_model_id = null
var name = null
var metadata = null
var description = null
var recover_interval_minutes = null
var recover_value = null
var initial_capacity = null
var is_overflow = null
var max_capacity = null
var max_stamina_table_name = null
var recover_interval_table_name = null
var recover_value_table_name = null
var created_at = null
var updated_at = null
var revision = null


func with_stamina_model_id(v) -> Gs2StaminaStaminaModelMaster:
    stamina_model_id = v
    return self


func with_name(v) -> Gs2StaminaStaminaModelMaster:
    name = v
    return self


func with_metadata(v) -> Gs2StaminaStaminaModelMaster:
    metadata = v
    return self


func with_description(v) -> Gs2StaminaStaminaModelMaster:
    description = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaStaminaModelMaster:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaStaminaModelMaster:
    recover_value = v
    return self


func with_initial_capacity(v) -> Gs2StaminaStaminaModelMaster:
    initial_capacity = v
    return self


func with_is_overflow(v) -> Gs2StaminaStaminaModelMaster:
    is_overflow = v
    return self


func with_max_capacity(v) -> Gs2StaminaStaminaModelMaster:
    max_capacity = v
    return self


func with_max_stamina_table_name(v) -> Gs2StaminaStaminaModelMaster:
    max_stamina_table_name = v
    return self


func with_recover_interval_table_name(v) -> Gs2StaminaStaminaModelMaster:
    recover_interval_table_name = v
    return self


func with_recover_value_table_name(v) -> Gs2StaminaStaminaModelMaster:
    recover_value_table_name = v
    return self


func with_created_at(v) -> Gs2StaminaStaminaModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2StaminaStaminaModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2StaminaStaminaModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):model:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):model:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):model:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_stamina_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):model:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("staminaName")


static func from_dict(data) -> Gs2StaminaStaminaModelMaster:
    if data == null:
        return null
    var ret = Gs2StaminaStaminaModelMaster.new()
    ret.stamina_model_id = null if data.get("staminaModelId") == null else str(data.get("staminaModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.recover_interval_minutes = null if data.get("recoverIntervalMinutes") == null else int(data.get("recoverIntervalMinutes"))
    ret.recover_value = null if data.get("recoverValue") == null else int(data.get("recoverValue"))
    ret.initial_capacity = null if data.get("initialCapacity") == null else int(data.get("initialCapacity"))
    ret.is_overflow = null if data.get("isOverflow") == null else bool(data.get("isOverflow"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    ret.max_stamina_table_name = null if data.get("maxStaminaTableName") == null else str(data.get("maxStaminaTableName"))
    ret.recover_interval_table_name = null if data.get("recoverIntervalTableName") == null else str(data.get("recoverIntervalTableName"))
    ret.recover_value_table_name = null if data.get("recoverValueTableName") == null else str(data.get("recoverValueTableName"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["staminaModelId"] = stamina_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["description"] = description
    ret["recoverIntervalMinutes"] = recover_interval_minutes
    ret["recoverValue"] = recover_value
    ret["initialCapacity"] = initial_capacity
    ret["isOverflow"] = is_overflow
    ret["maxCapacity"] = max_capacity
    ret["maxStaminaTableName"] = max_stamina_table_name
    ret["recoverIntervalTableName"] = recover_interval_table_name
    ret["recoverValueTableName"] = recover_value_table_name
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret