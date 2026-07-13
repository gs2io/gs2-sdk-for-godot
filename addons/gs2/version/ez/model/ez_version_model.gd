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
class_name Gs2VersionEzVersionModel
extends RefCounted


var name = null
var metadata = null
var warning_version = null
var error_version = null
var scope = null
var current_version = null
var need_signature = false


func with_name(v) -> Gs2VersionEzVersionModel:
    name = v
    return self


func with_metadata(v) -> Gs2VersionEzVersionModel:
    metadata = v
    return self


func with_warning_version(v) -> Gs2VersionEzVersionModel:
    warning_version = v
    return self


func with_error_version(v) -> Gs2VersionEzVersionModel:
    error_version = v
    return self


func with_scope(v) -> Gs2VersionEzVersionModel:
    scope = v
    return self


func with_current_version(v) -> Gs2VersionEzVersionModel:
    current_version = v
    return self


func with_need_signature(v) -> Gs2VersionEzVersionModel:
    need_signature = v
    return self


func to_model() -> Gs2VersionVersionModel:
    var ret = Gs2VersionVersionModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.warning_version = null if warning_version == null else warning_version.to_model()
    ret.error_version = null if error_version == null else error_version.to_model()
    ret.scope = scope
    ret.current_version = null if current_version == null else current_version.to_model()
    ret.need_signature = need_signature
    return ret


static func from_model(model) -> Gs2VersionEzVersionModel:
    var ret = Gs2VersionEzVersionModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.warning_version = null if model.warning_version == null else Gs2VersionEzVersion.from_model(model.warning_version)
    ret.error_version = null if model.error_version == null else Gs2VersionEzVersion.from_model(model.error_version)
    ret.scope = model.scope
    ret.current_version = null if model.current_version == null else Gs2VersionEzVersion.from_model(model.current_version)
    ret.need_signature = false if model.need_signature == null else model.need_signature
    return ret