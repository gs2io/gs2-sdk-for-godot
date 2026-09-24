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
class_name Gs2ChatCreateNamespaceRequest
extends Gs2Request


var name = null
var description = null
var transaction_setting = null
var transaction_setting_v2 = null
var allow_create_room = null
var message_life_time_days = null
var post_message_script = null
var create_room_script = null
var delete_room_script = null
var subscribe_room_script = null
var unsubscribe_room_script = null
var post_notification = null
var log_setting = null


func with_name(v) -> Gs2ChatCreateNamespaceRequest:
    name = v
    return self


func with_description(v) -> Gs2ChatCreateNamespaceRequest:
    description = v
    return self


func with_transaction_setting(v) -> Gs2ChatCreateNamespaceRequest:
    transaction_setting = v
    return self


func with_transaction_setting_v2(v) -> Gs2ChatCreateNamespaceRequest:
    transaction_setting_v2 = v
    return self


func with_allow_create_room(v) -> Gs2ChatCreateNamespaceRequest:
    allow_create_room = v
    return self


func with_message_life_time_days(v) -> Gs2ChatCreateNamespaceRequest:
    message_life_time_days = v
    return self


func with_post_message_script(v) -> Gs2ChatCreateNamespaceRequest:
    post_message_script = v
    return self


func with_create_room_script(v) -> Gs2ChatCreateNamespaceRequest:
    create_room_script = v
    return self


func with_delete_room_script(v) -> Gs2ChatCreateNamespaceRequest:
    delete_room_script = v
    return self


func with_subscribe_room_script(v) -> Gs2ChatCreateNamespaceRequest:
    subscribe_room_script = v
    return self


func with_unsubscribe_room_script(v) -> Gs2ChatCreateNamespaceRequest:
    unsubscribe_room_script = v
    return self


func with_post_notification(v) -> Gs2ChatCreateNamespaceRequest:
    post_notification = v
    return self


func with_log_setting(v) -> Gs2ChatCreateNamespaceRequest:
    log_setting = v
    return self


static func from_dict(data) -> Gs2ChatCreateNamespaceRequest:
    if data == null:
        return null
    var ret = Gs2ChatCreateNamespaceRequest.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.transaction_setting = null if data.get("transactionSetting") == null else Gs2ChatTransactionSetting.from_dict(data.get("transactionSetting"))
    ret.transaction_setting_v2 = null if data.get("transactionSettingV2") == null else Gs2ChatTransactionSettingV2.from_dict(data.get("transactionSettingV2"))
    ret.allow_create_room = null if data.get("allowCreateRoom") == null else bool(data.get("allowCreateRoom"))
    ret.message_life_time_days = null if data.get("messageLifeTimeDays") == null else int(data.get("messageLifeTimeDays"))
    ret.post_message_script = null if data.get("postMessageScript") == null else Gs2ChatScriptSetting.from_dict(data.get("postMessageScript"))
    ret.create_room_script = null if data.get("createRoomScript") == null else Gs2ChatScriptSetting.from_dict(data.get("createRoomScript"))
    ret.delete_room_script = null if data.get("deleteRoomScript") == null else Gs2ChatScriptSetting.from_dict(data.get("deleteRoomScript"))
    ret.subscribe_room_script = null if data.get("subscribeRoomScript") == null else Gs2ChatScriptSetting.from_dict(data.get("subscribeRoomScript"))
    ret.unsubscribe_room_script = null if data.get("unsubscribeRoomScript") == null else Gs2ChatScriptSetting.from_dict(data.get("unsubscribeRoomScript"))
    ret.post_notification = null if data.get("postNotification") == null else Gs2ChatNotificationSetting.from_dict(data.get("postNotification"))
    ret.log_setting = null if data.get("logSetting") == null else Gs2ChatLogSetting.from_dict(data.get("logSetting"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["description"] = description
    ret["transactionSetting"] = null if transaction_setting == null else transaction_setting.to_dict()
    ret["transactionSettingV2"] = null if transaction_setting_v2 == null else transaction_setting_v2.to_dict()
    ret["allowCreateRoom"] = allow_create_room
    ret["messageLifeTimeDays"] = message_life_time_days
    ret["postMessageScript"] = null if post_message_script == null else post_message_script.to_dict()
    ret["createRoomScript"] = null if create_room_script == null else create_room_script.to_dict()
    ret["deleteRoomScript"] = null if delete_room_script == null else delete_room_script.to_dict()
    ret["subscribeRoomScript"] = null if subscribe_room_script == null else subscribe_room_script.to_dict()
    ret["unsubscribeRoomScript"] = null if unsubscribe_room_script == null else unsubscribe_room_script.to_dict()
    ret["postNotification"] = null if post_notification == null else post_notification.to_dict()
    ret["logSetting"] = null if log_setting == null else log_setting.to_dict()
    return ret