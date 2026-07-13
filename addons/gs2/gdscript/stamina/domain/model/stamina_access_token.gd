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
class_name Gs2StaminaStaminaAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2StaminaRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var stamina_name: Variant = null
var overflow_value: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_,
    stamina_name_
):
    _gs2 = gs2
    _client = Gs2StaminaRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    stamina_name = stamina_name_


func get_(
    request: Gs2StaminaGetStaminaRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaGetStaminaMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_stamina(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func consume(
    request: Gs2StaminaConsumeStaminaRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaConsumeStaminaMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.consume_stamina(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func apply(
    request: Gs2StaminaApplyStaminaRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaApplyStaminaMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.apply_stamina(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func decrease_max_value(
    request: Gs2StaminaDecreaseMaxValueRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaDecreaseMaxValueMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.decrease_max_value(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_max_value_by_status(
    request: Gs2StaminaSetMaxValueByStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaSetMaxValueByStatusMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.set_max_value_by_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_recover_interval_by_status(
    request: Gs2StaminaSetRecoverIntervalByStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaSetRecoverIntervalByStatusMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.set_recover_interval_by_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_recover_value_by_status(
    request: Gs2StaminaSetRecoverValueByStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2StaminaSetRecoverValueByStatusMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.set_recover_value_by_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_value(
    request: Gs2StaminaVerifyStaminaValueRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaValueMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_stamina_value(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_max_value(
    request: Gs2StaminaVerifyStaminaMaxValueRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaMaxValueMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_stamina_max_value(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_recover_interval_minutes(
    request: Gs2StaminaVerifyStaminaRecoverIntervalMinutesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaRecoverIntervalMinutesMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_stamina_recover_interval_minutes(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_recover_value(
    request: Gs2StaminaVerifyStaminaRecoverValueRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaRecoverValueMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_stamina_recover_value(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_overflow_value(
    request: Gs2StaminaVerifyStaminaOverflowValueRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaOverflowValueMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_stamina_overflow_value(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2StaminaStaminaCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        stamina_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2StaminaStaminaCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        stamina_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2StaminaGetStaminaRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2StaminaStaminaCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        stamina_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2StaminaStamina",
        Gs2StaminaStaminaCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2StaminaStaminaCache.cache_key(
            stamina_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2StaminaStamina",
        Gs2StaminaStaminaCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2StaminaStaminaCache.cache_key(
            stamina_name
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