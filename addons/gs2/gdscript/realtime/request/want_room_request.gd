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
class_name Gs2RealtimeWantRoomRequest
extends Gs2Request


var namespace_name = null
var name = null
var notification_user_ids = null


func with_namespace_name(v) -> Gs2RealtimeWantRoomRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2RealtimeWantRoomRequest:
    name = v
    return self


func with_notification_user_ids(v) -> Gs2RealtimeWantRoomRequest:
    notification_user_ids = v
    return self


static func from_dict(data) -> Gs2RealtimeWantRoomRequest:
    if data == null:
        return null
    var ret = Gs2RealtimeWantRoomRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.notification_user_ids = null if data.get("notificationUserIds") == null else data.get("notificationUserIds").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["notificationUserIds"] = notification_user_ids
    return ret