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
class_name Gs2BuffEzBuffTargetAction
extends RefCounted


var target_action_name = null
var target_field_name = null
var condition_grns = []
var rate = 0


func with_target_action_name(v) -> Gs2BuffEzBuffTargetAction:
    target_action_name = v
    return self


func with_target_field_name(v) -> Gs2BuffEzBuffTargetAction:
    target_field_name = v
    return self


func with_condition_grns(v) -> Gs2BuffEzBuffTargetAction:
    condition_grns = v
    return self


func with_rate(v) -> Gs2BuffEzBuffTargetAction:
    rate = v
    return self


func to_model() -> Gs2BuffBuffTargetAction:
    var ret = Gs2BuffBuffTargetAction.new()
    ret.target_action_name = target_action_name
    ret.target_field_name = target_field_name
    ret.condition_grns = null if condition_grns == null else condition_grns.map(func(v): return null if v == null else v.to_model())
    ret.rate = rate
    return ret


static func from_model(model) -> Gs2BuffEzBuffTargetAction:
    var ret = Gs2BuffEzBuffTargetAction.new()
    ret.target_action_name = model.target_action_name
    ret.target_field_name = model.target_field_name
    ret.condition_grns = [] if model.condition_grns == null else model.condition_grns.map(func(v): return Gs2BuffEzBuffTargetGrn.from_model(v))
    ret.rate = 0 if model.rate == null else model.rate
    return ret