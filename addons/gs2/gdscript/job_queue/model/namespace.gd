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
class_name Gs2JobQueueNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var enable_auto_run = null
var run_notification = null
var push_notification = null
var log_setting = null
var created_at = null
var updated_at = null
var revision = null


func with_namespace_id(v) -> Gs2JobQueueNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2JobQueueNamespace:
    name = v
    return self


func with_description(v) -> Gs2JobQueueNamespace:
    description = v
    return self


func with_transaction_setting(v) -> Gs2JobQueueNamespace:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2JobQueueNamespace:
    transaction_setting_v2 = v
    return self


func with_enable_auto_run(v) -> Gs2JobQueueNamespace:
    enable_auto_run = v
    return self


func with_run_notification(v) -> Gs2JobQueueNamespace:
    run_notification = v
    return self


func with_push_notification(v) -> Gs2JobQueueNamespace:
    push_notification = v
    return self


func with_log_setting(v) -> Gs2JobQueueNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2JobQueueNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2JobQueueNamespace:
    updated_at = v
    return self


func with_revision(v) -> Gs2JobQueueNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):queue:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2JobQueueNamespace:
    if data == null:
        return null
    var ret = Gs2JobQueueNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2JobQueueTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2JobQueueTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.enable_auto_run = null if data.get("enableAutoRun") == null else bool(data.get("enableAutoRun"))
    ret.run_notification = null if data.get("runNotification") == null else Gs2JobQueueNotificationSetting.from_dict(data.get("runNotification"))
    ret.push_notification = null if data.get("pushNotification") == null else Gs2JobQueueNotificationSetting.from_dict(data.get("pushNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2JobQueueLogSetting.from_dict(data.get("logSetting"))
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
    ret["enableAutoRun"] = enable_auto_run
    ret["runNotification"] = null if run_notification == null else run_notification.to_dict()
    ret["pushNotification"] = null if push_notification == null else push_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret