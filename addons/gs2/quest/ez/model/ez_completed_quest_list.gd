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
class_name Gs2QuestEzCompletedQuestList
extends RefCounted


var quest_group_name = null
var complete_quest_names = []


func with_quest_group_name(v) -> Gs2QuestEzCompletedQuestList:
    quest_group_name = v
    return self


func with_complete_quest_names(v) -> Gs2QuestEzCompletedQuestList:
    complete_quest_names = v
    return self


func to_model() -> Gs2QuestCompletedQuestList:
    var ret = Gs2QuestCompletedQuestList.new()
    ret.quest_group_name = quest_group_name
    ret.complete_quest_names = null if complete_quest_names == null else complete_quest_names.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2QuestEzCompletedQuestList:
    var ret = Gs2QuestEzCompletedQuestList.new()
    ret.quest_group_name = model.quest_group_name
    ret.complete_quest_names = [] if model.complete_quest_names == null else model.complete_quest_names.map(func(v): return v)
    return ret