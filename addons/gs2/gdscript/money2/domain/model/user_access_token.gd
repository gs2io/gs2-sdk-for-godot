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
class_name Gs2Money2UserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var withdraw_transactions: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func verify_receipt(
    request: Gs2Money2VerifyReceiptRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2Money2VerifyReceiptMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_receipt(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2EventAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.transaction_id)
    )
    return Gs2AsyncResult.new(domain, null)


func allocate_subscription_status(
    request: Gs2Money2AllocateSubscriptionStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2Money2AllocateSubscriptionStatusMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.allocate_subscription_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2SubscriptionStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.content_name)
    )
    return Gs2AsyncResult.new(domain, null)


func takeover_subscription_status(
    request: Gs2Money2TakeoverSubscriptionStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2Money2TakeoverSubscriptionStatusMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.takeover_subscription_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Money2SubscriptionStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.content_name)
    )
    return Gs2AsyncResult.new(domain, null)


func wallets(
) -> Gs2Money2DescribeWalletsIterator:
    return Gs2Money2DescribeWalletsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_wallets(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2Wallet",
        Gs2Money2WalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func wallet(
    slot
) -> Gs2Money2WalletAccessTokenDomain:
    return Gs2Money2WalletAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        slot
    )
func event(
    transaction_id
) -> Gs2Money2EventAccessTokenDomain:
    return Gs2Money2EventAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        transaction_id
    )


func subscription_statuses(
) -> Gs2Money2DescribeSubscriptionStatusesIterator:
    return Gs2Money2DescribeSubscriptionStatusesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_subscription_statuses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Money2SubscriptionStatus",
        Gs2Money2SubscriptionStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func subscription_status(
    content_name
) -> Gs2Money2SubscriptionStatusAccessTokenDomain:
    return Gs2Money2SubscriptionStatusAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        content_name
    )