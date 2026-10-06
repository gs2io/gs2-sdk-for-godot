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
class_name Gs2EnhanceEzUnleashRateEntryModel
extends RefCounted


var grade_value = 0
var type = null
var need_count = 0
var recipes = []


func with_grade_value(v) -> Gs2EnhanceEzUnleashRateEntryModel:
    grade_value = v
    return self


func with_type(v) -> Gs2EnhanceEzUnleashRateEntryModel:
    type = v
    return self


func with_need_count(v) -> Gs2EnhanceEzUnleashRateEntryModel:
    need_count = v
    return self


func with_recipes(v) -> Gs2EnhanceEzUnleashRateEntryModel:
    recipes = v
    return self


func to_model() -> Gs2EnhanceUnleashRateEntryModel:
    var ret = Gs2EnhanceUnleashRateEntryModel.new()
    ret.grade_value = grade_value
    ret.type = type
    ret.need_count = need_count
    ret.recipes = null if recipes == null else recipes.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2EnhanceEzUnleashRateEntryModel:
    var ret = Gs2EnhanceEzUnleashRateEntryModel.new()
    ret.grade_value = 0 if model.grade_value == null else model.grade_value
    ret.type = model.type
    ret.need_count = 0 if model.need_count == null else model.need_count
    ret.recipes = [] if model.recipes == null else model.recipes.map(func(v): return Gs2EnhanceEzUnleashRecipe.from_model(v))
    return ret