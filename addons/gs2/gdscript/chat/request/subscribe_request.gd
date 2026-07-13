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
class_name Gs2ChatSubscribeRequest
extends Gs2Request


var namespace_name = null
var room_name = null
var access_token = null
var notification_types = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ChatSubscribeRequest:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatSubscribeRequest:
    room_name = v
    return self


func with_access_token(v) -> Gs2ChatSubscribeRequest:
    access_token = v
    return self


func with_notification_types(v) -> Gs2ChatSubscribeRequest:
    notification_types = v
    return self


func with_duplication_avoider(v) -> Gs2ChatSubscribeRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ChatSubscribeRequest:
    if data == null:
        return null
    var ret = Gs2ChatSubscribeRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.notification_types = null if data.get("notificationTypes") == null else data.get("notificationTypes").map(func(v): return Gs2ChatNotificationType.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["roomName"] = room_name
    ret["accessToken"] = access_token
    ret["notificationTypes"] = null if notification_types == null else notification_types.map(func(v): return null if v == null else v.to_dict())
    return ret