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
class_name Gs2QuestEzGetProgressResult
extends RefCounted


var item = null
var quest_group = null
var quest = null


static func from_model(model) -> Gs2QuestEzGetProgressResult:
    var ret = Gs2QuestEzGetProgressResult.new()
    ret.item = null if model.item == null else Gs2QuestEzProgress.from_model(model.item)
    ret.quest_group = null if model.quest_group == null else Gs2QuestEzQuestGroupModel.from_model(model.quest_group)
    ret.quest = null if model.quest == null else Gs2QuestEzQuestModel.from_model(model.quest)
    return ret