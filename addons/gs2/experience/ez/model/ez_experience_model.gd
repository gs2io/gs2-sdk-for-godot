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
class_name Gs2ExperienceEzExperienceModel
extends RefCounted


var name = null
var metadata = null
var default_experience = 0
var default_rank_cap = 0
var max_rank_cap = 0
var rank_threshold = null
var acquire_action_rates = []


func with_name(v) -> Gs2ExperienceEzExperienceModel:
    name = v
    return self


func with_metadata(v) -> Gs2ExperienceEzExperienceModel:
    metadata = v
    return self


func with_default_experience(v) -> Gs2ExperienceEzExperienceModel:
    default_experience = v
    return self


func with_default_rank_cap(v) -> Gs2ExperienceEzExperienceModel:
    default_rank_cap = v
    return self


func with_max_rank_cap(v) -> Gs2ExperienceEzExperienceModel:
    max_rank_cap = v
    return self


func with_rank_threshold(v) -> Gs2ExperienceEzExperienceModel:
    rank_threshold = v
    return self


func with_acquire_action_rates(v) -> Gs2ExperienceEzExperienceModel:
    acquire_action_rates = v
    return self


func to_model() -> Gs2ExperienceExperienceModel:
    var ret = Gs2ExperienceExperienceModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.default_experience = default_experience
    ret.default_rank_cap = default_rank_cap
    ret.max_rank_cap = max_rank_cap
    ret.rank_threshold = null if rank_threshold == null else rank_threshold.to_model()
    ret.acquire_action_rates = null if acquire_action_rates == null else acquire_action_rates.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2ExperienceEzExperienceModel:
    var ret = Gs2ExperienceEzExperienceModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.default_experience = 0 if model.default_experience == null else model.default_experience
    ret.default_rank_cap = 0 if model.default_rank_cap == null else model.default_rank_cap
    ret.max_rank_cap = 0 if model.max_rank_cap == null else model.max_rank_cap
    ret.rank_threshold = null if model.rank_threshold == null else Gs2ExperienceEzThreshold.from_model(model.rank_threshold)
    ret.acquire_action_rates = [] if model.acquire_action_rates == null else model.acquire_action_rates.map(func(v): return Gs2ExperienceEzAcquireActionRate.from_model(v))
    return ret