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
class_name Gs2VersionEzAcceptVersion
extends RefCounted


var version_name = null
var user_id = null
var version = null


func with_version_name(v) -> Gs2VersionEzAcceptVersion:
    version_name = v
    return self


func with_user_id(v) -> Gs2VersionEzAcceptVersion:
    user_id = v
    return self


func with_version(v) -> Gs2VersionEzAcceptVersion:
    version = v
    return self


func to_model() -> Gs2VersionAcceptVersion:
    var ret = Gs2VersionAcceptVersion.new()
    ret.version_name = version_name
    ret.user_id = user_id
    ret.version = null if version == null else version.to_model()
    return ret


static func from_model(model) -> Gs2VersionEzAcceptVersion:
    var ret = Gs2VersionEzAcceptVersion.new()
    ret.version_name = model.version_name
    ret.user_id = model.user_id
    ret.version = null if model.version == null else Gs2VersionEzVersion.from_model(model.version)
    return ret