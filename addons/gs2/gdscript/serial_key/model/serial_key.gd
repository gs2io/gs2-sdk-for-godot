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
class_name Gs2SerialKeySerialKey
extends RefCounted


var serial_key_id = null
var campaign_model_name = null
var code = null
var metadata = null
var status = null
var used_user_id = null
var created_at = null
var used_at = null
var updated_at = null
var revision = null


func with_serial_key_id(v) -> Gs2SerialKeySerialKey:
    serial_key_id = v
    return self


func with_campaign_model_name(v) -> Gs2SerialKeySerialKey:
    campaign_model_name = v
    return self


func with_code(v) -> Gs2SerialKeySerialKey:
    code = v
    return self


func with_metadata(v) -> Gs2SerialKeySerialKey:
    metadata = v
    return self


func with_status(v) -> Gs2SerialKeySerialKey:
    status = v
    return self


func with_used_user_id(v) -> Gs2SerialKeySerialKey:
    used_user_id = v
    return self


func with_created_at(v) -> Gs2SerialKeySerialKey:
    created_at = v
    return self


func with_used_at(v) -> Gs2SerialKeySerialKey:
    used_at = v
    return self


func with_updated_at(v) -> Gs2SerialKeySerialKey:
    updated_at = v
    return self


func with_revision(v) -> Gs2SerialKeySerialKey:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):serialKey:(?<serialKeyCode>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):serialKey:(?<serialKeyCode>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):serialKey:(?<serialKeyCode>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_serial_key_code_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):serialKey:(?<namespaceName>.+):serialKey:(?<serialKeyCode>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("serialKeyCode")


static func from_dict(data) -> Gs2SerialKeySerialKey:
    if data == null:
        return null
    var ret = Gs2SerialKeySerialKey.new()
    ret.serial_key_id = null if data.get("serialKeyId") == null else str(data.get("serialKeyId"))
    ret.campaign_model_name = null if data.get("campaignModelName") == null else str(data.get("campaignModelName"))
    ret.code = null if data.get("code") == null else str(data.get("code"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.used_user_id = null if data.get("usedUserId") == null else str(data.get("usedUserId"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.used_at = null if data.get("usedAt") == null else int(data.get("usedAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["serialKeyId"] = serial_key_id
    ret["campaignModelName"] = campaign_model_name
    ret["code"] = code
    ret["metadata"] = metadata
    ret["status"] = status
    ret["usedUserId"] = used_user_id
    ret["createdAt"] = created_at
    ret["usedAt"] = used_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret