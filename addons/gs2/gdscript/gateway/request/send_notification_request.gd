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
class_name Gs2GatewaySendNotificationRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var subject = null
var payload = null
var enable_transfer_mobile_notification = null
var sound = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GatewaySendNotificationRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2GatewaySendNotificationRequest:
    user_id = v
    return self


func with_subject(v) -> Gs2GatewaySendNotificationRequest:
    subject = v
    return self


func with_payload(v) -> Gs2GatewaySendNotificationRequest:
    payload = v
    return self


func with_enable_transfer_mobile_notification(v) -> Gs2GatewaySendNotificationRequest:
    enable_transfer_mobile_notification = v
    return self


func with_sound(v) -> Gs2GatewaySendNotificationRequest:
    sound = v
    return self


func with_time_offset_token(v) -> Gs2GatewaySendNotificationRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2GatewaySendNotificationRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GatewaySendNotificationRequest:
    if data == null:
        return null
    var ret = Gs2GatewaySendNotificationRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.subject = null if data.get("subject") == null else str(data.get("subject"))
    ret.payload = null if data.get("payload") == null else str(data.get("payload"))
    ret.enable_transfer_mobile_notification = null if data.get("enableTransferMobileNotification") == null else bool(data.get("enableTransferMobileNotification"))
    ret.sound = null if data.get("sound") == null else str(data.get("sound"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["subject"] = subject
    ret["payload"] = payload
    ret["enableTransferMobileNotification"] = enable_transfer_mobile_notification
    ret["sound"] = sound
    ret["timeOffsetToken"] = time_offset_token
    return ret