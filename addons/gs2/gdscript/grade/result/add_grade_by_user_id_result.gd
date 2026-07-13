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
class_name Gs2GradeAddGradeByUserIdResult
extends RefCounted


var item = null
var experience_namespace_name = null
var experience_status = null
var metadata = null


func with_item(v) -> Gs2GradeAddGradeByUserIdResult:
    item = v
    return self


func with_experience_namespace_name(v) -> Gs2GradeAddGradeByUserIdResult:
    experience_namespace_name = v
    return self


func with_experience_status(v) -> Gs2GradeAddGradeByUserIdResult:
    experience_status = v
    return self


func with_metadata(v) -> Gs2GradeAddGradeByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2GradeAddGradeByUserIdResult:
    if data == null:
        return null
    var ret = Gs2GradeAddGradeByUserIdResult.new()
    ret.item = null if data.get("item") == null else Gs2GradeStatus.from_dict(data.get("item"))
    ret.experience_namespace_name = null if data.get("experienceNamespaceName") == null else str(data.get("experienceNamespaceName"))
    ret.experience_status = null if data.get("experienceStatus") == null else Gs2ExperienceStatus.from_dict(data.get("experienceStatus"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["experienceNamespaceName"] = experience_namespace_name
    ret["experienceStatus"] = null if experience_status == null else experience_status.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret