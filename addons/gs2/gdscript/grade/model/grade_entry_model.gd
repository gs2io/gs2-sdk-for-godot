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
class_name Gs2GradeGradeEntryModel
extends RefCounted


var metadata = null
var rank_cap_value = null
var property_id_regex = null
var grade_up_property_id_regex = null


func with_metadata(v) -> Gs2GradeGradeEntryModel:
    metadata = v
    return self


func with_rank_cap_value(v) -> Gs2GradeGradeEntryModel:
    rank_cap_value = v
    return self


func with_property_id_regex(v) -> Gs2GradeGradeEntryModel:
    property_id_regex = v
    return self


func with_grade_up_property_id_regex(v) -> Gs2GradeGradeEntryModel:
    grade_up_property_id_regex = v
    return self


static func from_dict(data) -> Gs2GradeGradeEntryModel:
    if data == null:
        return null
    var ret = Gs2GradeGradeEntryModel.new()
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.rank_cap_value = null if data.get("rankCapValue") == null else int(data.get("rankCapValue"))
    ret.property_id_regex = null if data.get("propertyIdRegex") == null else str(data.get("propertyIdRegex"))
    ret.grade_up_property_id_regex = null if data.get("gradeUpPropertyIdRegex") == null else str(data.get("gradeUpPropertyIdRegex"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["metadata"] = metadata
    ret["rankCapValue"] = rank_cap_value
    ret["propertyIdRegex"] = property_id_regex
    ret["gradeUpPropertyIdRegex"] = grade_up_property_id_regex
    return ret