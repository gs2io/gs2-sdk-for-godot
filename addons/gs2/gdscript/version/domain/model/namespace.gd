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
class_name Gs2VersionNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2VersionRestClient
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
    _client = Gs2VersionRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2VersionGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2VersionGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2VersionGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2VersionGetNamespaceMethodCache.invoke(
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
    request: Gs2VersionUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2VersionUpdateNamespaceMethodCache.invoke(
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
    request: Gs2VersionDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2VersionDeleteNamespaceMethodCache.invoke(
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


func create_version_model_master(
    request: Gs2VersionCreateVersionModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2VersionCreateVersionModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_version_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2VersionVersionModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_version_master(
) -> Gs2VersionCurrentVersionMasterDomain:
    return Gs2VersionCurrentVersionMasterDomain.new(
        _gs2,
        namespace_name
    )


func version_models(
) -> Gs2VersionDescribeVersionModelsIterator:
    return Gs2VersionDescribeVersionModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_version_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2VersionVersionModel",
        Gs2VersionVersionModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_version_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2VersionVersionModel",
        Gs2VersionVersionModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_version_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2VersionVersionModel",
        Gs2VersionVersionModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func version_model(
    version_name
) -> Gs2VersionVersionModelDomain:
    return Gs2VersionVersionModelDomain.new(
        _gs2,
        namespace_name,
        version_name
    )
func user(
    user_id
) -> Gs2VersionUserDomain:
    return Gs2VersionUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2VersionUserAccessTokenDomain:
    return Gs2VersionUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func version_model_masters(
    name_prefix = null
) -> Gs2VersionDescribeVersionModelMastersIterator:
    return Gs2VersionDescribeVersionModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_version_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2VersionVersionModelMaster",
        Gs2VersionVersionModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_version_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2VersionVersionModelMaster",
        Gs2VersionVersionModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_version_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2VersionVersionModelMaster",
        Gs2VersionVersionModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func version_model_master(
    version_name
) -> Gs2VersionVersionModelMasterDomain:
    return Gs2VersionVersionModelMasterDomain.new(
        _gs2,
        namespace_name,
        version_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2VersionNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2VersionNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2VersionGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2VersionNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2VersionNamespace",
        Gs2VersionNamespaceCache.cache_parent_key(
            null
        ),
        Gs2VersionNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2VersionNamespace",
        Gs2VersionNamespaceCache.cache_parent_key(
            null
        ),
        Gs2VersionNamespaceCache.cache_key(
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