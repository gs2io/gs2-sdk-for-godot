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
class_name Gs2DistributorNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DistributorRestClient
var namespace_name: Variant = null
var status: Variant = null
var result: Variant = null
var context_stack: Variant = null
var status_code: Variant = null
var verify_task_result_codes: Variant = null
var verify_task_results: Variant = null
var task_result_codes: Variant = null
var task_results: Variant = null
var sheet_result_code: Variant = null
var sheet_result: Variant = null
var results: Variant = null
# diff --- start
#var expression_result = null
# diff --- end
var next_page_token: Variant = null
var new_context_stack = null  # diff +++


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2DistributorRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2DistributorGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DistributorGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2DistributorGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DistributorGetNamespaceMethodCache.invoke(
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
    request: Gs2DistributorUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DistributorUpdateNamespaceMethodCache.invoke(
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
    request: Gs2DistributorDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DistributorDeleteNamespaceMethodCache.invoke(
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


func set_transaction_default_config(
# diff --- start
#    request: Gs2DistributorSetTransactionDefaultConfigByUserIdRequest
# diff --- end
    request  # diff +++
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
# diff --- start
#    var async_result = await Gs2DistributorSetTransactionDefaultConfigByUserIdMethodCache.invoke(
# diff --- end
# diff +++ start
    var async_result = null
    if request is Gs2DistributorSetTransactionDefaultConfigByUserIdRequest:
        async_result = await Gs2DistributorSetTransactionDefaultConfigByUserIdMethodCache.invoke(
            _gs2.cache,
            null,
            null,
            request,
            func(): return await _client.set_transaction_default_config_by_user_id(request)
        )
    else:
        async_result = await Gs2DistributorSetTransactionDefaultConfigMethodCache.invoke(
            _gs2.cache,
            null,
            null,
            request,
            func(): return await _client.set_transaction_default_config(request)
        )
# diff +++ end
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    domain.new_context_stack = result.new_context_stack  # diff +++
    return Gs2AsyncResult.new(domain, null)


func batch_execute_api(
    request: Gs2DistributorBatchExecuteApiRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2DistributorBatchExecuteApiMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.batch_execute_api(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.results = null if result == null else result.results
    domain.results = self.results
    return Gs2AsyncResult.new(domain, null)


func create_distributor_model_master(
    request: Gs2DistributorCreateDistributorModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2DistributorCreateDistributorModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_distributor_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2DistributorDistributorModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_distributor_master(
) -> Gs2DistributorCurrentDistributorMasterDomain:
    return Gs2DistributorCurrentDistributorMasterDomain.new(
        _gs2,
        namespace_name
    )


func distributor_models(
) -> Gs2DistributorDescribeDistributorModelsIterator:
    return Gs2DistributorDescribeDistributorModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_distributor_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DistributorDistributorModel",
        Gs2DistributorDistributorModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_distributor_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DistributorDistributorModel",
        Gs2DistributorDistributorModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_distributor_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DistributorDistributorModel",
        Gs2DistributorDistributorModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func distributor_model(
    distributor_name
) -> Gs2DistributorDistributorModelDomain:
    return Gs2DistributorDistributorModelDomain.new(
        _gs2,
        namespace_name,
        distributor_name
    )
func distribute(
) -> Gs2DistributorDistributeDomain:
    return Gs2DistributorDistributeDomain.new(
        _gs2,
        namespace_name
    )


func distributor_model_masters(
    name_prefix = null
) -> Gs2DistributorDescribeDistributorModelMastersIterator:
    return Gs2DistributorDescribeDistributorModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_distributor_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DistributorDistributorModelMaster",
        Gs2DistributorDistributorModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_distributor_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DistributorDistributorModelMaster",
        Gs2DistributorDistributorModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_distributor_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DistributorDistributorModelMaster",
        Gs2DistributorDistributorModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func distributor_model_master(
    distributor_name
) -> Gs2DistributorDistributorModelMasterDomain:
    return Gs2DistributorDistributorModelMasterDomain.new(
        _gs2,
        namespace_name,
        distributor_name
    )
func user(
    user_id
) -> Gs2DistributorUserDomain:
    return Gs2DistributorUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2DistributorUserAccessTokenDomain:
    return Gs2DistributorUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )
func expression(
) -> Gs2DistributorExpressionDomain:
    return Gs2DistributorExpressionDomain.new(
        _gs2,
        namespace_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2DistributorNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2DistributorNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2DistributorGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2DistributorNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2DistributorNamespace",
        Gs2DistributorNamespaceCache.cache_parent_key(
            null
        ),
        Gs2DistributorNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2DistributorNamespace",
        Gs2DistributorNamespaceCache.cache_parent_key(
            null
        ),
        Gs2DistributorNamespaceCache.cache_key(
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