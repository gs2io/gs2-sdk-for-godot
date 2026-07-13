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
class_name Gs2QuestGetProgressByUserIdResult
extends RefCounted


var item = null
var quest_group = null
var quest = null
var metadata = null


func with_item(v) -> Gs2QuestGetProgressByUserIdResult:
    item = v
    return self


func with_quest_group(v) -> Gs2QuestGetProgressByUserIdResult:
    quest_group = v
    return self


func with_quest(v) -> Gs2QuestGetProgressByUserIdResult:
    quest = v
    return self


func with_metadata(v) -> Gs2QuestGetProgressByUserIdResult:
    metadata = v
    return self


static func from_dict(data) -> Gs2QuestGetProgressByUserIdResult:
    if data == null:
        return null
    var ret = Gs2QuestGetProgressByUserIdResult.new()
    ret.item = null if data.get("item") == null else Gs2QuestProgress.from_dict(data.get("item"))
    ret.quest_group = null if data.get("questGroup") == null else Gs2QuestQuestGroupModel.from_dict(data.get("questGroup"))
    ret.quest = null if data.get("quest") == null else Gs2QuestQuestModel.from_dict(data.get("quest"))
    ret.metadata = null if data.get("metadata") == null else Gs2ResultMetadata.from_dict(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["item"] = null if item == null else item.to_dict()
    ret["questGroup"] = null if quest_group == null else quest_group.to_dict()
    ret["quest"] = null if quest == null else quest.to_dict()
    ret["metadata"] = null if metadata == null else metadata.to_dict()
    return ret