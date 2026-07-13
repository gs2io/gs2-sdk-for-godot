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
class_name Gs2VersionCheckVersionRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var target_versions = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2VersionCheckVersionRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2VersionCheckVersionRequest:
    access_token = v
    return self


func with_target_versions(v) -> Gs2VersionCheckVersionRequest:
    target_versions = v
    return self


func with_duplication_avoider(v) -> Gs2VersionCheckVersionRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2VersionCheckVersionRequest:
    if data == null:
        return null
    var ret = Gs2VersionCheckVersionRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.target_versions = null if data.get("targetVersions") == null else data.get("targetVersions").map(func(v): return Gs2VersionTargetVersion.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["targetVersions"] = null if target_versions == null else target_versions.map(func(v): return null if v == null else v.to_dict())
    return ret