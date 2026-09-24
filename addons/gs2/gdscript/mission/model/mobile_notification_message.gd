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
class_name Gs2MissionMobileNotificationMessage
extends RefCounted


var locale = null
var title = null
var message = null


func with_locale(v) -> Gs2MissionMobileNotificationMessage:
    locale = v
    return self


func with_title(v) -> Gs2MissionMobileNotificationMessage:
    title = v
    return self


func with_message(v) -> Gs2MissionMobileNotificationMessage:
    message = v
    return self


static func from_dict(data) -> Gs2MissionMobileNotificationMessage:
    if data == null:
        return null
    var ret = Gs2MissionMobileNotificationMessage.new()
    ret.locale = null if data.get("locale") == null else str(data.get("locale"))
    ret.title = null if data.get("title") == null else str(data.get("title"))
    ret.message = null if data.get("message") == null else str(data.get("message"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["locale"] = locale
    ret["title"] = title
    ret["message"] = message
    return ret