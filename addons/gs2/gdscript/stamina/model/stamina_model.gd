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
class_name Gs2StaminaStaminaModel
extends RefCounted


var stamina_model_id = null
var name = null
var metadata = null
var recover_interval_minutes = null
var recover_value = null
var initial_capacity = null
var is_overflow = null
var max_capacity = null
var max_stamina_table = null
var recover_interval_table = null
var recover_value_table = null


func with_stamina_model_id(v) -> Gs2StaminaStaminaModel:
    stamina_model_id = v
    return self


func with_name(v) -> Gs2StaminaStaminaModel:
    name = v
    return self


func with_metadata(v) -> Gs2StaminaStaminaModel:
    metadata = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaStaminaModel:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaStaminaModel:
    recover_value = v
    return self


func with_initial_capacity(v) -> Gs2StaminaStaminaModel:
    initial_capacity = v
    return self


func with_is_overflow(v) -> Gs2StaminaStaminaModel:
    is_overflow = v
    return self


func with_max_capacity(v) -> Gs2StaminaStaminaModel:
    max_capacity = v
    return self


func with_max_stamina_table(v) -> Gs2StaminaStaminaModel:
    max_stamina_table = v
    return self


func with_recover_interval_table(v) -> Gs2StaminaStaminaModel:
    recover_interval_table = v
    return self


func with_recover_value_table(v) -> Gs2StaminaStaminaModel:
    recover_value_table = v
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


static func from_dict(data) -> Gs2StaminaStaminaModel:
    if data == null:
        return null
    var ret = Gs2StaminaStaminaModel.new()
    ret.stamina_model_id = null if data.get("staminaModelId") == null else str(data.get("staminaModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.recover_interval_minutes = null if data.get("recoverIntervalMinutes") == null else int(data.get("recoverIntervalMinutes"))
    ret.recover_value = null if data.get("recoverValue") == null else int(data.get("recoverValue"))
    ret.initial_capacity = null if data.get("initialCapacity") == null else int(data.get("initialCapacity"))
    ret.is_overflow = null if data.get("isOverflow") == null else bool(data.get("isOverflow"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    ret.max_stamina_table = null if data.get("maxStaminaTable") == null else Gs2StaminaMaxStaminaTable.from_dict(data.get("maxStaminaTable"))
    ret.recover_interval_table = null if data.get("recoverIntervalTable") == null else Gs2StaminaRecoverIntervalTable.from_dict(data.get("recoverIntervalTable"))
    ret.recover_value_table = null if data.get("recoverValueTable") == null else Gs2StaminaRecoverValueTable.from_dict(data.get("recoverValueTable"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["staminaModelId"] = stamina_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["recoverIntervalMinutes"] = recover_interval_minutes
    ret["recoverValue"] = recover_value
    ret["initialCapacity"] = initial_capacity
    ret["isOverflow"] = is_overflow
    ret["maxCapacity"] = max_capacity
    ret["maxStaminaTable"] = null if max_stamina_table == null else max_stamina_table.to_dict()
    ret["recoverIntervalTable"] = null if recover_interval_table == null else recover_interval_table.to_dict()
    ret["recoverValueTable"] = null if recover_value_table == null else recover_value_table.to_dict()
    return ret