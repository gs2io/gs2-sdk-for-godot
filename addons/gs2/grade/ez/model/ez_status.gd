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
class_name Gs2GradeEzStatus
extends RefCounted


var grade_name = null
var property_id = null
var grade_value = 0


func with_grade_name(v) -> Gs2GradeEzStatus:
    grade_name = v
    return self


func with_property_id(v) -> Gs2GradeEzStatus:
    property_id = v
    return self


func with_grade_value(v) -> Gs2GradeEzStatus:
    grade_value = v
    return self


func to_model() -> Gs2GradeStatus:
    var ret = Gs2GradeStatus.new()
    ret.grade_name = grade_name
    ret.property_id = property_id
    ret.grade_value = grade_value
    return ret


static func from_model(model) -> Gs2GradeEzStatus:
    var ret = Gs2GradeEzStatus.new()
    ret.grade_name = model.grade_name
    ret.property_id = model.property_id
    ret.grade_value = 0 if model.grade_value == null else model.grade_value
    return ret