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
class_name Gs2GradeDefaultGradeModel
extends RefCounted


var property_id_regex = null
var default_grade_value = null


func with_property_id_regex(v) -> Gs2GradeDefaultGradeModel:
    property_id_regex = v
    return self


func with_default_grade_value(v) -> Gs2GradeDefaultGradeModel:
    default_grade_value = v
    return self


static func from_dict(data) -> Gs2GradeDefaultGradeModel:
    if data == null:
        return null
    var ret = Gs2GradeDefaultGradeModel.new()
    ret.property_id_regex = null if data.get("propertyIdRegex") == null else str(data.get("propertyIdRegex"))
    ret.default_grade_value = null if data.get("defaultGradeValue") == null else int(data.get("defaultGradeValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["propertyIdRegex"] = property_id_regex
    ret["defaultGradeValue"] = default_grade_value
    return ret