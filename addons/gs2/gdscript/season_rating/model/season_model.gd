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
class_name Gs2SeasonRatingSeasonModel
extends RefCounted


var season_model_id = null
var name = null
var metadata = null
var tiers = null
var experience_model_id = null
var challenge_period_event_id = null


func with_season_model_id(v) -> Gs2SeasonRatingSeasonModel:
    season_model_id = v
    return self


func with_name(v) -> Gs2SeasonRatingSeasonModel:
    name = v
    return self


func with_metadata(v) -> Gs2SeasonRatingSeasonModel:
    metadata = v
    return self


func with_tiers(v) -> Gs2SeasonRatingSeasonModel:
    tiers = v
    return self


func with_experience_model_id(v) -> Gs2SeasonRatingSeasonModel:
    experience_model_id = v
    return self


func with_challenge_period_event_id(v) -> Gs2SeasonRatingSeasonModel:
    challenge_period_event_id = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):model:(?<seasonName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):model:(?<seasonName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):model:(?<seasonName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_season_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):seasonRating:(?<namespaceName>.+):model:(?<seasonName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("seasonName")


static func from_dict(data) -> Gs2SeasonRatingSeasonModel:
    if data == null:
        return null
    var ret = Gs2SeasonRatingSeasonModel.new()
    ret.season_model_id = null if data.get("seasonModelId") == null else str(data.get("seasonModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.tiers = null if data.get("tiers") == null else data.get("tiers").map(func(v): return Gs2SeasonRatingTierModel.from_dict(v))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.challenge_period_event_id = null if data.get("challengePeriodEventId") == null else str(data.get("challengePeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["seasonModelId"] = season_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["tiers"] = null if tiers == null else tiers.map(func(v): return null if v == null else v.to_dict())
    ret["experienceModelId"] = experience_model_id
    ret["challengePeriodEventId"] = challenge_period_event_id
    return ret