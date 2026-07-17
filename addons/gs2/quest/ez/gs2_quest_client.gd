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
class_name Gs2QuestClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2QuestRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2QuestRestClient.new(connection.rest_session)


func delete_progress(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestDeleteProgressRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.delete_progress(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzDeleteProgressResult.from_model(async_result.result), null)


func end(game_session, namespace_name, is_complete, rewards = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestEndRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.rewards = null if rewards == null else rewards.map(func(v): return null if v == null else v.to_model())
        request.is_complete = is_complete
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.end(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzEndResult.from_model(async_result.result), null)


func get_progress(game_session, namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestGetProgressRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_progress(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzGetProgressResult.from_model(async_result.result), null)


func start(game_session, namespace_name, quest_group_name, quest_name, force = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestStartRequest.new()
        request.namespace_name = namespace_name
        request.quest_group_name = quest_group_name
        request.quest_name = quest_name
        request.access_token = game_session.access_token.token
        request.force = force
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.start(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzStartResult.from_model(async_result.result), null)


func describe_completed_quest_lists(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestDescribeCompletedQuestListsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_completed_quest_lists(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzDescribeCompletedQuestListsResult.from_model(async_result.result), null)


func get_completed_quest_list(game_session, namespace_name, quest_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestGetCompletedQuestListRequest.new()
        request.namespace_name = namespace_name
        request.quest_group_name = quest_group_name
        request.access_token = game_session.access_token.token
        return await _rest_client.get_completed_quest_list(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzGetCompletedQuestListResult.from_model(async_result.result), null)


func get_quest_group(namespace_name, quest_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestGetQuestGroupModelRequest.new()
        request.namespace_name = namespace_name
        request.quest_group_name = quest_group_name
        return await _rest_client.get_quest_group_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzGetQuestGroupResult.from_model(async_result.result), null)


func list_quest_groups(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestDescribeQuestGroupModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_quest_group_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzListQuestGroupsResult.from_model(async_result.result), null)


func get_quest(namespace_name, quest_group_name, quest_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestGetQuestModelRequest.new()
        request.namespace_name = namespace_name
        request.quest_group_name = quest_group_name
        request.quest_name = quest_name
        return await _rest_client.get_quest_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzGetQuestResult.from_model(async_result.result), null)


func list_quests(namespace_name, quest_group_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2QuestDescribeQuestModelsRequest.new()
        request.namespace_name = namespace_name
        request.quest_group_name = quest_group_name
        return await _rest_client.describe_quest_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2QuestEzListQuestsResult.from_model(async_result.result), null)