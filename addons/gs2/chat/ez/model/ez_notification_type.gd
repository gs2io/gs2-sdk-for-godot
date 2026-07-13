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
class_name Gs2ChatEzNotificationType
extends RefCounted


var category = 0
var enable_transfer_mobile_push_notification = false


func with_category(v) -> Gs2ChatEzNotificationType:
    category = v
    return self


func with_enable_transfer_mobile_push_notification(v) -> Gs2ChatEzNotificationType:
    enable_transfer_mobile_push_notification = v
    return self


func to_model() -> Gs2ChatNotificationType:
    var ret = Gs2ChatNotificationType.new()
    ret.category = category
    ret.enable_transfer_mobile_push_notification = enable_transfer_mobile_push_notification
    return ret


static func from_model(model) -> Gs2ChatEzNotificationType:
    var ret = Gs2ChatEzNotificationType.new()
    ret.category = 0 if model.category == null else model.category
    ret.enable_transfer_mobile_push_notification = false if model.enable_transfer_mobile_push_notification == null else model.enable_transfer_mobile_push_notification
    return ret