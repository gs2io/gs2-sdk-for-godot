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
class_name Gs2VersionTargetVersion
extends RefCounted


var version_name = null
var body = null
var signature = null
var version = null


func with_version_name(v) -> Gs2VersionTargetVersion:
    version_name = v
    return self


func with_body(v) -> Gs2VersionTargetVersion:
    body = v
    return self


func with_signature(v) -> Gs2VersionTargetVersion:
    signature = v
    return self


func with_version(v) -> Gs2VersionTargetVersion:
    version = v
    return self


static func from_dict(data) -> Gs2VersionTargetVersion:
    if data == null:
        return null
    var ret = Gs2VersionTargetVersion.new()
    ret.version_name = null if data.get("versionName") == null else str(data.get("versionName"))
    ret.body = null if data.get("body") == null else str(data.get("body"))
    ret.signature = null if data.get("signature") == null else str(data.get("signature"))
    ret.version = null if data.get("version") == null else Gs2VersionVersion.from_dict(data.get("version"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["versionName"] = version_name
    ret["body"] = body
    ret["signature"] = signature
    ret["version"] = null if version == null else version.to_dict()
    return ret