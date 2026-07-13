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
class_name Gs2ChatCreateRoomRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var name = null
var metadata = null
var password = null
var white_list_user_ids = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ChatCreateRoomRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2ChatCreateRoomRequest:
    access_token = v
    return self


func with_name(v) -> Gs2ChatCreateRoomRequest:
    name = v
    return self


func with_metadata(v) -> Gs2ChatCreateRoomRequest:
    metadata = v
    return self


func with_password(v) -> Gs2ChatCreateRoomRequest:
    password = v
    return self


func with_white_list_user_ids(v) -> Gs2ChatCreateRoomRequest:
    white_list_user_ids = v
    return self


func with_duplication_avoider(v) -> Gs2ChatCreateRoomRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ChatCreateRoomRequest:
    if data == null:
        return null
    var ret = Gs2ChatCreateRoomRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.white_list_user_ids = null if data.get("whiteListUserIds") == null else data.get("whiteListUserIds").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["name"] = name
    ret["metadata"] = metadata
    ret["password"] = password
    ret["whiteListUserIds"] = white_list_user_ids
    return ret