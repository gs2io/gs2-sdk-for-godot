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
class_name Gs2DatastoreNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var done_upload_script = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2DatastoreNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2DatastoreNamespace:
    name = v
    return self


func with_description(v) -> Gs2DatastoreNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2DatastoreNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2DatastoreNamespace:
    transaction_setting_v2 = v
    return self


func with_done_upload_script(v) -> Gs2DatastoreNamespace:
    done_upload_script = v
    return self


func with_log_setting(v) -> Gs2DatastoreNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2DatastoreNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2DatastoreNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2DatastoreNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):datastore:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2DatastoreNamespace:
    if data == null:
        return null
    var ret = Gs2DatastoreNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2DatastoreTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2DatastoreTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.done_upload_script = null if data.get("doneUploadScript") == null else Gs2DatastoreScriptSetting.from_dict(data.get("doneUploadScript"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2DatastoreLogSetting.from_dict(data.get("logSetting"))
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
    ret["doneUploadScript"] = null if done_upload_script == null else done_upload_script.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret