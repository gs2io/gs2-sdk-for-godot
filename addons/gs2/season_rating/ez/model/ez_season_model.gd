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
class_name Gs2SeasonRatingEzSeasonModel
extends RefCounted


var season_model_id = null
var name = null
var metadata = null
var tiers = []
var experience_model_id = null


func with_season_model_id(v) -> Gs2SeasonRatingEzSeasonModel:
    season_model_id = v
    return self


func with_name(v) -> Gs2SeasonRatingEzSeasonModel:
    name = v
    return self


func with_metadata(v) -> Gs2SeasonRatingEzSeasonModel:
    metadata = v
    return self


func with_tiers(v) -> Gs2SeasonRatingEzSeasonModel:
    tiers = v
    return self


func with_experience_model_id(v) -> Gs2SeasonRatingEzSeasonModel:
    experience_model_id = v
    return self


func to_model() -> Gs2SeasonRatingSeasonModel:
    var ret = Gs2SeasonRatingSeasonModel.new()
    ret.season_model_id = season_model_id
    ret.name = name
    ret.metadata = metadata
    ret.tiers = null if tiers == null else tiers.map(func(v): return null if v == null else v.to_model())
    ret.experience_model_id = experience_model_id
    return ret


static func from_model(model) -> Gs2SeasonRatingEzSeasonModel:
    var ret = Gs2SeasonRatingEzSeasonModel.new()
    ret.season_model_id = model.season_model_id
    ret.name = model.name
    ret.metadata = model.metadata
    ret.tiers = [] if model.tiers == null else model.tiers.map(func(v): return Gs2SeasonRatingEzTierModel.from_model(v))
    ret.experience_model_id = model.experience_model_id
    return ret