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
class_name Gs2QuestQuestModel
extends RefCounted


var quest_model_id = null
var name = null
var metadata = null
var contents = null
var challenge_period_event_id = null
var first_complete_acquire_actions = null
var verify_actions = null
var consume_actions = null
var failed_acquire_actions = null
var premise_quest_names = null


func with_quest_model_id(v) -> Gs2QuestQuestModel:
    quest_model_id = v
    return self


func with_name(v) -> Gs2QuestQuestModel:
    name = v
    return self


func with_metadata(v) -> Gs2QuestQuestModel:
    metadata = v
    return self


func with_contents(v) -> Gs2QuestQuestModel:
    contents = v
    return self


func with_challenge_period_event_id(v) -> Gs2QuestQuestModel:
    challenge_period_event_id = v
    return self


func with_first_complete_acquire_actions(v) -> Gs2QuestQuestModel:
    first_complete_acquire_actions = v
    return self


func with_verify_actions(v) -> Gs2QuestQuestModel:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2QuestQuestModel:
    consume_actions = v
    return self


func with_failed_acquire_actions(v) -> Gs2QuestQuestModel:
    failed_acquire_actions = v
    return self


func with_premise_quest_names(v) -> Gs2QuestQuestModel:
    premise_quest_names = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+):quest:(?<questName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+):quest:(?<questName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+):quest:(?<questName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_quest_group_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+):quest:(?<questName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("questGroupName")


static func get_quest_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):quest:(?<namespaceName>.+):group:(?<questGroupName>.+):quest:(?<questName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("questName")


static func from_dict(data) -> Gs2QuestQuestModel:
    if data == null:
        return null
    var ret = Gs2QuestQuestModel.new()
    ret.quest_model_id = null if data.get("questModelId") == null else str(data.get("questModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.contents = null if data.get("contents") == null else data.get("contents").map(func(v): return Gs2QuestContents.from_dict(v))
    ret.challenge_period_event_id = null if data.get("challengePeriodEventId") == null else str(data.get("challengePeriodEventId"))
    ret.first_complete_acquire_actions = null if data.get("firstCompleteAcquireActions") == null else data.get("firstCompleteAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.verify_actions = null if data.get("verifyActions") == null else data.get("verifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.consume_actions = null if data.get("consumeActions") == null else data.get("consumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.failed_acquire_actions = null if data.get("failedAcquireActions") == null else data.get("failedAcquireActions").map(func(v): return Gs2AcquireAction.from_dict(v))
    ret.premise_quest_names = null if data.get("premiseQuestNames") == null else data.get("premiseQuestNames").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["questModelId"] = quest_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["contents"] = null if contents == null else contents.map(func(v): return null if v == null else v.to_dict())
    ret["challengePeriodEventId"] = challenge_period_event_id
    ret["firstCompleteAcquireActions"] = null if first_complete_acquire_actions == null else first_complete_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["failedAcquireActions"] = null if failed_acquire_actions == null else failed_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["premiseQuestNames"] = premise_quest_names
    return ret