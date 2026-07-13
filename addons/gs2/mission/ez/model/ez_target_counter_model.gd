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
class_name Gs2MissionEzTargetCounterModel
extends RefCounted


var counter_name = null
var scope_type = null
var reset_type = null
var condition_name = null
var value = 0


func with_counter_name(v) -> Gs2MissionEzTargetCounterModel:
    counter_name = v
    return self


func with_scope_type(v) -> Gs2MissionEzTargetCounterModel:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionEzTargetCounterModel:
    reset_type = v
    return self


func with_condition_name(v) -> Gs2MissionEzTargetCounterModel:
    condition_name = v
    return self


func with_value(v) -> Gs2MissionEzTargetCounterModel:
    value = v
    return self


func to_model() -> Gs2MissionTargetCounterModel:
    var ret = Gs2MissionTargetCounterModel.new()
    ret.counter_name = counter_name
    ret.scope_type = scope_type
    ret.reset_type = reset_type
    ret.condition_name = condition_name
    ret.value = value
    return ret


static func from_model(model) -> Gs2MissionEzTargetCounterModel:
    var ret = Gs2MissionEzTargetCounterModel.new()
    ret.counter_name = model.counter_name
    ret.scope_type = model.scope_type
    ret.reset_type = model.reset_type
    ret.condition_name = model.condition_name
    ret.value = 0 if model.value == null else model.value
    return ret