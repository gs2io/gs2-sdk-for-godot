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
class_name Gs2MoneyWalletDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MoneyRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var slot: Variant = null
var price: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    slot_
):
    _gs2 = gs2
    _client = Gs2MoneyRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    slot = slot_


func get_(
    request: Gs2MoneyGetWalletByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_slot(slot)
    var async_result = await Gs2MoneyGetWalletByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_wallet_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func deposit(
    request: Gs2MoneyDepositByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_slot(slot)
    var async_result = await Gs2MoneyDepositByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.deposit_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func withdraw(
    request: Gs2MoneyWithdrawByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_slot(slot)
    var async_result = await Gs2MoneyWithdrawByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.withdraw_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.price = null if result == null else result.price
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2MoneyWalletCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        slot,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MoneyWalletCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        slot,
        null,
        func():
            var get_result = await get_(Gs2MoneyGetWalletByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MoneyWalletCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        slot,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MoneyWallet",
        Gs2MoneyWalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2MoneyWalletCache.cache_key(
            slot
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MoneyWallet",
        Gs2MoneyWalletCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2MoneyWalletCache.cache_key(
            slot
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