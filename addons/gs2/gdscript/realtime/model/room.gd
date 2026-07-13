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
class_name Gs2RealtimeRoom
extends RefCounted


var room_id = null
var name = null
var ip_address = null
var port = null
var encryption_key = null
var notification_user_ids = null
var created_at = null
var updated_at = null
var revision = null


func with_room_id(v) -> Gs2RealtimeRoom:
    room_id = v
    return self


func with_name(v) -> Gs2RealtimeRoom:
    name = v
    return self


func with_ip_address(v) -> Gs2RealtimeRoom:
    ip_address = v
    return self


func with_port(v) -> Gs2RealtimeRoom:
    port = v
    return self


func with_encryption_key(v) -> Gs2RealtimeRoom:
    encryption_key = v
    return self


func with_notification_user_ids(v) -> Gs2RealtimeRoom:
    notification_user_ids = v
    return self


func with_created_at(v) -> Gs2RealtimeRoom:
    created_at = v
    return self


func with_updated_at(v) -> Gs2RealtimeRoom:
    updated_at = v
    return self


func with_revision(v) -> Gs2RealtimeRoom:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):realtime:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):realtime:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):realtime:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_room_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):realtime:(?<namespaceName>.+):room:(?<roomName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("roomName")


static func from_dict(data) -> Gs2RealtimeRoom:
    if data == null:
        return null
    var ret = Gs2RealtimeRoom.new()
    ret.room_id = null if data.get("roomId") == null else str(data.get("roomId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.ip_address = null if data.get("ipAddress") == null else str(data.get("ipAddress"))
    ret.port = null if data.get("port") == null else int(data.get("port"))
    ret.encryption_key = null if data.get("encryptionKey") == null else str(data.get("encryptionKey"))
    ret.notification_user_ids = null if data.get("notificationUserIds") == null else data.get("notificationUserIds").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["roomId"] = room_id
    ret["name"] = name
    ret["ipAddress"] = ip_address
    ret["port"] = port
    ret["encryptionKey"] = encryption_key
    ret["notificationUserIds"] = notification_user_ids
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret