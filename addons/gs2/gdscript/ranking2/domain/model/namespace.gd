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
class_name Gs2Ranking2NamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
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
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2Ranking2GetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2GetNamespaceStatusMethodCache.invoke(
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
    request: Gs2Ranking2GetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2GetNamespaceMethodCache.invoke(
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
    request: Gs2Ranking2UpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2UpdateNamespaceMethodCache.invoke(
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
    request: Gs2Ranking2DeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2DeleteNamespaceMethodCache.invoke(
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


func create_global_ranking_model_master(
    request: Gs2Ranking2CreateGlobalRankingModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2CreateGlobalRankingModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_global_ranking_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2GlobalRankingModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_subscribe_ranking_model_master(
    request: Gs2Ranking2CreateSubscribeRankingModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2CreateSubscribeRankingModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_subscribe_ranking_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2SubscribeRankingModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_cluster_ranking_model_master(
    request: Gs2Ranking2CreateClusterRankingModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2Ranking2CreateClusterRankingModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_cluster_ranking_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2Ranking2ClusterRankingModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_ranking_master(
) -> Gs2Ranking2CurrentRankingMasterDomain:
    return Gs2Ranking2CurrentRankingMasterDomain.new(
        _gs2,
        namespace_name
    )


func global_ranking_models(
) -> Gs2Ranking2DescribeGlobalRankingModelsIterator:
    return Gs2Ranking2DescribeGlobalRankingModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_global_ranking_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2GlobalRankingModel",
        Gs2Ranking2GlobalRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_global_ranking_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2GlobalRankingModel",
        Gs2Ranking2GlobalRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_global_ranking_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2GlobalRankingModel",
        Gs2Ranking2GlobalRankingModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func global_ranking_model(
    ranking_name
) -> Gs2Ranking2GlobalRankingModelDomain:
    return Gs2Ranking2GlobalRankingModelDomain.new(
        _gs2,
        namespace_name,
        ranking_name
    )


func global_ranking_model_masters(
    name_prefix = null
) -> Gs2Ranking2DescribeGlobalRankingModelMastersIterator:
    return Gs2Ranking2DescribeGlobalRankingModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_global_ranking_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2GlobalRankingModelMaster",
        Gs2Ranking2GlobalRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_global_ranking_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2GlobalRankingModelMaster",
        Gs2Ranking2GlobalRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_global_ranking_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2GlobalRankingModelMaster",
        Gs2Ranking2GlobalRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func global_ranking_model_master(
    ranking_name
) -> Gs2Ranking2GlobalRankingModelMasterDomain:
    return Gs2Ranking2GlobalRankingModelMasterDomain.new(
        _gs2,
        namespace_name,
        ranking_name
    )
func user(
    user_id
) -> Gs2Ranking2UserDomain:
    return Gs2Ranking2UserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2Ranking2UserAccessTokenDomain:
    return Gs2Ranking2UserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func subscribe_ranking_models(
) -> Gs2Ranking2DescribeSubscribeRankingModelsIterator:
    return Gs2Ranking2DescribeSubscribeRankingModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_subscribe_ranking_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2SubscribeRankingModel",
        Gs2Ranking2SubscribeRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_subscribe_ranking_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2SubscribeRankingModel",
        Gs2Ranking2SubscribeRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_subscribe_ranking_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2SubscribeRankingModel",
        Gs2Ranking2SubscribeRankingModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func subscribe_ranking_model(
    ranking_name
) -> Gs2Ranking2SubscribeRankingModelDomain:
    return Gs2Ranking2SubscribeRankingModelDomain.new(
        _gs2,
        namespace_name,
        ranking_name
    )


func subscribe_ranking_model_masters(
    name_prefix = null
) -> Gs2Ranking2DescribeSubscribeRankingModelMastersIterator:
    return Gs2Ranking2DescribeSubscribeRankingModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_subscribe_ranking_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2SubscribeRankingModelMaster",
        Gs2Ranking2SubscribeRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_subscribe_ranking_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2SubscribeRankingModelMaster",
        Gs2Ranking2SubscribeRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_subscribe_ranking_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2SubscribeRankingModelMaster",
        Gs2Ranking2SubscribeRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func subscribe_ranking_model_master(
    ranking_name
) -> Gs2Ranking2SubscribeRankingModelMasterDomain:
    return Gs2Ranking2SubscribeRankingModelMasterDomain.new(
        _gs2,
        namespace_name,
        ranking_name
    )


func cluster_ranking_models(
) -> Gs2Ranking2DescribeClusterRankingModelsIterator:
    return Gs2Ranking2DescribeClusterRankingModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_cluster_ranking_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2ClusterRankingModel",
        Gs2Ranking2ClusterRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_cluster_ranking_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2ClusterRankingModel",
        Gs2Ranking2ClusterRankingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_cluster_ranking_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2ClusterRankingModel",
        Gs2Ranking2ClusterRankingModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func cluster_ranking_model(
    ranking_name
) -> Gs2Ranking2ClusterRankingModelDomain:
    return Gs2Ranking2ClusterRankingModelDomain.new(
        _gs2,
        namespace_name,
        ranking_name
    )


func cluster_ranking_model_masters(
    name_prefix = null
) -> Gs2Ranking2DescribeClusterRankingModelMastersIterator:
    return Gs2Ranking2DescribeClusterRankingModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_cluster_ranking_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2ClusterRankingModelMaster",
        Gs2Ranking2ClusterRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_cluster_ranking_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2ClusterRankingModelMaster",
        Gs2Ranking2ClusterRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_cluster_ranking_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2ClusterRankingModelMaster",
        Gs2Ranking2ClusterRankingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func cluster_ranking_model_master(
    ranking_name
) -> Gs2Ranking2ClusterRankingModelMasterDomain:
    return Gs2Ranking2ClusterRankingModelMasterDomain.new(
        _gs2,
        namespace_name,
        ranking_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2Ranking2NamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2Ranking2NamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2Ranking2GetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2Ranking2NamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2Ranking2Namespace",
        Gs2Ranking2NamespaceCache.cache_parent_key(
            null
        ),
        Gs2Ranking2NamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2Ranking2Namespace",
        Gs2Ranking2NamespaceCache.cache_parent_key(
            null
        ),
        Gs2Ranking2NamespaceCache.cache_key(
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