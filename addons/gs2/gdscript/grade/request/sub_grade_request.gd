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
class_name Gs2GradeSubGradeRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var grade_name = null
var property_id = null
var grade_value = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GradeSubGradeRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2GradeSubGradeRequest:
    access_token = v
    return self


func with_grade_name(v) -> Gs2GradeSubGradeRequest:
    grade_name = v
    return self


func with_property_id(v) -> Gs2GradeSubGradeRequest:
    property_id = v
    return self


func with_grade_value(v) -> Gs2GradeSubGradeRequest:
    grade_value = v
    return self


func with_duplication_avoider(v) -> Gs2GradeSubGradeRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GradeSubGradeRequest:
    if data == null:
        return null
    var ret = Gs2GradeSubGradeRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.grade_name = null if data.get("gradeName") == null else str(data.get("gradeName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.grade_value = null if data.get("gradeValue") == null else int(data.get("gradeValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["gradeName"] = grade_name
    ret["propertyId"] = property_id
    ret["gradeValue"] = grade_value
    return ret