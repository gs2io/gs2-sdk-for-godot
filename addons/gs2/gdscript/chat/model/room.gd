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
class_name Gs2ChatRoom
extends RefCounted


var room_id = null
var name = null
var user_id = null
var metadata = null
var password = null
var white_list_user_ids = null
var created_at = null
var updated_at = null
var revision = null


func with_room_id(v) -> Gs2ChatRoom:
    room_id = v
    return self


func with_name(v) -> Gs2ChatRoom:
    name = v
    return self


func with_user_id(v) -> Gs2ChatRoom:
    user_id = v
    return self


func with_metadata(v) -> Gs2ChatRoom:
    metadata = v
    return self


func with_password(v) -> Gs2ChatRoom:
    password = v
    return self


func with_white_list_user_ids(v) -> Gs2ChatRoom:
    white_list_user_ids = v
    return self


func with_created_at(v) -> Gs2ChatRoom:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ChatRoom:
    updated_at = v
    return self


func with_revision(v) -> Gs2ChatRoom:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_room_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("roomName")


static func from_dict(data) -> Gs2ChatRoom:
    if data == null:
        return null
    var ret = Gs2ChatRoom.new()
    ret.room_id = null if data.get("roomId") == null else str(data.get("roomId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.password = null if data.get("password") == null else str(data.get("password"))
    ret.white_list_user_ids = null if data.get("whiteListUserIds") == null else data.get("whiteListUserIds").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["roomId"] = room_id
    ret["name"] = name
    ret["userId"] = user_id
    ret["metadata"] = metadata
    ret["password"] = password
    ret["whiteListUserIds"] = white_list_user_ids
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret