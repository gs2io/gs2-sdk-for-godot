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
class_name Gs2GatewaySendNotificationEntry
extends RefCounted


var user_id = null
var issuer = null
var subject = null
var payload = null
var enable_transfer_mobile_notification = null
var sound = null
var mobile_notification_messages = null


func with_user_id(v) -> Gs2GatewaySendNotificationEntry:
    user_id = v
    return self


func with_issuer(v) -> Gs2GatewaySendNotificationEntry:
    issuer = v
    return self


func with_subject(v) -> Gs2GatewaySendNotificationEntry:
    subject = v
    return self


func with_payload(v) -> Gs2GatewaySendNotificationEntry:
    payload = v
    return self


func with_enable_transfer_mobile_notification(v) -> Gs2GatewaySendNotificationEntry:
    enable_transfer_mobile_notification = v
    return self


func with_sound(v) -> Gs2GatewaySendNotificationEntry:
    sound = v
    return self


func with_mobile_notification_messages(v) -> Gs2GatewaySendNotificationEntry:
    mobile_notification_messages = v
    return self


static func from_dict(data) -> Gs2GatewaySendNotificationEntry:
    if data == null:
        return null
    var ret = Gs2GatewaySendNotificationEntry.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.issuer = null if data.get("issuer") == null else str(data.get("issuer"))
    ret.subject = null if data.get("subject") == null else str(data.get("subject"))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    ret.enable_transfer_mobile_notification = null if data.get("enableTransferMobileNotification") == null else bool(data.get("enableTransferMobileNotification"))
    ret.sound = null if data.get("sound") == null else str(data.get("sound"))
    ret.mobile_notification_messages = null if data.get("mobileNotificationMessages") == null else data.get("mobileNotificationMessages").map(func(v): return Gs2GatewayMobileNotificationMessage.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["issuer"] = issuer
    ret["subject"] = subject
    ret["payload"] = payload
    ret["enableTransferMobileNotification"] = enable_transfer_mobile_notification
    ret["sound"] = sound
    ret["mobileNotificationMessages"] = null if mobile_notification_messages == null else mobile_notification_messages.map(func(v): return null if v == null else v.to_dict())
    return ret