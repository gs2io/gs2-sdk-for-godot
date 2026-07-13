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
class_name Gs2GradeUpdateGradeModelMasterRequest
extends Gs2Request


var namespace_name = null
var grade_name = null
var description = null
var metadata = null
var default_grades = null
var experience_model_id = null
var grade_entries = null
var acquire_action_rates = null


func with_namespace_name(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    namespace_name = v
    return self


func with_grade_name(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    grade_name = v
    return self


func with_description(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    metadata = v
    return self


func with_default_grades(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    default_grades = v
    return self


func with_experience_model_id(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    experience_model_id = v
    return self


func with_grade_entries(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    grade_entries = v
    return self


func with_acquire_action_rates(v) -> Gs2GradeUpdateGradeModelMasterRequest:
    acquire_action_rates = v
    return self


static func from_dict(data) -> Gs2GradeUpdateGradeModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2GradeUpdateGradeModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.grade_name = null if data.get("gradeName") == null else str(data.get("gradeName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.default_grades = null if data.get("defaultGrades") == null else data.get("defaultGrades").map(func(v): return Gs2GradeDefaultGradeModel.from_dict(v))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.grade_entries = null if data.get("gradeEntries") == null else data.get("gradeEntries").map(func(v): return Gs2GradeGradeEntryModel.from_dict(v))
    ret.acquire_action_rates = null if data.get("acquireActionRates") == null else data.get("acquireActionRates").map(func(v): return Gs2GradeAcquireActionRate.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["gradeName"] = grade_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["defaultGrades"] = null if default_grades == null else default_grades.map(func(v): return null if v == null else v.to_dict())
    ret["experienceModelId"] = experience_model_id
    ret["gradeEntries"] = null if grade_entries == null else grade_entries.map(func(v): return null if v == null else v.to_dict())
    ret["acquireActionRates"] = null if acquire_action_rates == null else acquire_action_rates.map(func(v): return null if v == null else v.to_dict())
    return ret