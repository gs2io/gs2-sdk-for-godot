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
class_name Gs2ChatNotificationType
extends RefCounted


var category = null
var enable_transfer_mobile_push_notification = null


func with_category(v) -> Gs2ChatNotificationType:
    category = v
    return self


func with_enable_transfer_mobile_push_notification(v) -> Gs2ChatNotificationType:
    enable_transfer_mobile_push_notification = v
    return self


static func from_dict(data) -> Gs2ChatNotificationType:
    if data == null:
        return null
    var ret = Gs2ChatNotificationType.new()
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.enable_transfer_mobile_push_notification = null if data.get("enableTransferMobilePushNotification") == null else bool(data.get("enableTransferMobilePushNotification"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["category"] = category
    ret["enableTransferMobilePushNotification"] = enable_transfer_mobile_push_notification
    return ret