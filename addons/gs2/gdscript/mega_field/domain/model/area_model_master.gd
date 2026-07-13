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
class_name Gs2MegaFieldAreaModelMasterDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MegaFieldRestClient
var namespace_name: Variant = null
var area_model_name: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    area_model_name_
):
    _gs2 = gs2
    _client = Gs2MegaFieldRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    area_model_name = area_model_name_


func get_(
    request: Gs2MegaFieldGetAreaModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_area_model_name(area_model_name)
    var async_result = await Gs2MegaFieldGetAreaModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_area_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2MegaFieldUpdateAreaModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_area_model_name(area_model_name)
    var async_result = await Gs2MegaFieldUpdateAreaModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_area_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2MegaFieldDeleteAreaModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_area_model_name(area_model_name)
    var async_result = await Gs2MegaFieldDeleteAreaModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_area_model_master(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_layer_model_master(
    request: Gs2MegaFieldCreateLayerModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_area_model_name(area_model_name)
    var async_result = await Gs2MegaFieldCreateLayerModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_layer_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MegaFieldLayerModelMasterDomain.new(
        _gs2,
        namespace_name,
        area_model_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func layer_model_masters(
) -> Gs2MegaFieldDescribeLayerModelMastersIterator:
    return Gs2MegaFieldDescribeLayerModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        area_model_name
    )


func subscribe_layer_model_masters(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MegaFieldLayerModelMaster",
        Gs2MegaFieldLayerModelMasterCache.cache_parent_key(
            namespace_name,
            area_model_name,
            null
        ),
        callback
    )


func unsubscribe_layer_model_masters(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MegaFieldLayerModelMaster",
        Gs2MegaFieldLayerModelMasterCache.cache_parent_key(
            namespace_name,
            area_model_name,
            null
        ),
        callback_id
    )


func invalidate_layer_model_masters(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MegaFieldLayerModelMaster",
        Gs2MegaFieldLayerModelMasterCache.cache_parent_key(
            namespace_name,
            area_model_name,
            null
        )
    )
func layer_model_master(
    layer_model_name
) -> Gs2MegaFieldLayerModelMasterDomain:
    return Gs2MegaFieldLayerModelMasterDomain.new(
        _gs2,
        namespace_name,
        area_model_name,
        layer_model_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2MegaFieldAreaModelMasterCache.get_cache(
        _gs2.cache,
        namespace_name,
        area_model_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MegaFieldAreaModelMasterCache.fetch(
        _gs2.cache,
        namespace_name,
        area_model_name,
        null,
        func():
            var get_result = await get_(Gs2MegaFieldGetAreaModelMasterRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MegaFieldAreaModelMasterCache.delete_cache(
        _gs2.cache,
        namespace_name,
        area_model_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MegaFieldAreaModelMaster",
        Gs2MegaFieldAreaModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2MegaFieldAreaModelMasterCache.cache_key(
            area_model_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MegaFieldAreaModelMaster",
        Gs2MegaFieldAreaModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2MegaFieldAreaModelMasterCache.cache_key(
            area_model_name
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