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
class_name Gs2VersionEzTargetVersion
extends RefCounted


var version_name = null
var version = null
var body = null
var signature = null


func with_version_name(v) -> Gs2VersionEzTargetVersion:
    version_name = v
    return self


func with_version(v) -> Gs2VersionEzTargetVersion:
    version = v
    return self


func with_body(v) -> Gs2VersionEzTargetVersion:
    body = v
    return self


func with_signature(v) -> Gs2VersionEzTargetVersion:
    signature = v
    return self


func to_model() -> Gs2VersionTargetVersion:
    var ret = Gs2VersionTargetVersion.new()
    ret.version_name = version_name
    ret.version = null if version == null else version.to_model()
    ret.body = body
    ret.signature = signature
    return ret


static func from_model(model) -> Gs2VersionEzTargetVersion:
    var ret = Gs2VersionEzTargetVersion.new()
    ret.version_name = model.version_name
    ret.version = null if model.version == null else Gs2VersionEzVersion.from_model(model.version)
    ret.body = model.body
    ret.signature = model.signature
    return ret