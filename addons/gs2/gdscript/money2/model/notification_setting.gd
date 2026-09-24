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
class_name Gs2Money2NotificationSetting
extends RefCounted


var gateway_namespace_id = null
var enable_transfer_mobile_notification = null
var sound = null
var mobile_notification_messages = null
var enable = null


func with_gateway_namespace_id(v) -> Gs2Money2NotificationSetting:
    gateway_namespace_id = v
    return self


func with_enable_transfer_mobile_notification(v) -> Gs2Money2NotificationSetting:
    enable_transfer_mobile_notification = v
    return self


func with_sound(v) -> Gs2Money2NotificationSetting:
    sound = v
    return self


func with_mobile_notification_messages(v) -> Gs2Money2NotificationSetting:
    mobile_notification_messages = v
    return self


func with_enable(v) -> Gs2Money2NotificationSetting:
    enable = v
    return self


static func from_dict(data) -> Gs2Money2NotificationSetting:
    if data == null:
        return null
    var ret = Gs2Money2NotificationSetting.new()
    ret.gateway_namespace_id = null if data.get("gatewayNamespaceId") == null else str(data.get("gatewayNamespaceId"))
    ret.enable_transfer_mobile_notification = null if data.get("enableTransferMobileNotification") == null else bool(data.get("enableTransferMobileNotification"))
    ret.sound = null if data.get("sound") == null else str(data.get("sound"))
    ret.mobile_notification_messages = null if data.get("mobileNotificationMessages") == null else data.get("mobileNotificationMessages").map(func(v): return Gs2Money2MobileNotificationMessage.from_dict(v))
    ret.enable = null if data.get("enable") == null else str(data.get("enable"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["gatewayNamespaceId"] = gateway_namespace_id
    ret["enableTransferMobileNotification"] = enable_transfer_mobile_notification
    ret["sound"] = sound
    ret["mobileNotificationMessages"] = null if mobile_notification_messages == null else mobile_notification_messages.map(func(v): return null if v == null else v.to_dict())
    ret["enable"] = enable
    return ret