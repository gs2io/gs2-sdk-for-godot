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
class_name Gs2LoginRewardEzBonusModel
extends RefCounted


var name = null
var metadata = null
var mode = null
var period_event_id = null
var reset_hour = 0
var repeat = null
var rewards = []
var missed_receive_relief = null
var missed_receive_relief_verify_actions = []
var missed_receive_relief_consume_actions = []


func with_name(v) -> Gs2LoginRewardEzBonusModel:
    name = v
    return self


func with_metadata(v) -> Gs2LoginRewardEzBonusModel:
    metadata = v
    return self


func with_mode(v) -> Gs2LoginRewardEzBonusModel:
    mode = v
    return self


func with_period_event_id(v) -> Gs2LoginRewardEzBonusModel:
    period_event_id = v
    return self


func with_reset_hour(v) -> Gs2LoginRewardEzBonusModel:
    reset_hour = v
    return self


func with_repeat(v) -> Gs2LoginRewardEzBonusModel:
    repeat = v
    return self


func with_rewards(v) -> Gs2LoginRewardEzBonusModel:
    rewards = v
    return self


func with_missed_receive_relief(v) -> Gs2LoginRewardEzBonusModel:
    missed_receive_relief = v
    return self


func with_missed_receive_relief_verify_actions(v) -> Gs2LoginRewardEzBonusModel:
    missed_receive_relief_verify_actions = v
    return self


func with_missed_receive_relief_consume_actions(v) -> Gs2LoginRewardEzBonusModel:
    missed_receive_relief_consume_actions = v
    return self


func to_model() -> Gs2LoginRewardBonusModel:
    var ret = Gs2LoginRewardBonusModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.mode = mode
    ret.period_event_id = period_event_id
    ret.reset_hour = reset_hour
    ret.repeat = repeat
    ret.rewards = null if rewards == null else rewards.map(func(v): return null if v == null else v.to_model())
    ret.missed_receive_relief = missed_receive_relief
    ret.missed_receive_relief_verify_actions = null if missed_receive_relief_verify_actions == null else missed_receive_relief_verify_actions.map(func(v): return null if v == null else v.to_model())
    ret.missed_receive_relief_consume_actions = null if missed_receive_relief_consume_actions == null else missed_receive_relief_consume_actions.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2LoginRewardEzBonusModel:
    var ret = Gs2LoginRewardEzBonusModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.mode = model.mode
    ret.period_event_id = model.period_event_id
    ret.reset_hour = 0 if model.reset_hour == null else model.reset_hour
    ret.repeat = model.repeat
    ret.rewards = [] if model.rewards == null else model.rewards.map(func(v): return Gs2LoginRewardEzReward.from_model(v))
    ret.missed_receive_relief = model.missed_receive_relief
    ret.missed_receive_relief_verify_actions = [] if model.missed_receive_relief_verify_actions == null else model.missed_receive_relief_verify_actions.map(func(v): return Gs2EzVerifyAction.from_model(v))
    ret.missed_receive_relief_consume_actions = [] if model.missed_receive_relief_consume_actions == null else model.missed_receive_relief_consume_actions.map(func(v): return Gs2EzConsumeAction.from_model(v))
    return ret