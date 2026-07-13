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
class_name Gs2MissionEzCounterModel
extends RefCounted


var name = null
var metadata = null
var scopes = []
var challenge_period_event_id = null


func with_name(v) -> Gs2MissionEzCounterModel:
    name = v
    return self


func with_metadata(v) -> Gs2MissionEzCounterModel:
    metadata = v
    return self


func with_scopes(v) -> Gs2MissionEzCounterModel:
    scopes = v
    return self


func with_challenge_period_event_id(v) -> Gs2MissionEzCounterModel:
    challenge_period_event_id = v
    return self


func to_model() -> Gs2MissionCounterModel:
    var ret = Gs2MissionCounterModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.scopes = null if scopes == null else scopes.map(func(v): return null if v == null else v.to_model())
    ret.challenge_period_event_id = challenge_period_event_id
    return ret


static func from_model(model) -> Gs2MissionEzCounterModel:
    var ret = Gs2MissionEzCounterModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.scopes = [] if model.scopes == null else model.scopes.map(func(v): return Gs2MissionEzCounterScopeModel.from_model(v))
    ret.challenge_period_event_id = model.challenge_period_event_id
    return ret