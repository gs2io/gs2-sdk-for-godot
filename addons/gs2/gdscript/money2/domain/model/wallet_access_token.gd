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
class_name Gs2Money2WalletAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var slot: Variant = null
var withdraw_transactions: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    slot_
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    slot = slot_


func get_(
    request: Gs2Money2GetWalletRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_slot(slot)
    var async_result = await Gs2Money2GetWalletMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_wallet(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func withdraw(
    request: Gs2Money2WithdrawRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_slot(slot)
    var async_result = await Gs2Money2WithdrawMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.withdraw(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    self.withdraw_transactions = result.withdraw_transactions  # diff +++
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2Money2WalletCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
# diff --- start
#        slot,
# diff --- end
        0 if slot == null else slot,  # diff +++
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Money2WalletCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
# diff --- start
#        slot,
# diff --- end
        0 if slot == null else slot,  # diff +++
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2Money2GetWalletRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Money2WalletCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
# diff --- start
#        slot,
# diff --- end
        0 if slot == null else slot,  # diff +++
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Money2Wallet",
        Gs2Money2WalletCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2Money2WalletCache.cache_key(
# diff --- start
#            slot
# diff --- end
            0 if slot == null else slot  # diff +++
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Money2Wallet",
        Gs2Money2WalletCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2Money2WalletCache.cache_key(
# diff --- start
#            slot
# diff --- end
            0 if slot == null else slot  # diff +++
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