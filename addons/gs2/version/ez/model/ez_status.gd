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
class_name Gs2VersionEzStatus
extends RefCounted


var version_model = null
var current_version = null


func with_version_model(v) -> Gs2VersionEzStatus:
    version_model = v
    return self


func with_current_version(v) -> Gs2VersionEzStatus:
    current_version = v
    return self


func to_model() -> Gs2VersionStatus:
    var ret = Gs2VersionStatus.new()
    ret.version_model = null if version_model == null else version_model.to_model()
    ret.current_version = null if current_version == null else current_version.to_model()
    return ret


static func from_model(model) -> Gs2VersionEzStatus:
    var ret = Gs2VersionEzStatus.new()
    ret.version_model = null if model.version_model == null else Gs2VersionEzVersionModel.from_model(model.version_model)
    ret.current_version = null if model.current_version == null else Gs2VersionEzVersion.from_model(model.current_version)
    return ret