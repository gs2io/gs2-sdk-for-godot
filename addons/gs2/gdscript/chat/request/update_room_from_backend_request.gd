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
class_name Gs2ChatUpdateRoomFromBackendRequest
extends Gs2Request


var namespace_name = null
var room_name = null
var metadata = null
var password = null
var white_list_user_ids = null
var user_id = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    room_name = v
    return self


func with_metadata(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    metadata = v
    return self


func with_password(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    password = v
    return self


func with_white_list_user_ids(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    white_list_user_ids = v
    return self


func with_user_id(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    user_id = v
    return self


func with_time_offset_token(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ChatUpdateRoomFromBackendRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ChatUpdateRoomFromBackendRequest:
    if data == null:
        return null
    var ret = Gs2ChatUpdateRoomFromBackendRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.white_list_user_ids = null if data.get("whiteListUserIds") == null else data.get("whiteListUserIds").map(func(v): return str(v))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["roomName"] = room_name
    ret["metadata"] = metadata
    ret["password"] = password
    ret["whiteListUserIds"] = white_list_user_ids
    ret["userId"] = user_id
    ret["timeOffsetToken"] = time_offset_token
    return ret