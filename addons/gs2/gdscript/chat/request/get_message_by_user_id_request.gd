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
class_name Gs2ChatGetMessageByUserIdRequest
extends Gs2Request


var namespace_name = null
var room_name = null
var message_name = null
var password = null
var user_id = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2ChatGetMessageByUserIdRequest:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatGetMessageByUserIdRequest:
    room_name = v
    return self


func with_message_name(v) -> Gs2ChatGetMessageByUserIdRequest:
    message_name = v
    return self


func with_password(v) -> Gs2ChatGetMessageByUserIdRequest:
    password = v
    return self


func with_user_id(v) -> Gs2ChatGetMessageByUserIdRequest:
    user_id = v
    return self


func with_time_offset_token(v) -> Gs2ChatGetMessageByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2ChatGetMessageByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ChatGetMessageByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.message_name = null if data.get("messageName") == null else str(data.get("messageName"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["roomName"] = room_name
    ret["messageName"] = message_name
    ret["password"] = password
    ret["userId"] = user_id
    ret["timeOffsetToken"] = time_offset_token
    return ret