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
class_name Gs2InboxMessage
extends RefCounted


var message_id = null
var name = null
var user_id = null
var metadata = null
var is_read = null
var read_acquire_actions = null
var received_at = null
var read_at = null
var expires_at = null
var revision = null


func with_message_id(v) -> Gs2InboxMessage:
    message_id = v
    return self


func with_name(v) -> Gs2InboxMessage:
    name = v
    return self


func with_user_id(v) -> Gs2InboxMessage:
    user_id = v
    return self


func with_metadata(v) -> Gs2InboxMessage:
    metadata = v
    return self


func with_is_read(v) -> Gs2InboxMessage:
    is_read = v
    return self


func with_read_acquire_actions(v) -> Gs2InboxMessage:
    read_acquire_actions = v
    return self


func with_received_at(v) -> Gs2InboxMessage:
    received_at = v
    return self


func with_read_at(v) -> Gs2InboxMessage:
    read_at = v
    return self


func with_expires_at(v) -> Gs2InboxMessage:
    expires_at = v
    return self


func with_revision(v) -> Gs2InboxMessage:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_message_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+):message:(?<messageName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("messageName")


static func from_dict(data) -> Gs2InboxMessage:
    if data == null:
        return null
    var ret = Gs2InboxMessage.new()
    ret.message_id = null if data.get("messageId") == null else str(data.get("messageId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.is_read = null if data.get("isRead") == null else bool(data.get("isRead"))
    ret.read_acquire_actions = null if data.get("readAcquireActions") == null else data.get("readAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.received_at = null if data.get("receivedAt") == null else int(data.get("receivedAt"))
    ret.read_at = null if data.get("readAt") == null else int(data.get("readAt"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["messageId"] = message_id
    ret["name"] = name
    ret["userId"] = user_id
    ret["metadata"] = metadata
    ret["isRead"] = is_read
    ret["readAcquireActions"] = null if read_acquire_actions == null else read_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["receivedAt"] = received_at
    ret["readAt"] = read_at
    ret["expiresAt"] = expires_at
    ret["revision"] = revision
    return ret