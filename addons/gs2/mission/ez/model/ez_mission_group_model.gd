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
class_name Gs2MissionEzMissionGroupModel
extends RefCounted


var name = null
var metadata = null
var tasks = []
var reset_type = null
var reset_day_of_month = 0
var reset_day_of_week = null
var reset_hour = 0
var complete_notification_namespace_id = null


func with_name(v) -> Gs2MissionEzMissionGroupModel:
    name = v
    return self


func with_metadata(v) -> Gs2MissionEzMissionGroupModel:
    metadata = v
    return self


func with_tasks(v) -> Gs2MissionEzMissionGroupModel:
    tasks = v
    return self


func with_reset_type(v) -> Gs2MissionEzMissionGroupModel:
    reset_type = v
    return self


func with_reset_day_of_month(v) -> Gs2MissionEzMissionGroupModel:
    reset_day_of_month = v
    return self


func with_reset_day_of_week(v) -> Gs2MissionEzMissionGroupModel:
    reset_day_of_week = v
    return self


func with_reset_hour(v) -> Gs2MissionEzMissionGroupModel:
    reset_hour = v
    return self


func with_complete_notification_namespace_id(v) -> Gs2MissionEzMissionGroupModel:
    complete_notification_namespace_id = v
    return self


func to_model() -> Gs2MissionMissionGroupModel:
    var ret = Gs2MissionMissionGroupModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.tasks = null if tasks == null else tasks.map(func(v): return null if v == null else v.to_model())
    ret.reset_type = reset_type
    ret.reset_day_of_month = reset_day_of_month
    ret.reset_day_of_week = reset_day_of_week
    ret.reset_hour = reset_hour
    ret.complete_notification_namespace_id = complete_notification_namespace_id
    return ret


static func from_model(model) -> Gs2MissionEzMissionGroupModel:
    var ret = Gs2MissionEzMissionGroupModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.tasks = [] if model.tasks == null else model.tasks.map(func(v): return Gs2MissionEzMissionTaskModel.from_model(v))
    ret.reset_type = model.reset_type
    ret.reset_day_of_month = 0 if model.reset_day_of_month == null else model.reset_day_of_month
    ret.reset_day_of_week = model.reset_day_of_week
    ret.reset_hour = 0 if model.reset_hour == null else model.reset_hour
    ret.complete_notification_namespace_id = model.complete_notification_namespace_id
    return ret