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
class_name Gs2ChatPostNotification
extends RefCounted


var namespace_name = null
var room_name = null
var user_id = null
var category = null
var created_at = null


func with_namespace_name(v) -> Gs2ChatPostNotification:
    namespace_name = v
    return self


func with_room_name(v) -> Gs2ChatPostNotification:
    room_name = v
    return self


func with_user_id(v) -> Gs2ChatPostNotification:
    user_id = v
    return self


func with_category(v) -> Gs2ChatPostNotification:
    category = v
    return self


func with_created_at(v) -> Gs2ChatPostNotification:
    created_at = v
    return self


static func from_dict(data) -> Gs2ChatPostNotification:
    if data == null:
        return null
    var ret = Gs2ChatPostNotification.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret