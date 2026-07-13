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
class_name Gs2BuffEzBuffTargetGrn
extends RefCounted


var target_model_name = null
var target_grn = null


func with_target_model_name(v) -> Gs2BuffEzBuffTargetGrn:
    target_model_name = v
    return self


func with_target_grn(v) -> Gs2BuffEzBuffTargetGrn:
    target_grn = v
    return self


func to_model() -> Gs2BuffBuffTargetGrn:
    var ret = Gs2BuffBuffTargetGrn.new()
    ret.target_model_name = target_model_name
    ret.target_grn = target_grn
    return ret


static func from_model(model) -> Gs2BuffEzBuffTargetGrn:
    var ret = Gs2BuffEzBuffTargetGrn.new()
    ret.target_model_name = model.target_model_name
    ret.target_grn = model.target_grn
    return ret