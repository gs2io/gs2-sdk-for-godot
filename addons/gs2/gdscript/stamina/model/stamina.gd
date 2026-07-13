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
class_name Gs2StaminaStamina
extends RefCounted


var stamina_id = null
var stamina_name = null
var user_id = null
var value = null
var max_value = null
var recover_interval_minutes = null
var recover_value = null
var overflow_value = null
var next_recover_at = null
var last_recovered_at = null
var created_at = null
var updated_at = null
var revision = null


func with_stamina_id(v) -> Gs2StaminaStamina:
    stamina_id = v
    return self


func with_stamina_name(v) -> Gs2StaminaStamina:
    stamina_name = v
    return self


func with_user_id(v) -> Gs2StaminaStamina:
    user_id = v
    return self


func with_value(v) -> Gs2StaminaStamina:
    value = v
    return self


func with_max_value(v) -> Gs2StaminaStamina:
    max_value = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaStamina:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaStamina:
    recover_value = v
    return self


func with_overflow_value(v) -> Gs2StaminaStamina:
    overflow_value = v
    return self


func with_next_recover_at(v) -> Gs2StaminaStamina:
    next_recover_at = v
    return self


func with_last_recovered_at(v) -> Gs2StaminaStamina:
    last_recovered_at = v
    return self


func with_created_at(v) -> Gs2StaminaStamina:
    created_at = v
    return self


func with_updated_at(v) -> Gs2StaminaStamina:
    updated_at = v
    return self


func with_revision(v) -> Gs2StaminaStamina:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):user:(?<userId>.+):stamina:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):user:(?<userId>.+):stamina:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):user:(?<userId>.+):stamina:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):user:(?<userId>.+):stamina:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_stamina_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):stamina:(?<namespaceName>.+):user:(?<userId>.+):stamina:(?<staminaName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("staminaName")


static func from_dict(data) -> Gs2StaminaStamina:
    if data == null:
        return null
    var ret = Gs2StaminaStamina.new()
    ret.stamina_id = null if data.get("staminaId") == null else str(data.get("staminaId"))
    ret.stamina_name = null if data.get("staminaName") == null else str(data.get("staminaName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.max_value = null if data.get("maxValue") == null else int(data.get("maxValue"))
    ret.recover_interval_minutes = null if data.get("recoverIntervalMinutes") == null else int(data.get("recoverIntervalMinutes"))
    ret.recover_value = null if data.get("recoverValue") == null else int(data.get("recoverValue"))
    ret.overflow_value = null if data.get("overflowValue") == null else int(data.get("overflowValue"))
    ret.next_recover_at = null if data.get("nextRecoverAt") == null else int(data.get("nextRecoverAt"))
    ret.last_recovered_at = null if data.get("lastRecoveredAt") == null else int(data.get("lastRecoveredAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["staminaId"] = stamina_id
    ret["staminaName"] = stamina_name
    ret["userId"] = user_id
    ret["value"] = value
    ret["maxValue"] = max_value
    ret["recoverIntervalMinutes"] = recover_interval_minutes
    ret["recoverValue"] = recover_value
    ret["overflowValue"] = overflow_value
    ret["nextRecoverAt"] = next_recover_at
    ret["lastRecoveredAt"] = last_recovered_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret