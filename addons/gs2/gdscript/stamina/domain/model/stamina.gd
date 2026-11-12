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
class_name Gs2StaminaStaminaDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2StaminaRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var stamina_name: Variant = null
var overflow_value: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    stamina_name_
):
    _gs2 = gs2
    _client = Gs2StaminaRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    stamina_name = stamina_name_


func get_(
    request: Gs2StaminaGetStaminaByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaGetStaminaByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_stamina_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2StaminaUpdateStaminaByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaUpdateStaminaByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.update_stamina_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func consume(
    request: Gs2StaminaConsumeStaminaByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaConsumeStaminaByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.consume_stamina_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func apply(
    request: Gs2StaminaApplyStaminaByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaApplyStaminaByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.apply_stamina_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func recover(
    request: Gs2StaminaRecoverStaminaByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaRecoverStaminaByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.recover_stamina_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.overflow_value = null if result == null else result.overflow_value
    return Gs2AsyncResult.new(domain, null)


func raise_max_value(
    request: Gs2StaminaRaiseMaxValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaRaiseMaxValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.raise_max_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func decrease_max_value(
    request: Gs2StaminaDecreaseMaxValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaDecreaseMaxValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.decrease_max_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_max_value(
    request: Gs2StaminaSetMaxValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaSetMaxValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_max_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_recover_interval(
    request: Gs2StaminaSetRecoverIntervalByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaSetRecoverIntervalByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_recover_interval_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func set_recover_value(
    request: Gs2StaminaSetRecoverValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaSetRecoverValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.set_recover_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2StaminaDeleteStaminaByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_stamina_name(stamina_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2StaminaDeleteStaminaByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_stamina_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_value(
    request: Gs2StaminaVerifyStaminaValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_stamina_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_max_value(
    request: Gs2StaminaVerifyStaminaMaxValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaMaxValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_stamina_max_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_recover_interval_minutes(
    request: Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaRecoverIntervalMinutesByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_stamina_recover_interval_minutes_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_recover_value(
    request: Gs2StaminaVerifyStaminaRecoverValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaRecoverValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_stamina_recover_value_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify_overflow_value(
    request: Gs2StaminaVerifyStaminaOverflowValueByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_stamina_name(stamina_name)
    var async_result = await Gs2StaminaVerifyStaminaOverflowValueByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_stamina_overflow_value_by_user_id(request)
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
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2StaminaStaminaCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        stamina_name,
        null,
        func():
            var get_result = await get_(Gs2StaminaGetStaminaByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2StaminaStaminaCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        stamina_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2StaminaStamina",
        Gs2StaminaStaminaCache.cache_parent_key(
            namespace_name,
            user_id,
            null
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
            null
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