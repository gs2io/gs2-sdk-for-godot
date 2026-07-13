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
class_name Gs2MatchmakingEzSeasonModel
extends RefCounted


var name = null
var metadata = null
var maximum_participants = 0
var experience_model_id = null
var challenge_period_event_id = null


func with_name(v) -> Gs2MatchmakingEzSeasonModel:
    name = v
    return self


func with_metadata(v) -> Gs2MatchmakingEzSeasonModel:
    metadata = v
    return self


func with_maximum_participants(v) -> Gs2MatchmakingEzSeasonModel:
    maximum_participants = v
    return self


func with_experience_model_id(v) -> Gs2MatchmakingEzSeasonModel:
    experience_model_id = v
    return self


func with_challenge_period_event_id(v) -> Gs2MatchmakingEzSeasonModel:
    challenge_period_event_id = v
    return self


func to_model() -> Gs2MatchmakingSeasonModel:
    var ret = Gs2MatchmakingSeasonModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.maximum_participants = maximum_participants
    ret.experience_model_id = experience_model_id
    ret.challenge_period_event_id = challenge_period_event_id
    return ret


static func from_model(model) -> Gs2MatchmakingEzSeasonModel:
    var ret = Gs2MatchmakingEzSeasonModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.maximum_participants = 0 if model.maximum_participants == null else model.maximum_participants
    ret.experience_model_id = model.experience_model_id
    ret.challenge_period_event_id = model.challenge_period_event_id
    return ret