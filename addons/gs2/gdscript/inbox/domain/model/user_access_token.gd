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
# deny overwrite
class_name Gs2InboxUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2InboxRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2InboxRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func receive_global_message(
    request: Gs2InboxReceiveGlobalMessageRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2InboxReceiveGlobalMessageMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.receive_global_message(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    if async_result.error == null:
        _gs2.cache.clear_list_cache(
            "Gs2InboxMessage",
            Gs2InboxMessageCache.cache_parent_key(
                namespace_name,
                user_id,
                (null if access_token == null else access_token.time_offset)
            )
        )
        _gs2.cache.delete(
            "Gs2InboxReceived",
            Gs2InboxReceivedCache.cache_parent_key(
                namespace_name,
                user_id,
                (null if access_token == null else access_token.time_offset)
            ),
            Gs2InboxReceivedCache.cache_key(
            )
        )
    var domain = []
    if result != null and result.item != null:
        for v in result.item:
            domain.append(Gs2InboxMessageAccessTokenDomain.new(
                _gs2,
                namespace_name,
                access_token,
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func batch_read_messages(
    request: Gs2InboxBatchReadMessagesRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    if speculative_execute:
        var speculative_result = await Gs2InboxBatchReadMessagesByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2InboxBatchReadMessagesByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2InboxBatchReadMessagesMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.batch_read_messages(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    # diff +++ start
    var read_acquire_actions_count = 0
    for v in (result.items if result.items != null else []):
        read_acquire_actions_count += v.read_acquire_actions.size() if v.read_acquire_actions != null else 0
    if read_acquire_actions_count == 0:
        return Gs2AsyncResult.new(null, null)
    # diff +++ end
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


func messages(
    is_read = null
) -> Gs2InboxDescribeMessagesIterator:
    return Gs2InboxDescribeMessagesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        is_read
    )


func subscribe_messages(
    callback: Callable,
    is_read = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InboxMessage",
        Gs2InboxMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_messages(
    callback_id: int,
    is_read = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InboxMessage",
        Gs2InboxMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_messages(
    is_read = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InboxMessage",
        Gs2InboxMessageCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func message(
    message_name
) -> Gs2InboxMessageAccessTokenDomain:
    return Gs2InboxMessageAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        message_name
    )
func received(
) -> Gs2InboxReceivedAccessTokenDomain:
    return Gs2InboxReceivedAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token
    )