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
class_name Gs2VersionEzCheckVersionResult
extends RefCounted


var project_token = null
var warnings = []
var errors = []


static func from_model(model) -> Gs2VersionEzCheckVersionResult:
    var ret = Gs2VersionEzCheckVersionResult.new()
    ret.project_token = model.project_token
    ret.warnings = [] if model.warnings == null else model.warnings.map(func(v): return Gs2VersionEzStatus.from_model(v))
    ret.errors = [] if model.errors == null else model.errors.map(func(v): return Gs2VersionEzStatus.from_model(v))
    return ret