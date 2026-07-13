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
class_name Gs2Money2EzWalletGameSessionDomain
extends RefCounted


var _domain: Gs2Money2WalletAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var withdraw_transactions: Variant:
    get:
        return null if _domain.withdraw_transactions == null else _domain.withdraw_transactions.map(func(v): return Gs2Money2EzDepositTransaction.from_model(v))
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var slot: Variant:
    get:
        return null if _domain == null else _domain.slot


func _init(
    domain: Gs2Money2WalletAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2Money2EzWalletGameSessionDomain)
func withdraw(
    withdraw_count,
    paid_only = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.withdraw(
            Gs2Money2WithdrawRequest.new()
                .with_withdraw_count(withdraw_count)
                .with_paid_only(paid_only)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2Money2EzWalletGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


# 戻り値: Gs2AsyncResult (result = Gs2Money2EzWallet)
func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2Money2EzWallet.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2Money2EzWallet.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)