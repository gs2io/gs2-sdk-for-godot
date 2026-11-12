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
class_name Gs2Money2UnusedBalanceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Money2RestClient
var namespace_name: Variant = null
var currency: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    currency_
):
    _gs2 = gs2
    _client = Gs2Money2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    currency = currency_


func get_(
    request: Gs2Money2GetUnusedBalanceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_currency(currency)
    var async_result = await Gs2Money2GetUnusedBalanceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_unused_balance(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2Money2UnusedBalanceCache.get_cache(
        _gs2.cache,
        namespace_name,
        currency,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Money2UnusedBalanceCache.fetch(
        _gs2.cache,
        namespace_name,
        currency,
        null,
        func():
            var get_result = await get_(Gs2Money2GetUnusedBalanceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Money2UnusedBalanceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        currency,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Money2UnusedBalance",
        Gs2Money2UnusedBalanceCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2Money2UnusedBalanceCache.cache_key(
            currency
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Money2UnusedBalance",
        Gs2Money2UnusedBalanceCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2Money2UnusedBalanceCache.cache_key(
            currency
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