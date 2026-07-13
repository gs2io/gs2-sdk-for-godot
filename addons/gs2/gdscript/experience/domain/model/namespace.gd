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
class_name Gs2ExperienceNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2ExperienceRestClient
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
    _client = Gs2ExperienceRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2ExperienceGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExperienceGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2ExperienceGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExperienceGetNamespaceMethodCache.invoke(
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
    request: Gs2ExperienceUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExperienceUpdateNamespaceMethodCache.invoke(
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
    request: Gs2ExperienceDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExperienceDeleteNamespaceMethodCache.invoke(
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


func create_threshold_master(
    request: Gs2ExperienceCreateThresholdMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExperienceCreateThresholdMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_threshold_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ExperienceThresholdMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_experience_model_master(
    request: Gs2ExperienceCreateExperienceModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ExperienceCreateExperienceModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_experience_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ExperienceExperienceModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_experience_master(
) -> Gs2ExperienceCurrentExperienceMasterDomain:
    return Gs2ExperienceCurrentExperienceMasterDomain.new(
        _gs2,
        namespace_name
    )


func experience_models(
) -> Gs2ExperienceDescribeExperienceModelsIterator:
    return Gs2ExperienceDescribeExperienceModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_experience_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExperienceExperienceModel",
        Gs2ExperienceExperienceModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_experience_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExperienceExperienceModel",
        Gs2ExperienceExperienceModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_experience_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExperienceExperienceModel",
        Gs2ExperienceExperienceModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func experience_model(
    experience_name
) -> Gs2ExperienceExperienceModelDomain:
    return Gs2ExperienceExperienceModelDomain.new(
        _gs2,
        namespace_name,
        experience_name
    )
func user(
    user_id
) -> Gs2ExperienceUserDomain:
    return Gs2ExperienceUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2ExperienceUserAccessTokenDomain:
    return Gs2ExperienceUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func threshold_masters(
    name_prefix = null
) -> Gs2ExperienceDescribeThresholdMastersIterator:
    return Gs2ExperienceDescribeThresholdMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_threshold_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExperienceThresholdMaster",
        Gs2ExperienceThresholdMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_threshold_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExperienceThresholdMaster",
        Gs2ExperienceThresholdMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_threshold_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExperienceThresholdMaster",
        Gs2ExperienceThresholdMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func threshold_master(
    threshold_name
) -> Gs2ExperienceThresholdMasterDomain:
    return Gs2ExperienceThresholdMasterDomain.new(
        _gs2,
        namespace_name,
        threshold_name
    )


func experience_model_masters(
    name_prefix = null
) -> Gs2ExperienceDescribeExperienceModelMastersIterator:
    return Gs2ExperienceDescribeExperienceModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_experience_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExperienceExperienceModelMaster",
        Gs2ExperienceExperienceModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_experience_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExperienceExperienceModelMaster",
        Gs2ExperienceExperienceModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_experience_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExperienceExperienceModelMaster",
        Gs2ExperienceExperienceModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func experience_model_master(
    experience_name
) -> Gs2ExperienceExperienceModelMasterDomain:
    return Gs2ExperienceExperienceModelMasterDomain.new(
        _gs2,
        namespace_name,
        experience_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2ExperienceNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ExperienceNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2ExperienceGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ExperienceNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ExperienceNamespace",
        Gs2ExperienceNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ExperienceNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ExperienceNamespace",
        Gs2ExperienceNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ExperienceNamespaceCache.cache_key(
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