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
class_name Gs2QuestEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2QuestUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2QuestUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2EzTransactionDomain)
func start(
    quest_group_name,
    quest_name,
    force = null,
    config = null,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.start(
            Gs2QuestStartRequest.new()
                .with_quest_group_name(quest_group_name)
                .with_quest_name(quest_name)
                .with_force(force)
                .with_config(null if config == null else config.map(func(v): return null if v == null else v.to_model())),
            speculative_execute
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2EzTransactionDomain.new(async_result.result), null)


func completed_quest_lists(
) -> Gs2QuestEzDescribeCompletedQuestListsIterator:
    return Gs2QuestEzDescribeCompletedQuestListsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_completed_quest_lists(
    callback: Callable
) -> int:
    return _domain.subscribe_completed_quest_lists(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2QuestEzCompletedQuestList.from_model(v)))
    )


func unsubscribe_completed_quest_lists(
    callback_id: int
) -> void:
    _domain.unsubscribe_completed_quest_lists(
        callback_id
    )


func completed_quest_list(
    quest_group_name
) -> Gs2QuestEzCompletedQuestListGameSessionDomain:
    return Gs2QuestEzCompletedQuestListGameSessionDomain.new(
        _domain.completed_quest_list(
            quest_group_name
        ),
        _game_session,
        _connection
    )


func progress(
) -> Gs2QuestEzProgressGameSessionDomain:
    return Gs2QuestEzProgressGameSessionDomain.new(
        _domain.progress(
        ),
        _game_session,
        _connection
    )