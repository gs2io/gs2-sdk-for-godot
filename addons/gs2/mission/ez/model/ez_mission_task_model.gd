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
class_name Gs2MissionEzMissionTaskModel
extends RefCounted


var name = null
var metadata = null
var verify_complete_type = null
var target_counter = null
var verify_complete_consume_actions = []
var complete_acquire_actions = []
var challenge_period_event_id = null
var premise_mission_task_name = null
var counter_name = null
var target_reset_type = null
var target_value = 0


func with_name(v) -> Gs2MissionEzMissionTaskModel:
    name = v
    return self


func with_metadata(v) -> Gs2MissionEzMissionTaskModel:
    metadata = v
    return self


func with_verify_complete_type(v) -> Gs2MissionEzMissionTaskModel:
    verify_complete_type = v
    return self


func with_target_counter(v) -> Gs2MissionEzMissionTaskModel:
    target_counter = v
    return self


func with_verify_complete_consume_actions(v) -> Gs2MissionEzMissionTaskModel:
    verify_complete_consume_actions = v
    return self


func with_complete_acquire_actions(v) -> Gs2MissionEzMissionTaskModel:
    complete_acquire_actions = v
    return self


func with_challenge_period_event_id(v) -> Gs2MissionEzMissionTaskModel:
    challenge_period_event_id = v
    return self


func with_premise_mission_task_name(v) -> Gs2MissionEzMissionTaskModel:
    premise_mission_task_name = v
    return self


func with_counter_name(v) -> Gs2MissionEzMissionTaskModel:
    counter_name = v
    return self


func with_target_reset_type(v) -> Gs2MissionEzMissionTaskModel:
    target_reset_type = v
    return self


func with_target_value(v) -> Gs2MissionEzMissionTaskModel:
    target_value = v
    return self


func to_model() -> Gs2MissionMissionTaskModel:
    var ret = Gs2MissionMissionTaskModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.verify_complete_type = verify_complete_type
    ret.target_counter = null if target_counter == null else target_counter.to_model()
    ret.verify_complete_consume_actions = null if verify_complete_consume_actions == null else verify_complete_consume_actions.map(func(v): return null if v == null else v.to_model())
    ret.complete_acquire_actions = null if complete_acquire_actions == null else complete_acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.challenge_period_event_id = challenge_period_event_id
    ret.premise_mission_task_name = premise_mission_task_name
    ret.counter_name = counter_name
    ret.target_reset_type = target_reset_type
    ret.target_value = target_value
    return ret


static func from_model(model) -> Gs2MissionEzMissionTaskModel:
    var ret = Gs2MissionEzMissionTaskModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.verify_complete_type = model.verify_complete_type
    ret.target_counter = null if model.target_counter == null else Gs2MissionEzTargetCounterModel.from_model(model.target_counter)
    ret.verify_complete_consume_actions = [] if model.verify_complete_consume_actions == null else model.verify_complete_consume_actions.map(func(v): return Gs2EzVerifyAction.from_model(v))
    ret.complete_acquire_actions = [] if model.complete_acquire_actions == null else model.complete_acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    ret.challenge_period_event_id = model.challenge_period_event_id
    ret.premise_mission_task_name = model.premise_mission_task_name
    ret.counter_name = model.counter_name
    ret.target_reset_type = model.target_reset_type
    ret.target_value = 0 if model.target_value == null else model.target_value
    return ret