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
class_name Gs2EnhanceEzUnleashRateModel
extends RefCounted


var name = null
var metadata = null
var target_inventory_model_id = null
var grade_model_id = null
var grade_entries = []


func with_name(v) -> Gs2EnhanceEzUnleashRateModel:
    name = v
    return self


func with_metadata(v) -> Gs2EnhanceEzUnleashRateModel:
    metadata = v
    return self


func with_target_inventory_model_id(v) -> Gs2EnhanceEzUnleashRateModel:
    target_inventory_model_id = v
    return self


func with_grade_model_id(v) -> Gs2EnhanceEzUnleashRateModel:
    grade_model_id = v
    return self


func with_grade_entries(v) -> Gs2EnhanceEzUnleashRateModel:
    grade_entries = v
    return self


func to_model() -> Gs2EnhanceUnleashRateModel:
    var ret = Gs2EnhanceUnleashRateModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.target_inventory_model_id = target_inventory_model_id
    ret.grade_model_id = grade_model_id
    ret.grade_entries = null if grade_entries == null else grade_entries.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2EnhanceEzUnleashRateModel:
    var ret = Gs2EnhanceEzUnleashRateModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.target_inventory_model_id = model.target_inventory_model_id
    ret.grade_model_id = model.grade_model_id
    ret.grade_entries = [] if model.grade_entries == null else model.grade_entries.map(func(v): return Gs2EnhanceEzUnleashRateEntryModel.from_model(v))
    return ret