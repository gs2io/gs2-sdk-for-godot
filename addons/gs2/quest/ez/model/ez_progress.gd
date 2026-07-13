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
class_name Gs2QuestEzProgress
extends RefCounted


var progress_id = null
var transaction_id = null
var quest_model_id = null
var random_seed = 0
var metadata = null
var rewards = []
var failed_rewards = []


func with_progress_id(v) -> Gs2QuestEzProgress:
    progress_id = v
    return self


func with_transaction_id(v) -> Gs2QuestEzProgress:
    transaction_id = v
    return self


func with_quest_model_id(v) -> Gs2QuestEzProgress:
    quest_model_id = v
    return self


func with_random_seed(v) -> Gs2QuestEzProgress:
    random_seed = v
    return self


func with_metadata(v) -> Gs2QuestEzProgress:
    metadata = v
    return self


func with_rewards(v) -> Gs2QuestEzProgress:
    rewards = v
    return self


func with_failed_rewards(v) -> Gs2QuestEzProgress:
    failed_rewards = v
    return self


func to_model() -> Gs2QuestProgress:
    var ret = Gs2QuestProgress.new()
    ret.progress_id = progress_id
    ret.transaction_id = transaction_id
    ret.quest_model_id = quest_model_id
    ret.random_seed = random_seed
    ret.metadata = metadata
    ret.rewards = null if rewards == null else rewards.map(func(v): return null if v == null else v.to_model())
    ret.failed_rewards = null if failed_rewards == null else failed_rewards.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2QuestEzProgress:
    var ret = Gs2QuestEzProgress.new()
    ret.progress_id = model.progress_id
    ret.transaction_id = model.transaction_id
    ret.quest_model_id = model.quest_model_id
    ret.random_seed = 0 if model.random_seed == null else model.random_seed
    ret.metadata = model.metadata
    ret.rewards = [] if model.rewards == null else model.rewards.map(func(v): return Gs2QuestEzReward.from_model(v))
    ret.failed_rewards = [] if model.failed_rewards == null else model.failed_rewards.map(func(v): return Gs2QuestEzReward.from_model(v))
    return ret