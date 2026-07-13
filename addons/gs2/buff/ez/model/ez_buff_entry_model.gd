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
class_name Gs2BuffEzBuffEntryModel
extends RefCounted


var name = null
var metadata = null
var target_type = null
var target_model = null
var target_action = null
var expression = null
var apply_period_schedule_event_id = null


func with_name(v) -> Gs2BuffEzBuffEntryModel:
    name = v
    return self


func with_metadata(v) -> Gs2BuffEzBuffEntryModel:
    metadata = v
    return self


func with_target_type(v) -> Gs2BuffEzBuffEntryModel:
    target_type = v
    return self


func with_target_model(v) -> Gs2BuffEzBuffEntryModel:
    target_model = v
    return self


func with_target_action(v) -> Gs2BuffEzBuffEntryModel:
    target_action = v
    return self


func with_expression(v) -> Gs2BuffEzBuffEntryModel:
    expression = v
    return self


func with_apply_period_schedule_event_id(v) -> Gs2BuffEzBuffEntryModel:
    apply_period_schedule_event_id = v
    return self


func to_model() -> Gs2BuffBuffEntryModel:
    var ret = Gs2BuffBuffEntryModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.target_type = target_type
    ret.target_model = null if target_model == null else target_model.to_model()
    ret.target_action = null if target_action == null else target_action.to_model()
    ret.expression = expression
    ret.apply_period_schedule_event_id = apply_period_schedule_event_id
    return ret


static func from_model(model) -> Gs2BuffEzBuffEntryModel:
    var ret = Gs2BuffEzBuffEntryModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.target_type = model.target_type
    ret.target_model = null if model.target_model == null else Gs2BuffEzBuffTargetModel.from_model(model.target_model)
    ret.target_action = null if model.target_action == null else Gs2BuffEzBuffTargetAction.from_model(model.target_action)
    ret.expression = model.expression
    ret.apply_period_schedule_event_id = model.apply_period_schedule_event_id
    return ret