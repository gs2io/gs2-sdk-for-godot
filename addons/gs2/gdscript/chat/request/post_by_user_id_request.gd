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
class_name Gs2ChatPostByUserIdRequest
extends Gs2Request


var namespace_name = null
var room_name = null
var user_id = null
var category = null
var metadata = null
var password = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ChatPostByUserIdRequest:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatPostByUserIdRequest:
    room_name = v
    return self


func with_user_id(v) -> Gs2ChatPostByUserIdRequest:
    user_id = v
    return self


func with_category(v) -> Gs2ChatPostByUserIdRequest:
    category = v
    return self


func with_metadata(v) -> Gs2ChatPostByUserIdRequest:
    metadata = v
    return self


func with_password(v) -> Gs2ChatPostByUserIdRequest:
    password = v
    return self


func with_time_offset_token(v) -> Gs2ChatPostByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ChatPostByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ChatPostByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ChatPostByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["roomName"] = room_name
    ret["userId"] = user_id
    ret["category"] = category
    ret["metadata"] = metadata
    ret["password"] = password
    ret["timeOffsetToken"] = time_offset_token
    return ret