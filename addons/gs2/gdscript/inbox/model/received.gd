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
class_name Gs2InboxReceived
extends RefCounted


var received_id = null
var user_id = null
var received_global_message_names = null
var created_at = null
var updated_at = null
var revision = null


func with_received_id(v) -> Gs2InboxReceived:
    received_id = v
    return self


func with_user_id(v) -> Gs2InboxReceived:
    user_id = v
    return self


func with_received_global_message_names(v) -> Gs2InboxReceived:
    received_global_message_names = v
    return self


func with_created_at(v) -> Gs2InboxReceived:
    created_at = v
    return self


func with_updated_at(v) -> Gs2InboxReceived:
    updated_at = v
    return self


func with_revision(v) -> Gs2InboxReceived:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):inbox:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func from_dict(data) -> Gs2InboxReceived:
    if data == null:
        return null
    var ret = Gs2InboxReceived.new()
    ret.received_id = null if data.get("receivedId") == null else str(data.get("receivedId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.received_global_message_names = null if data.get("receivedGlobalMessageNames") == null else data.get("receivedGlobalMessageNames").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["receivedId"] = received_id
    ret["userId"] = user_id
    ret["receivedGlobalMessageNames"] = received_global_message_names
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret