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
class_name Gs2FormationNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2FormationRestClient
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
    _client = Gs2FormationRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2FormationGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2FormationGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationGetNamespaceMethodCache.invoke(
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
    request: Gs2FormationUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationUpdateNamespaceMethodCache.invoke(
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
    request: Gs2FormationDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationDeleteNamespaceMethodCache.invoke(
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


func create_property_form_model_master(
    request: Gs2FormationCreatePropertyFormModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationCreatePropertyFormModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_property_form_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2FormationPropertyFormModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_form_model_master(
    request: Gs2FormationCreateFormModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationCreateFormModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_form_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2FormationFormModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_mold_model_master(
    request: Gs2FormationCreateMoldModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationCreateMoldModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_mold_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2FormationMoldModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_form_master(
) -> Gs2FormationCurrentFormMasterDomain:
    return Gs2FormationCurrentFormMasterDomain.new(
        _gs2,
        namespace_name
    )


func mold_models(
) -> Gs2FormationDescribeMoldModelsIterator:
    return Gs2FormationDescribeMoldModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_mold_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationMoldModel",
        Gs2FormationMoldModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_mold_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationMoldModel",
        Gs2FormationMoldModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_mold_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationMoldModel",
        Gs2FormationMoldModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func mold_model(
    mold_model_name
) -> Gs2FormationMoldModelDomain:
    return Gs2FormationMoldModelDomain.new(
        _gs2,
        namespace_name,
        mold_model_name
    )


func property_form_models(
) -> Gs2FormationDescribePropertyFormModelsIterator:
    return Gs2FormationDescribePropertyFormModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_property_form_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationPropertyFormModel",
        Gs2FormationPropertyFormModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_property_form_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationPropertyFormModel",
        Gs2FormationPropertyFormModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_property_form_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationPropertyFormModel",
        Gs2FormationPropertyFormModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func property_form_model(
    property_form_model_name
) -> Gs2FormationPropertyFormModelDomain:
    return Gs2FormationPropertyFormModelDomain.new(
        _gs2,
        namespace_name,
        property_form_model_name
    )
func user(
    user_id
) -> Gs2FormationUserDomain:
    return Gs2FormationUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2FormationUserAccessTokenDomain:
    return Gs2FormationUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func property_form_model_masters(
    name_prefix = null
) -> Gs2FormationDescribePropertyFormModelMastersIterator:
    return Gs2FormationDescribePropertyFormModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_property_form_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationPropertyFormModelMaster",
        Gs2FormationPropertyFormModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_property_form_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationPropertyFormModelMaster",
        Gs2FormationPropertyFormModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_property_form_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationPropertyFormModelMaster",
        Gs2FormationPropertyFormModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func property_form_model_master(
    property_form_model_name
) -> Gs2FormationPropertyFormModelMasterDomain:
    return Gs2FormationPropertyFormModelMasterDomain.new(
        _gs2,
        namespace_name,
        property_form_model_name
    )


func form_model_masters(
    name_prefix = null
) -> Gs2FormationDescribeFormModelMastersIterator:
    return Gs2FormationDescribeFormModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_form_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationFormModelMaster",
        Gs2FormationFormModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_form_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationFormModelMaster",
        Gs2FormationFormModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_form_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationFormModelMaster",
        Gs2FormationFormModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func form_model_master(
    form_model_name
) -> Gs2FormationFormModelMasterDomain:
    return Gs2FormationFormModelMasterDomain.new(
        _gs2,
        namespace_name,
        form_model_name
    )


func mold_model_masters(
    name_prefix = null
) -> Gs2FormationDescribeMoldModelMastersIterator:
    return Gs2FormationDescribeMoldModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_mold_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationMoldModelMaster",
        Gs2FormationMoldModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_mold_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationMoldModelMaster",
        Gs2FormationMoldModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_mold_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationMoldModelMaster",
        Gs2FormationMoldModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func mold_model_master(
    mold_model_name
) -> Gs2FormationMoldModelMasterDomain:
    return Gs2FormationMoldModelMasterDomain.new(
        _gs2,
        namespace_name,
        mold_model_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2FormationNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2FormationNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2FormationGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2FormationNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FormationNamespace",
        Gs2FormationNamespaceCache.cache_parent_key(
            null
        ),
        Gs2FormationNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FormationNamespace",
        Gs2FormationNamespaceCache.cache_parent_key(
            null
        ),
        Gs2FormationNamespaceCache.cache_key(
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