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
class_name Gs2EnhanceEzUnleashIndividualMaterialSetting
extends RefCounted


var match_type = null
var grade_condition = null
var grade_value = 0
var count = 0


func with_match_type(v) -> Gs2EnhanceEzUnleashIndividualMaterialSetting:
    match_type = v
    return self


func with_grade_condition(v) -> Gs2EnhanceEzUnleashIndividualMaterialSetting:
    grade_condition = v
    return self


func with_grade_value(v) -> Gs2EnhanceEzUnleashIndividualMaterialSetting:
    grade_value = v
    return self


func with_count(v) -> Gs2EnhanceEzUnleashIndividualMaterialSetting:
    count = v
    return self


func to_model() -> Gs2EnhanceUnleashIndividualMaterialSetting:
    var ret = Gs2EnhanceUnleashIndividualMaterialSetting.new()
    ret.match_type = match_type
    ret.grade_condition = grade_condition
    ret.grade_value = grade_value
    ret.count = count
    return ret


static func from_model(model) -> Gs2EnhanceEzUnleashIndividualMaterialSetting:
    var ret = Gs2EnhanceEzUnleashIndividualMaterialSetting.new()
    ret.match_type = model.match_type
    ret.grade_condition = model.grade_condition
    ret.grade_value = 0 if model.grade_value == null else model.grade_value
    ret.count = 0 if model.count == null else model.count
    return ret