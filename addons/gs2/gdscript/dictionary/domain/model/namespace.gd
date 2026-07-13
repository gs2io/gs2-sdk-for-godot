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
class_name Gs2DictionaryNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DictionaryRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2DictionaryRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2DictionaryGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2DictionaryGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryGetNamespaceMethodCache.invoke(
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
    request: Gs2DictionaryUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryUpdateNamespaceMethodCache.invoke(
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
    request: Gs2DictionaryDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryDeleteNamespaceMethodCache.invoke(
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


func create_entry_model_master(
    request: Gs2DictionaryCreateEntryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryCreateEntryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_entry_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DictionaryEntryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func get_entry_model_master(
    request: Gs2DictionaryGetEntryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryGetEntryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_entry_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update_entry_model_master(
    request: Gs2DictionaryUpdateEntryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryUpdateEntryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_entry_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DictionaryEntryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func delete_entry_model_master(
    request: Gs2DictionaryDeleteEntryModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DictionaryDeleteEntryModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_entry_model_master(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DictionaryEntryModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_entry_master(
) -> Gs2DictionaryCurrentEntryMasterDomain:
    return Gs2DictionaryCurrentEntryMasterDomain.new(
        _gs2,
        namespace_name
    )


func entry_models(
) -> Gs2DictionaryDescribeEntryModelsIterator:
    return Gs2DictionaryDescribeEntryModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_entry_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DictionaryEntryModel",
        Gs2DictionaryEntryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_entry_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DictionaryEntryModel",
        Gs2DictionaryEntryModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_entry_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DictionaryEntryModel",
        Gs2DictionaryEntryModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func entry_model(
    entry_model_name
) -> Gs2DictionaryEntryModelDomain:
    return Gs2DictionaryEntryModelDomain.new(
        _gs2,
        namespace_name,
        entry_model_name
    )
func user(
    user_id
) -> Gs2DictionaryUserDomain:
    return Gs2DictionaryUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2DictionaryUserAccessTokenDomain:
    return Gs2DictionaryUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func entry_model_masters(
    name_prefix = null
) -> Gs2DictionaryDescribeEntryModelMastersIterator:
    return Gs2DictionaryDescribeEntryModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_entry_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DictionaryEntryModelMaster",
        Gs2DictionaryEntryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_entry_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DictionaryEntryModelMaster",
        Gs2DictionaryEntryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_entry_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DictionaryEntryModelMaster",
        Gs2DictionaryEntryModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func entry_model_master(
    entry_model_name
) -> Gs2DictionaryEntryModelMasterDomain:
    return Gs2DictionaryEntryModelMasterDomain.new(
        _gs2,
        namespace_name,
        entry_model_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2DictionaryNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2DictionaryNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2DictionaryGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2DictionaryNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2DictionaryNamespace",
        Gs2DictionaryNamespaceCache.cache_parent_key(
            null
        ),
        Gs2DictionaryNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2DictionaryNamespace",
        Gs2DictionaryNamespaceCache.cache_parent_key(
            null
        ),
        Gs2DictionaryNamespaceCache.cache_key(
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