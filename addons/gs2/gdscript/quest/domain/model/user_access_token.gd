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
class_name Gs2QuestUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2QuestRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2QuestRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func start(
    request: Gs2QuestStartRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    if speculative_execute:
        var speculative_result = await Gs2QuestStartByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2QuestStartByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2QuestStartMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.start(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction(
        _gs2,
        access_token,
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
) -> Gs2QuestDescribeCompletedQuestListsIterator:
    return Gs2QuestDescribeCompletedQuestListsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_completed_quest_lists(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2QuestCompletedQuestList",
        Gs2QuestCompletedQuestListCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func completed_quest_list(
    quest_group_name
) -> Gs2QuestCompletedQuestListAccessTokenDomain:
    return Gs2QuestCompletedQuestListAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        quest_group_name
    )
func progress(
) -> Gs2QuestProgressAccessTokenDomain:
    return Gs2QuestProgressAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )