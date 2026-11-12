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
class_name Gs2LockMutexDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2LockRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var property_id: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    property_id_
):
    _gs2 = gs2
    _client = Gs2LockRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    if property_id_ != null:
        property_id_ = property_id_.replace("{region}", gs2.rest_session.region).replace("{ownerId}", "" if gs2.rest_session.owner_id == null else gs2.rest_session.owner_id).replace("{userId}", "" if user_id == null else user_id)
    property_id = property_id_


func lock(
    request: Gs2LockLockByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_property_id(property_id)
    request = request.with_user_id(user_id)
    var async_result = await Gs2LockLockByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.lock_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func unlock(
    request: Gs2LockUnlockByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_property_id(property_id)
    request = request.with_user_id(user_id)
    var async_result = await Gs2LockUnlockByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.unlock_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2LockGetMutexByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_property_id(property_id)
    var async_result = await Gs2LockGetMutexByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_mutex_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func delete(
    request: Gs2LockDeleteMutexByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_property_id(property_id)
    var async_result = await Gs2LockDeleteMutexByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_mutex_by_user_id(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2LockMutexCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        property_id,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2LockMutexCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        property_id,
        null,
        func():
            var get_result = await get_(Gs2LockGetMutexByUserIdRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2LockMutexCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        property_id,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LockMutex",
        Gs2LockMutexCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2LockMutexCache.cache_key(
            property_id
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LockMutex",
        Gs2LockMutexCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2LockMutexCache.cache_key(
            property_id
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