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
class_name Gs2MegaFieldAreaModelDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MegaFieldRestClient
var namespace_name: Variant = null
var area_model_name: Variant = null


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
    request: Gs2MegaFieldGetAreaModelRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_area_model_name(area_model_name)
    var async_result = await Gs2MegaFieldGetAreaModelMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_area_model(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func layer_models(
) -> Gs2MegaFieldDescribeLayerModelsIterator:
    return Gs2MegaFieldDescribeLayerModelsIterator.new(
        _gs2,
        _client,
        namespace_name,
        area_model_name
    )


func subscribe_layer_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MegaFieldLayerModel",
        Gs2MegaFieldLayerModelCache.cache_parent_key(
            namespace_name,
            area_model_name,
            null
        ),
        callback
    )


func unsubscribe_layer_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MegaFieldLayerModel",
        Gs2MegaFieldLayerModelCache.cache_parent_key(
            namespace_name,
            area_model_name,
            null
        ),
        callback_id
    )


func invalidate_layer_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MegaFieldLayerModel",
        Gs2MegaFieldLayerModelCache.cache_parent_key(
            namespace_name,
            area_model_name,
            null
        )
    )
func layer_model(
    layer_model_name
) -> Gs2MegaFieldLayerModelDomain:
    return Gs2MegaFieldLayerModelDomain.new(
        _gs2,
        namespace_name,
        area_model_name,
        layer_model_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2MegaFieldAreaModelCache.get_cache(
        _gs2.cache,
        namespace_name,
        area_model_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MegaFieldAreaModelCache.fetch(
        _gs2.cache,
        namespace_name,
        area_model_name,
        null,
        func():
            var get_result = await get_(Gs2MegaFieldGetAreaModelRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MegaFieldAreaModelCache.delete_cache(
        _gs2.cache,
        namespace_name,
        area_model_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MegaFieldAreaModel",
        Gs2MegaFieldAreaModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2MegaFieldAreaModelCache.cache_key(
            area_model_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MegaFieldAreaModel",
        Gs2MegaFieldAreaModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2MegaFieldAreaModelCache.cache_key(
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