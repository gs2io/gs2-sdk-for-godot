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
class_name Gs2InboxNamespace
extends RefCounted


var namespace_id = null
var name = null
var description = null
var is_automatic_deleting_enabled = null
var transaction_setting = null
var receive_message_script = null
var read_message_script = null
var delete_message_script = null
var receive_notification = null
var log_setting = null
var created_at = null
var updated_at = null
var queue_namespace_id = null
var key_id = null
var revision = null


func with_namespace_id(v) -> Gs2InboxNamespace:
    namespace_id = v
    return self


func with_name(v) -> Gs2InboxNamespace:
    name = v
    return self


func with_description(v) -> Gs2InboxNamespace:
    description = v
    return self


func with_is_automatic_deleting_enabled(v) -> Gs2InboxNamespace:
    is_automatic_deleting_enabled = v
    return self


func with_transaction_setting(v) -> Gs2InboxNamespace:
    transaction_setting = v
    return self


func with_receive_message_script(v) -> Gs2InboxNamespace:
    receive_message_script = v
    return self


func with_read_message_script(v) -> Gs2InboxNamespace:
    read_message_script = v
    return self


func with_delete_message_script(v) -> Gs2InboxNamespace:
    delete_message_script = v
    return self


func with_receive_notification(v) -> Gs2InboxNamespace:
    receive_notification = v
    return self


func with_log_setting(v) -> Gs2InboxNamespace:
    log_setting = v
    return self


func with_created_at(v) -> Gs2InboxNamespace:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InboxNamespace:
    updated_at = v
    return self


func with_queue_namespace_id(v) -> Gs2InboxNamespace:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2InboxNamespace:
    key_id = v
    return self


func with_revision(v) -> Gs2InboxNamespace:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func from_dict(data) -> Gs2InboxNamespace:
    if data == null:
        return null
    var ret = Gs2InboxNamespace.new()
    ret.namespace_id = null if data.get("namespaceId") == null else str(data.get("namespaceId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.is_automatic_deleting_enabled = null if data.get("isAutomaticDeletingEnabled") == null else bool(data.get("isAutomaticDeletingEnabled"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2InboxTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.receive_message_script = null if data.get("receiveMessageScript") == null else Gs2InboxScriptSetting.from_dict(data.get("receiveMessageScript"))
    ret.read_message_script = null if data.get("readMessageScript") == null else Gs2InboxScriptSetting.from_dict(data.get("readMessageScript"))
    ret.delete_message_script = null if data.get("deleteMessageScript") == null else Gs2InboxScriptSetting.from_dict(data.get("deleteMessageScript"))
    ret.receive_notification = null if data.get("receiveNotification") == null else Gs2InboxNotificationSetting.from_dict(data.get("receiveNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2InboxLogSetting.from_dict(data.get("logSetting"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceId"] = namespace_id
    ret["name"] = name
    ret["description"] = description
    ret["isAutomaticDeletingEnabled"] = is_automatic_deleting_enabled
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["receiveMessageScript"] = null if receive_message_script == null else receive_message_script.to_dict()
    ret["readMessageScript"] = null if read_message_script == null else read_message_script.to_dict()
    ret["deleteMessageScript"] = null if delete_message_script == null else delete_message_script.to_dict()
    ret["receiveNotification"] = null if receive_notification == null else receive_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    ret["revision"] = revision
    return ret