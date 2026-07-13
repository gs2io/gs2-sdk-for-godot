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
class_name Gs2GradeStatus
extends RefCounted


var status_id = null
var grade_name = null
var user_id = null
var property_id = null
var grade_value = null
var created_at = null
var updated_at = null
var revision = null


func with_status_id(v) -> Gs2GradeStatus:
    status_id = v
    return self


func with_grade_name(v) -> Gs2GradeStatus:
    grade_name = v
    return self


func with_user_id(v) -> Gs2GradeStatus:
    user_id = v
    return self


func with_property_id(v) -> Gs2GradeStatus:
    property_id = v
    return self


func with_grade_value(v) -> Gs2GradeStatus:
    grade_value = v
    return self


func with_created_at(v) -> Gs2GradeStatus:
    created_at = v
    return self


func with_updated_at(v) -> Gs2GradeStatus:
    updated_at = v
    return self


func with_revision(v) -> Gs2GradeStatus:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):user:(?<userId>.+):gradeModel:(?<gradeName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):user:(?<userId>.+):gradeModel:(?<gradeName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):user:(?<userId>.+):gradeModel:(?<gradeName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):user:(?<userId>.+):gradeModel:(?<gradeName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_grade_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):user:(?<userId>.+):gradeModel:(?<gradeName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("gradeName")


static func get_property_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):grade:(?<namespaceName>.+):user:(?<userId>.+):gradeModel:(?<gradeName>.+):property:(?<propertyId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("propertyId")


static func from_dict(data) -> Gs2GradeStatus:
    if data == null:
        return null
    var ret = Gs2GradeStatus.new()
    ret.status_id = null if data.get("statusId") == null else str(data.get("statusId"))
    ret.grade_name = null if data.get("gradeName") == null else str(data.get("gradeName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.grade_value = null if data.get("gradeValue") == null else int(data.get("gradeValue"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["statusId"] = status_id
    ret["gradeName"] = grade_name
    ret["userId"] = user_id
    ret["propertyId"] = property_id
    ret["gradeValue"] = grade_value
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret