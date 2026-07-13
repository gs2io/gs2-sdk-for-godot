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
class_name Gs2ChatMessage
extends RefCounted


var message_id = null
var room_name = null
var name = null
var user_id = null
var category = null
var metadata = null
var created_at = null
var revision = null


func with_message_id(v) -> Gs2ChatMessage:
    message_id = v
    return self


func with_room_name(v) -> Gs2ChatMessage:
    room_name = v
    return self


func with_name(v) -> Gs2ChatMessage:
    name = v
    return self


func with_user_id(v) -> Gs2ChatMessage:
    user_id = v
    return self


func with_category(v) -> Gs2ChatMessage:
    category = v
    return self


func with_metadata(v) -> Gs2ChatMessage:
    metadata = v
    return self


func with_created_at(v) -> Gs2ChatMessage:
    created_at = v
    return self


func with_revision(v) -> Gs2ChatMessage:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_room_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("roomName")


static func get_message_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):room:(?<roomName>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("messageName")


static func from_dict(data) -> Gs2ChatMessage:
    if data == null:
        return null
    var ret = Gs2ChatMessage.new()
    ret.message_id = null if data.get("messageId") == null else str(data.get("messageId"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.category = null if data.get("category") == null else int(data.get("category"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["messageId"] = message_id
    ret["roomName"] = room_name
    ret["name"] = name
    ret["userId"] = user_id
    ret["category"] = category
    ret["metadata"] = metadata
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret