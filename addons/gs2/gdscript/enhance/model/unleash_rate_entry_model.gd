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
class_name Gs2EnhanceUnleashRateEntryModel
extends RefCounted


var grade_value = null
var type = null
var need_count = null
var recipes = null


func with_grade_value(v) -> Gs2EnhanceUnleashRateEntryModel:
    grade_value = v
    return self


func with_type(v) -> Gs2EnhanceUnleashRateEntryModel:
    type = v
    return self


func with_need_count(v) -> Gs2EnhanceUnleashRateEntryModel:
    need_count = v
    return self


func with_recipes(v) -> Gs2EnhanceUnleashRateEntryModel:
    recipes = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashRateEntryModel:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashRateEntryModel.new()
    ret.grade_value = null if data.get("gradeValue") == null else int(data.get("gradeValue"))
    ret.type = null if data.get("type") == null else str(data.get("type"))
    ret.need_count = null if data.get("needCount") == null else int(data.get("needCount"))
    ret.recipes = null if data.get("recipes") == null else data.get("recipes").map(func(v): return Gs2EnhanceUnleashRecipe.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["gradeValue"] = grade_value
    ret["type"] = type
    ret["needCount"] = need_count
    ret["recipes"] = null if recipes == null else recipes.map(func(v): return null if v == null else v.to_dict())
    return ret