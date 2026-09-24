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
class_name Gs2DictionaryNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var entry_script = null
var duplicate_entry_script = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2DictionaryNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2DictionaryNamespace:
    name = v
    return self


func with_description(v) -> Gs2DictionaryNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2DictionaryNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2DictionaryNamespace:
    transaction_setting_v2 = v
    return self


func with_entry_script(v) -> Gs2DictionaryNamespace:
    entry_script = v
    return self


func with_duplicate_entry_script(v) -> Gs2DictionaryNamespace:
    duplicate_entry_script = v
    return self


func with_log_setting(v) -> Gs2DictionaryNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2DictionaryNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2DictionaryNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2DictionaryNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):dictionary:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2DictionaryNamespace:
    if data == null:
        return null
    var ret = Gs2DictionaryNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2DictionaryTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2DictionaryTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.entry_script = null if data.get("entryScript") == null else Gs2DictionaryScriptSetting.from_dict(data.get("entryScript"))
    ret.duplicate_entry_script = null if data.get("duplicateEntryScript") == null else str(data.get("duplicateEntryScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2DictionaryLogSetting.from_dict(data.get("logSetting"))
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
    ret["entryScript"] = null if entry_script == null else entry_script.to_dict()
    ret["duplicateEntryScript"] = duplicate_entry_script
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret