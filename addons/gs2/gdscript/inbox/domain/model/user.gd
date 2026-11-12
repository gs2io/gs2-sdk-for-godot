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
class_name Gs2InboxUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2InboxRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2InboxRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func send_message(
    request: Gs2InboxSendMessageByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InboxSendMessageByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.send_message_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InboxMessageDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func receive_global_message(
    request: Gs2InboxReceiveGlobalMessageByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InboxReceiveGlobalMessageByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.receive_global_message_by_user_id(request)
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
                null
            )
        )
        _gs2.cache.delete(
            "Gs2InboxReceived",
            Gs2InboxReceivedCache.cache_parent_key(
                namespace_name,
                user_id,
                null
            ),
            Gs2InboxReceivedCache.cache_key(
            )
        )
    var domain = []
    if result != null and result.item != null:
        for v in result.item:
            domain.append(Gs2InboxMessageDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func batch_read_messages(
    request: Gs2InboxBatchReadMessagesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2InboxBatchReadMessagesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.batch_read_messages_by_user_id(request)
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


func messages(
    is_read = null,
    time_offset_token = null
) -> Gs2InboxDescribeMessagesByUserIdIterator:
    return Gs2InboxDescribeMessagesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        is_read,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func message(
    message_name
) -> Gs2InboxMessageDomain:
    return Gs2InboxMessageDomain.new(
        _gs2,
        namespace_name,
        user_id,
        message_name
    )
func received(
) -> Gs2InboxReceivedDomain:
    return Gs2InboxReceivedDomain.new(
        _gs2,
        namespace_name,
        user_id
    )