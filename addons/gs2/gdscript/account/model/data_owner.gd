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
class_name Gs2AccountDataOwner
extends RefCounted


var data_owner_id = null
var user_id = null
var name = null
var created_at = null
var revision = null


func with_data_owner_id(v) -> Gs2AccountDataOwner:
    data_owner_id = v
    return self


func with_user_id(v) -> Gs2AccountDataOwner:
    user_id = v
    return self


func with_name(v) -> Gs2AccountDataOwner:
    name = v
    return self


func with_created_at(v) -> Gs2AccountDataOwner:
    created_at = v
    return self


func with_revision(v) -> Gs2AccountDataOwner:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+):dataOwner:(?<dataOwnerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+):dataOwner:(?<dataOwnerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+):dataOwner:(?<dataOwnerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+):dataOwner:(?<dataOwnerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_data_owner_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):account:(?<namespaceName>.+):account:(?<userId>.+):dataOwner:(?<dataOwnerName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("dataOwnerName")


static func from_dict(data) -> Gs2AccountDataOwner:
    if data == null:
        return null
    var ret = Gs2AccountDataOwner.new()
    ret.data_owner_id = null if data.get("dataOwnerId") == null else str(data.get("dataOwnerId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["dataOwnerId"] = data_owner_id
    ret["userId"] = user_id
    ret["name"] = name
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret