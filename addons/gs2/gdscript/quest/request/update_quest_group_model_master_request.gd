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
class_name Gs2QuestUpdateQuestGroupModelMasterRequest
extends Gs2Request


var namespace_name = null
var quest_group_name = null
var description = null
var metadata = null
var challenge_period_event_id = null


func with_namespace_name(v) -> Gs2QuestUpdateQuestGroupModelMasterRequest:
    namespace_name = v
    return self


func with_quest_group_name(v) -> Gs2QuestUpdateQuestGroupModelMasterRequest:
    quest_group_name = v
    return self


func with_description(v) -> Gs2QuestUpdateQuestGroupModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2QuestUpdateQuestGroupModelMasterRequest:
    metadata = v
    return self


func with_challenge_period_event_id(v) -> Gs2QuestUpdateQuestGroupModelMasterRequest:
    challenge_period_event_id = v
    return self


static func from_dict(data) -> Gs2QuestUpdateQuestGroupModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2QuestUpdateQuestGroupModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.quest_group_name = null if data.get("questGroupName") == null else str(data.get("questGroupName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.challenge_period_event_id = null if data.get("challengePeriodEventId") == null else str(data.get("challengePeriodEventId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["questGroupName"] = quest_group_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["challengePeriodEventId"] = challenge_period_event_id
    return ret