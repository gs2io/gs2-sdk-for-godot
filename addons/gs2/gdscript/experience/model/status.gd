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
class_name Gs2ExperienceStatus
extends RefCounted


var status_id = null
var experience_name = null
var user_id = null
var property_id = null
var experience_value = null
var rank_value = null
var rank_cap_value = null
var next_rank_up_experience_value = null
var created_at = null
var updated_at = null
var revision = null


func with_status_id(v) -> Gs2ExperienceStatus:
    status_id = v
    return self


func with_experience_name(v) -> Gs2ExperienceStatus:
    experience_name = v
    return self


func with_user_id(v) -> Gs2ExperienceStatus:
    user_id = v
    return self


func with_property_id(v) -> Gs2ExperienceStatus:
    property_id = v
    return self


func with_experience_value(v) -> Gs2ExperienceStatus:
    experience_value = v
    return self


func with_rank_value(v) -> Gs2ExperienceStatus:
    rank_value = v
    return self


func with_rank_cap_value(v) -> Gs2ExperienceStatus:
    rank_cap_value = v
    return self


func with_next_rank_up_experience_value(v) -> Gs2ExperienceStatus:
    next_rank_up_experience_value = v
    return self


func with_created_at(v) -> Gs2ExperienceStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ExperienceStatus:
    updated_at = v
    return self


func with_revision(v) -> Gs2ExperienceStatus:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):user:(?<userId>.+):experienceModel:(?<experienceName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):user:(?<userId>.+):experienceModel:(?<experienceName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):user:(?<userId>.+):experienceModel:(?<experienceName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):user:(?<userId>.+):experienceModel:(?<experienceName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_experience_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):user:(?<userId>.+):experienceModel:(?<experienceName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("experienceName")


static func get_property_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):user:(?<userId>.+):experienceModel:(?<experienceName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("propertyId")


static func from_dict(data) -> Gs2ExperienceStatus:
    if data == null:
        return null
    var ret = Gs2ExperienceStatus.new()
    ret.status_id = null if data.get("statusId") == null else str(data.get("statusId"))
    ret.experience_name = null if data.get("experienceName") == null else str(data.get("experienceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.experience_value = null if data.get("experienceValue") == null else int(data.get("experienceValue"))
    ret.rank_value = null if data.get("rankValue") == null else int(data.get("rankValue"))
    ret.rank_cap_value = null if data.get("rankCapValue") == null else int(data.get("rankCapValue"))
    ret.next_rank_up_experience_value = null if data.get("nextRankUpExperienceValue") == null else int(data.get("nextRankUpExperienceValue"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["statusId"] = status_id
    ret["experienceName"] = experience_name
    ret["userId"] = user_id
    ret["propertyId"] = property_id
    ret["experienceValue"] = experience_value
    ret["rankValue"] = rank_value
    ret["rankCapValue"] = rank_cap_value
    ret["nextRankUpExperienceValue"] = next_rank_up_experience_value
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret