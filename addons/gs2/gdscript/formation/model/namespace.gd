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
class_name Gs2FormationNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var update_mold_script = null
var update_form_script = null
var update_property_form_script = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2FormationNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2FormationNamespace:
    name = v
    return self


func with_description(v) -> Gs2FormationNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2FormationNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2FormationNamespace:
    transaction_setting_v2 = v
    return self


func with_update_mold_script(v) -> Gs2FormationNamespace:
    update_mold_script = v
    return self


func with_update_form_script(v) -> Gs2FormationNamespace:
    update_form_script = v
    return self


func with_update_property_form_script(v) -> Gs2FormationNamespace:
    update_property_form_script = v
    return self


func with_log_setting(v) -> Gs2FormationNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2FormationNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2FormationNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2FormationNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):formation:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2FormationNamespace:
    if data == null:
        return null
    var ret = Gs2FormationNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2FormationTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2FormationTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.update_mold_script = null if data.get("updateMoldScript") == null else Gs2FormationScriptSetting.from_dict(data.get("updateMoldScript"))
    ret.update_form_script = null if data.get("updateFormScript") == null else Gs2FormationScriptSetting.from_dict(data.get("updateFormScript"))
    ret.update_property_form_script = null if data.get("updatePropertyFormScript") == null else Gs2FormationScriptSetting.from_dict(data.get("updatePropertyFormScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2FormationLogSetting.from_dict(data.get("logSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["updateMoldScript"] = null if update_mold_script == null else update_mold_script.to_dict()
    ret["updateFormScript"] = null if update_form_script == null else update_form_script.to_dict()
    ret["updatePropertyFormScript"] = null if update_property_form_script == null else update_property_form_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret