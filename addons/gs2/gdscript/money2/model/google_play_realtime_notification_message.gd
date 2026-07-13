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
class_name Gs2Money2GooglePlayRealtimeNotificationMessage
extends RefCounted


var data = null
var message_id = null
var publish_time = null


func with_data(v) -> Gs2Money2GooglePlayRealtimeNotificationMessage:
    data = v
    return self


func with_message_id(v) -> Gs2Money2GooglePlayRealtimeNotificationMessage:
    message_id = v
    return self


func with_publish_time(v) -> Gs2Money2GooglePlayRealtimeNotificationMessage:
    publish_time = v
    return self


static func from_dict(data) -> Gs2Money2GooglePlayRealtimeNotificationMessage:
    if data == null:
        return null
    var ret = Gs2Money2GooglePlayRealtimeNotificationMessage.new()
    ret.data = null if data.get("data") == null else str(data.get("data"))
    ret.message_id = null if data.get("messageId") == null else str(data.get("messageId"))
    ret.publish_time = null if data.get("publishTime") == null else str(data.get("publishTime"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["data"] = data
    ret["messageId"] = message_id
    ret["publishTime"] = publish_time
    return ret