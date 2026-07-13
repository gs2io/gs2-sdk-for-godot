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
class_name Gs2GradeEzGradeModel
extends RefCounted


var name = null
var metadata = null
var experience_model_id = null
var grade_entries = []
var acquire_action_rates = []


func with_name(v) -> Gs2GradeEzGradeModel:
    name = v
    return self


func with_metadata(v) -> Gs2GradeEzGradeModel:
    metadata = v
    return self


func with_experience_model_id(v) -> Gs2GradeEzGradeModel:
    experience_model_id = v
    return self


func with_grade_entries(v) -> Gs2GradeEzGradeModel:
    grade_entries = v
    return self


func with_acquire_action_rates(v) -> Gs2GradeEzGradeModel:
    acquire_action_rates = v
    return self


func to_model() -> Gs2GradeGradeModel:
    var ret = Gs2GradeGradeModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.experience_model_id = experience_model_id
    ret.grade_entries = null if grade_entries == null else grade_entries.map(func(v): return null if v == null else v.to_model())
    ret.acquire_action_rates = null if acquire_action_rates == null else acquire_action_rates.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2GradeEzGradeModel:
    var ret = Gs2GradeEzGradeModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.experience_model_id = model.experience_model_id
    ret.grade_entries = [] if model.grade_entries == null else model.grade_entries.map(func(v): return Gs2GradeEzGradeEntryModel.from_model(v))
    ret.acquire_action_rates = [] if model.acquire_action_rates == null else model.acquire_action_rates.map(func(v): return Gs2GradeEzAcquireActionRate.from_model(v))
    return ret