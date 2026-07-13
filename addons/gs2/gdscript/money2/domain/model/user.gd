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
class_name Gs2Money2UserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var user_id: Variant = null
var withdraw_transactions: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func verify_receipt(
    request: Gs2Money2VerifyReceiptByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Money2VerifyReceiptByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_receipt_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2EventDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.transaction_id)
    )
    return Gs2AsyncResult.new(domain, null)


func allocate_subscription_status(
    request: Gs2Money2AllocateSubscriptionStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Money2AllocateSubscriptionStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.allocate_subscription_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2SubscriptionStatusDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.content_name)
    )
    return Gs2AsyncResult.new(domain, null)


func takeover_subscription_status(
    request: Gs2Money2TakeoverSubscriptionStatusByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2Money2TakeoverSubscriptionStatusByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.takeover_subscription_status_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2SubscriptionStatusDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.content_name)
    )
    return Gs2AsyncResult.new(domain, null)


func wallets(
    time_offset_token = null
) -> Gs2Money2DescribeWalletsByUserIdIterator:
    return Gs2Money2DescribeWalletsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_wallets(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2Wallet",
        Gs2Money2WalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_wallets(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2Wallet",
        Gs2Money2WalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_wallets(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2Wallet",
        Gs2Money2WalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func wallet(
    slot
) -> Gs2Money2WalletDomain:
    return Gs2Money2WalletDomain.new(
        _gs2,
        namespace_name,
        user_id,
        slot
    )


func events(
    begin = null,
    end = null,
    time_offset_token = null
) -> Gs2Money2DescribeEventsByUserIdIterator:
    return Gs2Money2DescribeEventsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        begin,
        end,
        time_offset_token
    )


func subscribe_events(
    callback: Callable,
    begin = null,
    end = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2Event",
        Gs2Money2EventCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_events(
    callback_id: int,
    begin = null,
    end = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2Event",
        Gs2Money2EventCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_events(
    begin = null,
    end = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2Event",
        Gs2Money2EventCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func event(
    transaction_id
) -> Gs2Money2EventDomain:
    return Gs2Money2EventDomain.new(
        _gs2,
        namespace_name,
        user_id,
        transaction_id
    )


func subscription_statuses(
    time_offset_token = null
) -> Gs2Money2DescribeSubscriptionStatusesByUserIdIterator:
    return Gs2Money2DescribeSubscriptionStatusesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_subscription_statuses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2SubscriptionStatus",
        Gs2Money2SubscriptionStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_subscription_statuses(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Money2SubscriptionStatus",
        Gs2Money2SubscriptionStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_subscription_statuses(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Money2SubscriptionStatus",
        Gs2Money2SubscriptionStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func subscription_status(
    content_name
) -> Gs2Money2SubscriptionStatusDomain:
    return Gs2Money2SubscriptionStatusDomain.new(
        _gs2,
        namespace_name,
        user_id,
        content_name
    )