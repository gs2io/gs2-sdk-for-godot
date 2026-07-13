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
class_name Gs2ChatPostRequest
extends Gs2Request


var namespace_name = null
var room_name = null
var access_token = null
var category = null
var metadata = null
var password = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ChatPostRequest:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatPostRequest:
    room_name = v
    return self


func with_access_token(v) -> Gs2ChatPostRequest:
    access_token = v
    return self


func with_category(v) -> Gs2ChatPostRequest:
    category = v
    return self


func with_metadata(v) -> Gs2ChatPostRequest:
    metadata = v
    return self


func with_password(v) -> Gs2ChatPostRequest:
    password = v
    return self


func with_duplication_avoider(v) -> Gs2ChatPostRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ChatPostRequest:
    if data == null:
        return null
    var ret = Gs2ChatPostRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["roomName"] = room_name
    ret["accessToken"] = access_token
    ret["category"] = category
    ret["metadata"] = metadata
    ret["password"] = password
    return ret