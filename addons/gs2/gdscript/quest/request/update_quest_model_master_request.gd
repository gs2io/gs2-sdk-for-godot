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
class_name Gs2QuestUpdateQuestModelMasterRequest
extends Gs2Request


var namespace_name = null
var quest_group_name = null
var quest_name = null
var description = null
var metadata = null
var contents = null
var challenge_period_event_id = null
var first_complete_acquire_actions = null
var verify_actions = null
var consume_actions = null
var failed_acquire_actions = null
var premise_quest_names = null


func with_namespace_name(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    namespace_name = v
    return self


func with_quest_group_name(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    quest_group_name = v
    return self


func with_quest_name(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    quest_name = v
    return self


func with_description(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    metadata = v
    return self


func with_contents(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    contents = v
    return self


func with_challenge_period_event_id(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    challenge_period_event_id = v
    return self


func with_first_complete_acquire_actions(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    first_complete_acquire_actions = v
    return self


func with_verify_actions(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    verify_actions = v
    return self


func with_consume_actions(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    consume_actions = v
    return self


func with_failed_acquire_actions(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    failed_acquire_actions = v
    return self


func with_premise_quest_names(v) -> Gs2QuestUpdateQuestModelMasterRequest:
    premise_quest_names = v
    return self


static func from_dict(data) -> Gs2QuestUpdateQuestModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2QuestUpdateQuestModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.quest_group_name = null if data.get("questGroupName") == null else str(data.get("questGroupName"))
    ret.quest_name = null if data.get("questName") == null else str(data.get("questName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
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
    ret["namespaceName"] = namespace_name
    ret["questGroupName"] = quest_group_name
    ret["questName"] = quest_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["contents"] = null if contents == null else contents.map(func(v): return null if v == null else v.to_dict())
    ret["challengePeriodEventId"] = challenge_period_event_id
    ret["firstCompleteAcquireActions"] = null if first_complete_acquire_actions == null else first_complete_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["verifyActions"] = null if verify_actions == null else verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["consumeActions"] = null if consume_actions == null else consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["failedAcquireActions"] = null if failed_acquire_actions == null else failed_acquire_actions.map(func(v): return null if v == null else v.to_dict())
    ret["premiseQuestNames"] = premise_quest_names
    return ret