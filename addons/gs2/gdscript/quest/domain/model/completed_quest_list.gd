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
class_name Gs2QuestCompletedQuestListDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2QuestRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var quest_group_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    quest_group_name_
):
    _gs2 = gs2
    _client = Gs2QuestRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    quest_group_name = quest_group_name_


func get_(
    request: Gs2QuestGetCompletedQuestListByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_quest_group_name(quest_group_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2QuestGetCompletedQuestListByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_completed_quest_list_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2QuestDeleteCompletedQuestListByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_quest_group_name(quest_group_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2QuestDeleteCompletedQuestListByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_completed_quest_list_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2QuestCompletedQuestListCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        quest_group_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2QuestCompletedQuestListCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        quest_group_name,
        null,
        func():
            var get_result = await get_(Gs2QuestGetCompletedQuestListByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2QuestCompletedQuestListCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        quest_group_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2QuestCompletedQuestList",
        Gs2QuestCompletedQuestListCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2QuestCompletedQuestListCache.cache_key(
            quest_group_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2QuestCompletedQuestList",
        Gs2QuestCompletedQuestListCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2QuestCompletedQuestListCache.cache_key(
            quest_group_name
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)