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
class_name Gs2ChatSubscribe
extends RefCounted


var subscribe_id = null
var user_id = null
var room_name = null
var notification_types = null
var created_at = null
var revision = null


func with_subscribe_id(v) -> Gs2ChatSubscribe:
    subscribe_id = v
    return self


func with_user_id(v) -> Gs2ChatSubscribe:
    user_id = v
    return self


func with_room_name(v) -> Gs2ChatSubscribe:
    room_name = v
    return self


func with_notification_types(v) -> Gs2ChatSubscribe:
    notification_types = v
    return self


func with_created_at(v) -> Gs2ChatSubscribe:
    created_at = v
    return self


func with_revision(v) -> Gs2ChatSubscribe:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_room_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):chat:(?<namespaceName>.+):user:(?<userId>.+):subscribe:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("roomName")


static func from_dict(data) -> Gs2ChatSubscribe:
    if data == null:
        return null
    var ret = Gs2ChatSubscribe.new()
    ret.subscribe_id = null if data.get("subscribeId") == null else str(data.get("subscribeId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.room_name = null if data.get("roomName") == null else str(data.get("roomName"))
    ret.notification_types = null if data.get("notificationTypes") == null else data.get("notificationTypes").map(func(v): return Gs2ChatNotificationType.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["subscribeId"] = subscribe_id
    ret["userId"] = user_id
    ret["roomName"] = room_name
    ret["notificationTypes"] = null if notification_types == null else notification_types.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret