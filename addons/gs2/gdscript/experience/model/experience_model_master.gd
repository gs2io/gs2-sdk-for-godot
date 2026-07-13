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
class_name Gs2ExperienceExperienceModelMaster
extends RefCounted


var experience_model_id = null
var name = null
var description = null
var metadata = null
var default_experience = null
var default_rank_cap = null
var max_rank_cap = null
var rank_threshold_name = null
var acquire_action_rates = null
var created_at = null
var updated_at = null
var revision = null


func with_experience_model_id(v) -> Gs2ExperienceExperienceModelMaster:
    experience_model_id = v
    return self


func with_name(v) -> Gs2ExperienceExperienceModelMaster:
    name = v
    return self


func with_description(v) -> Gs2ExperienceExperienceModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2ExperienceExperienceModelMaster:
    metadata = v
    return self


func with_default_experience(v) -> Gs2ExperienceExperienceModelMaster:
    default_experience = v
    return self


func with_default_rank_cap(v) -> Gs2ExperienceExperienceModelMaster:
    default_rank_cap = v
    return self


func with_max_rank_cap(v) -> Gs2ExperienceExperienceModelMaster:
    max_rank_cap = v
    return self


func with_rank_threshold_name(v) -> Gs2ExperienceExperienceModelMaster:
    rank_threshold_name = v
    return self


func with_acquire_action_rates(v) -> Gs2ExperienceExperienceModelMaster:
    acquire_action_rates = v
    return self


func with_created_at(v) -> Gs2ExperienceExperienceModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2ExperienceExperienceModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2ExperienceExperienceModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):model:(?<experienceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):model:(?<experienceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):model:(?<experienceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_experience_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):experience:(?<namespaceName>.+):model:(?<experienceName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("experienceName")


static func from_dict(data) -> Gs2ExperienceExperienceModelMaster:
    if data == null:
        return null
    var ret = Gs2ExperienceExperienceModelMaster.new()
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.default_experience = null if data.get("defaultExperience") == null else int(data.get("defaultExperience"))
    ret.default_rank_cap = null if data.get("defaultRankCap") == null else int(data.get("defaultRankCap"))
    ret.max_rank_cap = null if data.get("maxRankCap") == null else int(data.get("maxRankCap"))
    ret.rank_threshold_name = null if data.get("rankThresholdName") == null else str(data.get("rankThresholdName"))
    ret.acquire_action_rates = null if data.get("acquireActionRates") == null else data.get("acquireActionRates").map(func(v): return Gs2ExperienceAcquireActionRate.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["experienceModelId"] = experience_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["defaultExperience"] = default_experience
    ret["defaultRankCap"] = default_rank_cap
    ret["maxRankCap"] = max_rank_cap
    ret["rankThresholdName"] = rank_threshold_name
    ret["acquireActionRates"] = null if acquire_action_rates == null else acquire_action_rates.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret