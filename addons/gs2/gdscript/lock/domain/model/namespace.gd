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
class_name Gs2LockNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2LockRestClient
var namespace_name: Variant = null
var status: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2LockRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2LockGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LockGetNamespaceStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2LockGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LockGetNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2LockUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LockUpdateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2LockDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2LockDeleteNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_namespace(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)
func user(
    user_id
) -> Gs2LockUserDomain:
    return Gs2LockUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2LockUserAccessTokenDomain:
    return Gs2LockUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2LockNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2LockNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2LockGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2LockNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LockNamespace",
        Gs2LockNamespaceCache.cache_parent_key(
            null
        ),
        Gs2LockNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LockNamespace",
        Gs2LockNamespaceCache.cache_parent_key(
            null
        ),
        Gs2LockNamespaceCache.cache_key(
            namespace_name
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