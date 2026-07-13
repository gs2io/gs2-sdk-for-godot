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
class_name Gs2IdentifierPasswordDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2IdentifierRestClient
var user_name: Variant = null
var challenge_token: Variant = null


func _init(
    gs2: Gs2Domain,
    user_name_
):
    _gs2 = gs2
    _client = Gs2IdentifierRestClient.new(gs2.rest_session)
    user_name = user_name_


func create(
    request: Gs2IdentifierCreatePasswordRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierCreatePasswordMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_password(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2IdentifierGetPasswordRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierGetPasswordMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_password(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func enable_mfa(
    request: Gs2IdentifierEnableMfaRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierEnableMfaMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.enable_mfa(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.challenge_token = null if result == null else result.challenge_token
    return Gs2AsyncResult.new(domain, null)


func challenge_mfa(
    request: Gs2IdentifierChallengeMfaRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierChallengeMfaMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.challenge_mfa(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func disable_mfa(
    request: Gs2IdentifierDisableMfaRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierDisableMfaMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.disable_mfa(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2IdentifierDeletePasswordRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    var async_result = await Gs2IdentifierDeletePasswordMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_password(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2IdentifierPasswordCache.get_cache(
        _gs2.cache,
        user_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2IdentifierPasswordCache.fetch(
        _gs2.cache,
        user_name,
        null,
        func():
            var get_result = await get_(Gs2IdentifierGetPasswordRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2IdentifierPasswordCache.delete_cache(
        _gs2.cache,
        user_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2IdentifierPassword",
        Gs2IdentifierPasswordCache.cache_parent_key(
            user_name,
            null
        ),
        Gs2IdentifierPasswordCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2IdentifierPassword",
        Gs2IdentifierPasswordCache.cache_parent_key(
            user_name,
            null
        ),
        Gs2IdentifierPasswordCache.cache_key(
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