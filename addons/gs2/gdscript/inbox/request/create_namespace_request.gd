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
class_name Gs2InboxCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var is_automatic_deleting_enabled = null
var transaction_setting = null
var transaction_setting_v2 = null
var receive_message_script = null
var read_message_script = null
var delete_message_script = null
var receive_notification = null
var log_setting = null
var queue_namespace_id = null
var key_id = null


func with_name(v) -> Gs2InboxCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2InboxCreateNamespaceRequest:
    description = v
    return self


func with_is_automatic_deleting_enabled(v) -> Gs2InboxCreateNamespaceRequest:
    is_automatic_deleting_enabled = v
    return self


func with_transaction_setting(v) -> Gs2InboxCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2InboxCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_receive_message_script(v) -> Gs2InboxCreateNamespaceRequest:
    receive_message_script = v
    return self


func with_read_message_script(v) -> Gs2InboxCreateNamespaceRequest:
    read_message_script = v
    return self


func with_delete_message_script(v) -> Gs2InboxCreateNamespaceRequest:
    delete_message_script = v
    return self


func with_receive_notification(v) -> Gs2InboxCreateNamespaceRequest:
    receive_notification = v
    return self


func with_log_setting(v) -> Gs2InboxCreateNamespaceRequest:
    log_setting = v
    return self


func with_queue_namespace_id(v) -> Gs2InboxCreateNamespaceRequest:
    queue_namespace_id = v
    return self


func with_key_id(v) -> Gs2InboxCreateNamespaceRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2InboxCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2InboxCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.is_automatic_deleting_enabled = null if data.get("isAutomaticDeletingEnabled") == null else bool(data.get("isAutomaticDeletingEnabled"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2InboxTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2InboxTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.receive_message_script = null if data.get("receiveMessageScript") == null else Gs2InboxScriptSetting.from_dict(data.get("receiveMessageScript"))
    ret.read_message_script = null if data.get("readMessageScript") == null else Gs2InboxScriptSetting.from_dict(data.get("readMessageScript"))
    ret.delete_message_script = null if data.get("deleteMessageScript") == null else Gs2InboxScriptSetting.from_dict(data.get("deleteMessageScript"))
    ret.receive_notification = null if data.get("receiveNotification") == null else Gs2InboxNotificationSetting.from_dict(data.get("receiveNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2InboxLogSetting.from_dict(data.get("logSetting"))
    ret.queue_namespace_id = null if data.get("queueNamespaceId") == null else str(data.get("queueNamespaceId"))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["isAutomaticDeletingEnabled"] = is_automatic_deleting_enabled
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["receiveMessageScript"] = null if receive_message_script == null else receive_message_script.to_dict()
    ret["readMessageScript"] = null if read_message_script == null else read_message_script.to_dict()
    ret["deleteMessageScript"] = null if delete_message_script == null else delete_message_script.to_dict()
    ret["receiveNotification"] = null if receive_notification == null else receive_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    ret["queueNamespaceId"] = queue_namespace_id
    ret["keyId"] = key_id
    return ret