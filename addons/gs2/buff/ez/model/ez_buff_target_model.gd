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
class_name Gs2BuffEzBuffTargetModel
extends RefCounted


var target_model_name = null
var target_field_name = null
var condition_grns = []
var rate = 0


func with_target_model_name(v) -> Gs2BuffEzBuffTargetModel:
    target_model_name = v
    return self


func with_target_field_name(v) -> Gs2BuffEzBuffTargetModel:
    target_field_name = v
    return self


func with_condition_grns(v) -> Gs2BuffEzBuffTargetModel:
    condition_grns = v
    return self


func with_rate(v) -> Gs2BuffEzBuffTargetModel:
    rate = v
    return self


func to_model() -> Gs2BuffBuffTargetModel:
    var ret = Gs2BuffBuffTargetModel.new()
    ret.target_model_name = target_model_name
    ret.target_field_name = target_field_name
    ret.condition_grns = null if condition_grns == null else condition_grns.map(func(v): return null if v == null else v.to_model())
    ret.rate = rate
    return ret


static func from_model(model) -> Gs2BuffEzBuffTargetModel:
    var ret = Gs2BuffEzBuffTargetModel.new()
    ret.target_model_name = model.target_model_name
    ret.target_field_name = model.target_field_name
    ret.condition_grns = [] if model.condition_grns == null else model.condition_grns.map(func(v): return Gs2BuffEzBuffTargetGrn.from_model(v))
    ret.rate = 0 if model.rate == null else model.rate
    return ret