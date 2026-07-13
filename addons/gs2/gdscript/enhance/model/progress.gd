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
class_name Gs2EnhanceProgress
extends RefCounted


var progress_id = null
var user_id = null
var rate_name = null
var name = null
var property_id = null
var experience_value = null
var rate = null
var created_at = null
var updated_at = null
var revision = null


func with_progress_id(v) -> Gs2EnhanceProgress:
    progress_id = v
    return self


func with_user_id(v) -> Gs2EnhanceProgress:
    user_id = v
    return self


func with_rate_name(v) -> Gs2EnhanceProgress:
    rate_name = v
    return self


func with_name(v) -> Gs2EnhanceProgress:
    name = v
    return self


func with_property_id(v) -> Gs2EnhanceProgress:
    property_id = v
    return self


func with_experience_value(v) -> Gs2EnhanceProgress:
    experience_value = v
    return self


func with_rate(v) -> Gs2EnhanceProgress:
    rate = v
    return self


func with_created_at(v) -> Gs2EnhanceProgress:
    created_at = v
    return self


func with_updated_at(v) -> Gs2EnhanceProgress:
    updated_at = v
    return self


func with_revision(v) -> Gs2EnhanceProgress:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enhance:(?<namespaceName>.+):user:(?<userId>.+):progress")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func from_dict(data) -> Gs2EnhanceProgress:
    if data == null:
        return null
    var ret = Gs2EnhanceProgress.new()
    ret.progress_id = null if data.get("progressId") == null else str(data.get("progressId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.rate_name = null if data.get("rateName") == null else str(data.get("rateName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.experience_value = null if data.get("experienceValue") == null else int(data.get("experienceValue"))
    ret.rate = null if data.get("rate") == null else float(data.get("rate"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["progressId"] = progress_id
    ret["userId"] = user_id
    ret["rateName"] = rate_name
    ret["name"] = name
    ret["propertyId"] = property_id
    ret["experienceValue"] = experience_value
    ret["rate"] = rate
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret