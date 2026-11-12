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
class_name Gs2NewsNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2NewsRestClient
var namespace_name: Variant = null
var status: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2NewsRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2NewsGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2NewsGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2NewsGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2NewsGetNamespaceMethodCache.invoke(
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
    request: Gs2NewsUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2NewsUpdateNamespaceMethodCache.invoke(
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
    request: Gs2NewsDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2NewsDeleteNamespaceMethodCache.invoke(
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
func current_news_master(
) -> Gs2NewsCurrentNewsMasterDomain:
    return Gs2NewsCurrentNewsMasterDomain.new(
        _gs2,
        namespace_name
    )


func progresses(
) -> Gs2NewsDescribeProgressesIterator:
    return Gs2NewsDescribeProgressesIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_progresses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2NewsProgress",
        Gs2NewsProgressCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_progresses(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2NewsProgress",
        Gs2NewsProgressCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_progresses(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2NewsProgress",
        Gs2NewsProgressCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func progress(
    upload_token
) -> Gs2NewsProgressDomain:
    return Gs2NewsProgressDomain.new(
        _gs2,
        namespace_name,
        upload_token
    )
func user(
    user_id
) -> Gs2NewsUserDomain:
    return Gs2NewsUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2NewsUserAccessTokenDomain:
    return Gs2NewsUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2NewsNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2NewsNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2NewsGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2NewsNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2NewsNamespace",
        Gs2NewsNamespaceCache.cache_parent_key(
            null
        ),
        Gs2NewsNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2NewsNamespace",
        Gs2NewsNamespaceCache.cache_parent_key(
            null
        ),
        Gs2NewsNamespaceCache.cache_key(
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