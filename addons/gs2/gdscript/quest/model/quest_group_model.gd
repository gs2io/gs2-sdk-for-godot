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
class_name Gs2QuestQuestGroupModel
extends RefCounted


var quest_group_model_id = null
var name = null
var metadata = null
var quests = null
var challenge_period_event_id = null


func with_quest_group_model_id(v) -> Gs2QuestQuestGroupModel:
    quest_group_model_id = v
    return self


func with_name(v) -> Gs2QuestQuestGroupModel:
    name = v
    return self


func with_metadata(v) -> Gs2QuestQuestGroupModel:
    metadata = v
    return self


func with_quests(v) -> Gs2QuestQuestGroupModel:
    quests = v
    return self


func with_challenge_period_event_id(v) -> Gs2QuestQuestGroupModel:
    challenge_period_event_id = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_quest_group_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("questGroupName")


static func from_dict(data) -> Gs2QuestQuestGroupModel:
    if data == null:
        return null
    var ret = Gs2QuestQuestGroupModel.new()
    ret.quest_group_model_id = null if data.get("questGroupModelId") == null else str(data.get("questGroupModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.quests = null if data.get("quests") == null else data.get("quests").map(func(v): return Gs2QuestQuestModel.from_dict(v))
    ret.challenge_period_event_id = null if data.get("challengePeriodEventId") == null else str(data.get("challengePeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["questGroupModelId"] = quest_group_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["quests"] = null if quests == null else quests.map(func(v): return null if v == null else v.to_dict())
    ret["challengePeriodEventId"] = challenge_period_event_id
    return ret