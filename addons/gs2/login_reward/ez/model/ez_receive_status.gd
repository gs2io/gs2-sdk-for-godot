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
class_name Gs2LoginRewardEzReceiveStatus
extends RefCounted


var bonus_model_name = null
var received_steps = []
var last_received_at = 0


func with_bonus_model_name(v) -> Gs2LoginRewardEzReceiveStatus:
    bonus_model_name = v
    return self


func with_received_steps(v) -> Gs2LoginRewardEzReceiveStatus:
    received_steps = v
    return self


func with_last_received_at(v) -> Gs2LoginRewardEzReceiveStatus:
    last_received_at = v
    return self


func to_model() -> Gs2LoginRewardReceiveStatus:
    var ret = Gs2LoginRewardReceiveStatus.new()
    ret.bonus_model_name = bonus_model_name
    ret.received_steps = null if received_steps == null else received_steps.map(func(v): return v)
    ret.last_received_at = last_received_at
    return ret


static func from_model(model) -> Gs2LoginRewardEzReceiveStatus:
    var ret = Gs2LoginRewardEzReceiveStatus.new()
    ret.bonus_model_name = model.bonus_model_name
    ret.received_steps = [] if model.received_steps == null else model.received_steps.map(func(v): return v)
    ret.last_received_at = 0 if model.last_received_at == null else model.last_received_at
    return ret