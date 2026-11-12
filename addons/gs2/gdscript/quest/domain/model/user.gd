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
class_name Gs2QuestUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2QuestRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2QuestRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func create_progress(
    request: Gs2QuestCreateProgressByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2QuestCreateProgressByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.create_progress_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2QuestProgressDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func start(
    request: Gs2QuestStartByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2QuestStartByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.start_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction_by_user_id(
        _gs2,
        user_id,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)


func completed_quest_lists(
    time_offset_token = null
) -> Gs2QuestDescribeCompletedQuestListsByUserIdIterator:
    return Gs2QuestDescribeCompletedQuestListsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_completed_quest_lists(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2QuestCompletedQuestList",
        Gs2QuestCompletedQuestListCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_completed_quest_lists(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2QuestCompletedQuestList",
        Gs2QuestCompletedQuestListCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_completed_quest_lists(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2QuestCompletedQuestList",
        Gs2QuestCompletedQuestListCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func completed_quest_list(
    quest_group_name
) -> Gs2QuestCompletedQuestListDomain:
    return Gs2QuestCompletedQuestListDomain.new(
        _gs2,
        namespace_name,
        user_id,
        quest_group_name
    )


func progresses(
    time_offset_token = null
) -> Gs2QuestDescribeProgressesByUserIdIterator:
    return Gs2QuestDescribeProgressesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_progresses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2QuestProgress",
        Gs2QuestProgressCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_progresses(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2QuestProgress",
        Gs2QuestProgressCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_progresses(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2QuestProgress",
        Gs2QuestProgressCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func progress(
) -> Gs2QuestProgressDomain:
    return Gs2QuestProgressDomain.new(
        _gs2,
        namespace_name,
        user_id
    )