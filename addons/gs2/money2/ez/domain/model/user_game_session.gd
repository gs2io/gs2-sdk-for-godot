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
class_name Gs2Money2EzUserGameSessionDomain
extends RefCounted


var _domain: Gs2Money2UserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var withdraw_transactions: Variant:
    get:
        return null if _domain.withdraw_transactions == null else _domain.withdraw_transactions.map(func(v): return Gs2Money2EzDepositTransaction.from_model(v))
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
    domain: Gs2Money2UserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2Money2EzSubscriptionStatusGameSessionDomain)
func allocate_subscription_status(
    receipt
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.allocate_subscription_status(
            Gs2Money2AllocateSubscriptionStatusRequest.new()
                .with_receipt(receipt)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2Money2EzSubscriptionStatusGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2Money2EzSubscriptionStatusGameSessionDomain)
func take_over_subscription_status(
    receipt
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.takeover_subscription_status(
            Gs2Money2TakeoverSubscriptionStatusRequest.new()
                .with_receipt(receipt)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2Money2EzSubscriptionStatusGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func wallets(
) -> Gs2Money2EzListIterator:
    return Gs2Money2EzListIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_wallets(
    callback: Callable
) -> int:
    return _domain.subscribe_wallets(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Money2EzWallet.from_model(v)))
    )


func unsubscribe_wallets(
    callback_id: int
) -> void:
    _domain.unsubscribe_wallets(
        callback_id
    )


func subscription_statuses(
) -> Gs2Money2EzListSubscriptionStatusesIterator:
    return Gs2Money2EzListSubscriptionStatusesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_subscription_statuses(
    callback: Callable
) -> int:
    return _domain.subscribe_subscription_statuses(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Money2EzSubscriptionStatus.from_model(v)))
    )


func unsubscribe_subscription_statuses(
    callback_id: int
) -> void:
    _domain.unsubscribe_subscription_statuses(
        callback_id
    )


func wallet(
    slot
) -> Gs2Money2EzWalletGameSessionDomain:
    return Gs2Money2EzWalletGameSessionDomain.new(
        _domain.wallet(
            slot
        ),
        _game_session,
        _connection
    )


func subscription_status(
    content_name
) -> Gs2Money2EzSubscriptionStatusGameSessionDomain:
    return Gs2Money2EzSubscriptionStatusGameSessionDomain.new(
        _domain.subscription_status(
            content_name
        ),
        _game_session,
        _connection
    )