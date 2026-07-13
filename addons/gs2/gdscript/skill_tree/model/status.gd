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
class_name Gs2SkillTreeStatus
extends RefCounted


var status_id = null
var user_id = null
var property_id = null
var released_node_names = null
var created_at = null
var updated_at = null
var revision = null


func with_status_id(v) -> Gs2SkillTreeStatus:
    status_id = v
    return self


func with_user_id(v) -> Gs2SkillTreeStatus:
    user_id = v
    return self


func with_property_id(v) -> Gs2SkillTreeStatus:
    property_id = v
    return self


func with_released_node_names(v) -> Gs2SkillTreeStatus:
    released_node_names = v
    return self


func with_created_at(v) -> Gs2SkillTreeStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2SkillTreeStatus:
    updated_at = v
    return self


func with_revision(v) -> Gs2SkillTreeStatus:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):user:(?<userId>.+):status:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):user:(?<userId>.+):status:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):user:(?<userId>.+):status:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):user:(?<userId>.+):status:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_property_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):user:(?<userId>.+):status:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("propertyId")


static func from_dict(data) -> Gs2SkillTreeStatus:
    if data == null:
        return null
    var ret = Gs2SkillTreeStatus.new()
    ret.status_id = null if data.get("statusId") == null else str(data.get("statusId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.released_node_names = null if data.get("releasedNodeNames") == null else data.get("releasedNodeNames").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["statusId"] = status_id
    ret["userId"] = user_id
    ret["propertyId"] = property_id
    ret["releasedNodeNames"] = released_node_names
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret