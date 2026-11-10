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
class_name Gs2MissionEzComplete
extends RefCounted


var mission_group_name = null
var completed_mission_task_names = []
var received_mission_task_names = []
var next_reset_at = 0


func with_mission_group_name(v) -> Gs2MissionEzComplete:
    mission_group_name = v
    return self


func with_completed_mission_task_names(v) -> Gs2MissionEzComplete:
    completed_mission_task_names = v
    return self


func with_received_mission_task_names(v) -> Gs2MissionEzComplete:
    received_mission_task_names = v
    return self


func with_next_reset_at(v) -> Gs2MissionEzComplete:
    next_reset_at = v
    return self


func to_model() -> Gs2MissionComplete:
    var ret = Gs2MissionComplete.new()
    ret.mission_group_name = mission_group_name
    ret.completed_mission_task_names = null if completed_mission_task_names == null else completed_mission_task_names.map(func(v): return v)
    ret.received_mission_task_names = null if received_mission_task_names == null else received_mission_task_names.map(func(v): return v)
    ret.next_reset_at = next_reset_at
    return ret


static func from_model(model) -> Gs2MissionEzComplete:
    var ret = Gs2MissionEzComplete.new()
    ret.mission_group_name = model.mission_group_name
    ret.completed_mission_task_names = [] if model.completed_mission_task_names == null else model.completed_mission_task_names.map(func(v): return v)
    ret.received_mission_task_names = [] if model.received_mission_task_names == null else model.received_mission_task_names.map(func(v): return v)
    ret.next_reset_at = 0 if model.next_reset_at == null else model.next_reset_at
    return ret