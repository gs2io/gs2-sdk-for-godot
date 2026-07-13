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
class_name Gs2GradeEzApplyRankCapResult
extends RefCounted


var item = null
var experience_namespace_name = null
var experience_status = null


static func from_model(model) -> Gs2GradeEzApplyRankCapResult:
    var ret = Gs2GradeEzApplyRankCapResult.new()
    ret.item = null if model.item == null else Gs2GradeEzStatus.from_model(model.item)
    ret.experience_namespace_name = model.experience_namespace_name
    ret.experience_status = null if model.experience_status == null else Gs2ExperienceEzStatus.from_model(model.experience_status)
    return ret