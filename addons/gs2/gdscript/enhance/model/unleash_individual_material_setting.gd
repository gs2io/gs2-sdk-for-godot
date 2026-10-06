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
class_name Gs2EnhanceUnleashIndividualMaterialSetting
extends RefCounted


var match_type = null
var grade_condition = null
var grade_value = null
var count = null


func with_match_type(v) -> Gs2EnhanceUnleashIndividualMaterialSetting:
    match_type = v
    return self


func with_grade_condition(v) -> Gs2EnhanceUnleashIndividualMaterialSetting:
    grade_condition = v
    return self


func with_grade_value(v) -> Gs2EnhanceUnleashIndividualMaterialSetting:
    grade_value = v
    return self


func with_count(v) -> Gs2EnhanceUnleashIndividualMaterialSetting:
    count = v
    return self


static func from_dict(data) -> Gs2EnhanceUnleashIndividualMaterialSetting:
    if data == null:
        return null
    var ret = Gs2EnhanceUnleashIndividualMaterialSetting.new()
    ret.match_type = null if data.get("matchType") == null else str(data.get("matchType"))
    ret.grade_condition = null if data.get("gradeCondition") == null else str(data.get("gradeCondition"))
    ret.grade_value = null if data.get("gradeValue") == null else int(data.get("gradeValue"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["matchType"] = match_type
    ret["gradeCondition"] = grade_condition
    ret["gradeValue"] = grade_value
    ret["count"] = count
    return ret