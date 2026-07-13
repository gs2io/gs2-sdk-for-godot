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
class_name Gs2VersionCheckVersionByUserIdResult
extends RefCounted


var project_token = null
var warnings = null
var errors = null
var metadata = null


func with_project_token(v) -> Gs2VersionCheckVersionByUserIdResult:
    project_token = v
    return self


func with_warnings(v) -> Gs2VersionCheckVersionByUserIdResult:
    warnings = v
    return self


func with_errors(v) -> Gs2VersionCheckVersionByUserIdResult:
    errors = v
    return self


func with_metadata(v) -> Gs2VersionCheckVersionByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2VersionCheckVersionByUserIdResult:
    if data == null:
        return null
    var ret = Gs2VersionCheckVersionByUserIdResult.new()
    ret.project_token = null if data.get("projectToken") == null else str(data.get("projectToken"))
    ret.warnings = null if data.get("warnings") == null else data.get("warnings").map(func(v): return Gs2VersionStatus.from_dict(v))
    ret.errors = null if data.get("errors") == null else data.get("errors").map(func(v): return Gs2VersionStatus.from_dict(v))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["projectToken"] = project_token
    ret["warnings"] = null if warnings == null else warnings.map(func(v): return null if v == null else v.to_dict())
    ret["errors"] = null if errors == null else errors.map(func(v): return null if v == null else v.to_dict())
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret