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
class_name Gs2QuestEzQuestModel
extends RefCounted


var quest_model_id = null
var name = null
var metadata = null
var contents = []
var challenge_period_event_id = null
var first_complete_acquire_actions = []
var verify_actions = []
var consume_actions = []
var failed_acquire_actions = []
var premise_quest_names = []


func with_quest_model_id(v) -> Gs2QuestEzQuestModel:
    quest_model_id = v
    return self


func with_name(v) -> Gs2QuestEzQuestModel:
    name = v
    return self


func with_metadata(v) -> Gs2QuestEzQuestModel:
    metadata = v
    return self


func with_contents(v) -> Gs2QuestEzQuestModel:
    contents = v
    return self


func with_challenge_period_event_id(v) -> Gs2QuestEzQuestModel:
    challenge_period_event_id = v
    return self


func with_first_complete_acquire_actions(v) -> Gs2QuestEzQuestModel:
    first_complete_acquire_actions = v
    return self


func with_verify_actions(v) -> Gs2QuestEzQuestModel:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2QuestEzQuestModel:
    consume_actions = v
    return self


func with_failed_acquire_actions(v) -> Gs2QuestEzQuestModel:
    failed_acquire_actions = v
    return self


func with_premise_quest_names(v) -> Gs2QuestEzQuestModel:
    premise_quest_names = v
    return self


func to_model() -> Gs2QuestQuestModel:
    var ret = Gs2QuestQuestModel.new()
    ret.quest_model_id = quest_model_id
    ret.name = name
    ret.metadata = metadata
    ret.contents = null if contents == null else contents.map(func(v): return null if v == null else v.to_model())
    ret.challenge_period_event_id = challenge_period_event_id
    ret.first_complete_acquire_actions = null if first_complete_acquire_actions == null else first_complete_acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.verify_actions = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_model())
    ret.consume_actions = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_model())
    ret.failed_acquire_actions = null if failed_acquire_actions == null else failed_acquire_actions.map(func(v): return null if v == null else v.to_model())
    ret.premise_quest_names = null if premise_quest_names == null else premise_quest_names.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2QuestEzQuestModel:
    var ret = Gs2QuestEzQuestModel.new()
    ret.quest_model_id = model.quest_model_id
    ret.name = model.name
    ret.metadata = model.metadata
    ret.contents = [] if model.contents == null else model.contents.map(func(v): return Gs2QuestEzContents.from_model(v))
    ret.challenge_period_event_id = model.challenge_period_event_id
    ret.first_complete_acquire_actions = [] if model.first_complete_acquire_actions == null else model.first_complete_acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    ret.verify_actions = [] if model.verify_actions == null else model.verify_actions.map(func(v): return Gs2EzVerifyAction.from_model(v))
    ret.consume_actions = [] if model.consume_actions == null else model.consume_actions.map(func(v): return Gs2EzConsumeAction.from_model(v))
    ret.failed_acquire_actions = [] if model.failed_acquire_actions == null else model.failed_acquire_actions.map(func(v): return Gs2EzAcquireAction.from_model(v))
    ret.premise_quest_names = [] if model.premise_quest_names == null else model.premise_quest_names.map(func(v): return v)
    return ret