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
class_name Gs2IdentifierIdentifierDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2IdentifierRestClient
var user_name: Variant = null
var client_id: Variant = null
var client_secret: Variant = null
var status: Variant = null


func _init(
    gs2: Gs2DomainCore,
    user_name_,
    client_id_
):
    _gs2 = gs2
    _client = Gs2IdentifierRestClient.new(gs2.rest_session)
    user_name = user_name_
    client_id = client_id_


func get_(
    request: Gs2IdentifierGetIdentifierRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    request = request.with_client_id(client_id)
    var async_result = await Gs2IdentifierGetIdentifierMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_identifier(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2IdentifierDeleteIdentifierRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    request = request.with_client_id(client_id)
    var async_result = await Gs2IdentifierDeleteIdentifierMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_identifier(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func attach_guard(
    request: Gs2IdentifierAttachGuardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    request = request.with_client_id(client_id)
    var async_result = await Gs2IdentifierAttachGuardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.attach_guard(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain: Variant = self
    return Gs2AsyncResult.new(domain, null)


func detach_guard(
    request: Gs2IdentifierDetachGuardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_user_name(user_name)
    request = request.with_client_id(client_id)
    var async_result = await Gs2IdentifierDetachGuardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.detach_guard(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain: Variant = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2IdentifierIdentifierCache.get_cache(
        _gs2.cache,
        user_name,
        client_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2IdentifierIdentifierCache.fetch(
        _gs2.cache,
        user_name,
        client_id,
        null,
        func():
            var get_result = await get_(Gs2IdentifierGetIdentifierRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2IdentifierIdentifierCache.delete_cache(
        _gs2.cache,
        user_name,
        client_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2IdentifierIdentifier",
        Gs2IdentifierIdentifierCache.cache_parent_key(
            user_name,
            null
        ),
        Gs2IdentifierIdentifierCache.cache_key(
            client_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2IdentifierIdentifier",
        Gs2IdentifierIdentifierCache.cache_parent_key(
            user_name,
            null
        ),
        Gs2IdentifierIdentifierCache.cache_key(
            client_id
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