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
class_name Gs2InboxNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2InboxRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2InboxRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2InboxGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InboxGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2InboxGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InboxGetNamespaceMethodCache.invoke(
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
    request: Gs2InboxUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InboxUpdateNamespaceMethodCache.invoke(
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
    request: Gs2InboxDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InboxDeleteNamespaceMethodCache.invoke(
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


func create_global_message_master(
    request: Gs2InboxCreateGlobalMessageMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2InboxCreateGlobalMessageMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_global_message_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2InboxGlobalMessageMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func user(
    user_id
) -> Gs2InboxUserDomain:
    return Gs2InboxUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2InboxUserAccessTokenDomain:
    return Gs2InboxUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )
func current_message_master(
) -> Gs2InboxCurrentMessageMasterDomain:
    return Gs2InboxCurrentMessageMasterDomain.new(
        _gs2,
        namespace_name
    )


func global_messages(
) -> Gs2InboxDescribeGlobalMessagesIterator:
    return Gs2InboxDescribeGlobalMessagesIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_global_messages(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InboxGlobalMessage",
        Gs2InboxGlobalMessageCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_global_messages(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InboxGlobalMessage",
        Gs2InboxGlobalMessageCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_global_messages(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InboxGlobalMessage",
        Gs2InboxGlobalMessageCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func global_message(
    global_message_name
) -> Gs2InboxGlobalMessageDomain:
    return Gs2InboxGlobalMessageDomain.new(
        _gs2,
        namespace_name,
        global_message_name
    )


func global_message_masters(
    name_prefix = null
) -> Gs2InboxDescribeGlobalMessageMastersIterator:
    return Gs2InboxDescribeGlobalMessageMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_global_message_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2InboxGlobalMessageMaster",
        Gs2InboxGlobalMessageMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_global_message_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2InboxGlobalMessageMaster",
        Gs2InboxGlobalMessageMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_global_message_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2InboxGlobalMessageMaster",
        Gs2InboxGlobalMessageMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func global_message_master(
    global_message_name
) -> Gs2InboxGlobalMessageMasterDomain:
    return Gs2InboxGlobalMessageMasterDomain.new(
        _gs2,
        namespace_name,
        global_message_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2InboxNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2InboxNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2InboxGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2InboxNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2InboxNamespace",
        Gs2InboxNamespaceCache.cache_parent_key(
            null
        ),
        Gs2InboxNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2InboxNamespace",
        Gs2InboxNamespaceCache.cache_parent_key(
            null
        ),
        Gs2InboxNamespaceCache.cache_key(
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