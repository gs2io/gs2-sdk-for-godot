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
class_name Gs2GradeGradeModelMaster
extends RefCounted


var grade_model_id = null
var name = null
var description = null
var metadata = null
var default_grades = null
var experience_model_id = null
var grade_entries = null
var acquire_action_rates = null
var created_at = null
var updated_at = null
var revision = null


func with_grade_model_id(v) -> Gs2GradeGradeModelMaster:
    grade_model_id = v
    return self


func with_name(v) -> Gs2GradeGradeModelMaster:
    name = v
    return self


func with_description(v) -> Gs2GradeGradeModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2GradeGradeModelMaster:
    metadata = v
    return self


func with_default_grades(v) -> Gs2GradeGradeModelMaster:
    default_grades = v
    return self


func with_experience_model_id(v) -> Gs2GradeGradeModelMaster:
    experience_model_id = v
    return self


func with_grade_entries(v) -> Gs2GradeGradeModelMaster:
    grade_entries = v
    return self


func with_acquire_action_rates(v) -> Gs2GradeGradeModelMaster:
    acquire_action_rates = v
    return self


func with_created_at(v) -> Gs2GradeGradeModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2GradeGradeModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2GradeGradeModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):model:(?<gradeName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):model:(?<gradeName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):model:(?<gradeName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_grade_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):model:(?<gradeName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("gradeName")


static func from_dict(data) -> Gs2GradeGradeModelMaster:
    if data == null:
        return null
    var ret = Gs2GradeGradeModelMaster.new()
    ret.grade_model_id = null if data.get("gradeModelId") == null else str(data.get("gradeModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.default_grades = null if data.get("defaultGrades") == null else data.get("defaultGrades").map(func(v): return Gs2GradeDefaultGradeModel.from_dict(v))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.grade_entries = null if data.get("gradeEntries") == null else data.get("gradeEntries").map(func(v): return Gs2GradeGradeEntryModel.from_dict(v))
    ret.acquire_action_rates = null if data.get("acquireActionRates") == null else data.get("acquireActionRates").map(func(v): return Gs2GradeAcquireActionRate.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["gradeModelId"] = grade_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["defaultGrades"] = null if default_grades == null else default_grades.map(func(v): return null if v == null else v.to_dict())
    ret["experienceModelId"] = experience_model_id
    ret["gradeEntries"] = null if grade_entries == null else grade_entries.map(func(v): return null if v == null else v.to_dict())
    ret["acquireActionRates"] = null if acquire_action_rates == null else acquire_action_rates.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret