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
class_name Gs2SkillTreeNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2SkillTreeRestClient
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
    _client = Gs2SkillTreeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2SkillTreeGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SkillTreeGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2SkillTreeGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SkillTreeGetNamespaceMethodCache.invoke(
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
    request: Gs2SkillTreeUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SkillTreeUpdateNamespaceMethodCache.invoke(
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
    request: Gs2SkillTreeDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SkillTreeDeleteNamespaceMethodCache.invoke(
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


func create_node_model_master(
    request: Gs2SkillTreeCreateNodeModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SkillTreeCreateNodeModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_node_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2SkillTreeNodeModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_tree_master(
) -> Gs2SkillTreeCurrentTreeMasterDomain:
    return Gs2SkillTreeCurrentTreeMasterDomain.new(
        _gs2,
        namespace_name
    )


func node_models(
) -> Gs2SkillTreeDescribeNodeModelsIterator:
    return Gs2SkillTreeDescribeNodeModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_node_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2SkillTreeNodeModel",
        Gs2SkillTreeNodeModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_node_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2SkillTreeNodeModel",
        Gs2SkillTreeNodeModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_node_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2SkillTreeNodeModel",
        Gs2SkillTreeNodeModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func node_model(
    node_model_name
) -> Gs2SkillTreeNodeModelDomain:
    return Gs2SkillTreeNodeModelDomain.new(
        _gs2,
        namespace_name,
        node_model_name
    )


func node_model_masters(
    name_prefix = null
) -> Gs2SkillTreeDescribeNodeModelMastersIterator:
    return Gs2SkillTreeDescribeNodeModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_node_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2SkillTreeNodeModelMaster",
        Gs2SkillTreeNodeModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_node_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2SkillTreeNodeModelMaster",
        Gs2SkillTreeNodeModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_node_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2SkillTreeNodeModelMaster",
        Gs2SkillTreeNodeModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func node_model_master(
    node_model_name
) -> Gs2SkillTreeNodeModelMasterDomain:
    return Gs2SkillTreeNodeModelMasterDomain.new(
        _gs2,
        namespace_name,
        node_model_name
    )
func user(
    user_id
) -> Gs2SkillTreeUserDomain:
    return Gs2SkillTreeUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2SkillTreeUserAccessTokenDomain:
    return Gs2SkillTreeUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2SkillTreeNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2SkillTreeNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2SkillTreeGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2SkillTreeNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2SkillTreeNamespace",
        Gs2SkillTreeNamespaceCache.cache_parent_key(
            null
        ),
        Gs2SkillTreeNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2SkillTreeNamespace",
        Gs2SkillTreeNamespaceCache.cache_parent_key(
            null
        ),
        Gs2SkillTreeNamespaceCache.cache_key(
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