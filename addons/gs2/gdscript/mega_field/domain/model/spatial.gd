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
class_name Gs2MegaFieldSpatialDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MegaFieldRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var area_model_name: Variant = null
var layer_model_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    area_model_name_,
    layer_model_name_
):
    _gs2 = gs2
    _client = Gs2MegaFieldRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    area_model_name = area_model_name_
    layer_model_name = layer_model_name_


func put_position(
    request: Gs2MegaFieldPutPositionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_area_model_name(area_model_name)
    request = request.with_layer_model_name(layer_model_name)
    var async_result = await Gs2MegaFieldPutPositionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.put_position_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func action(
    request: Gs2MegaFieldActionByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    request = request.with_area_model_name(area_model_name)
    request = request.with_layer_model_name(layer_model_name)
    var async_result = await Gs2MegaFieldActionByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.action_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2MegaFieldSpatialDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.area_model_name),
                (null if v == null else v.layer_model_name)
            ))
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2MegaFieldSpatialCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        area_model_name,
        layer_model_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2MegaFieldSpatialCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        area_model_name,
        layer_model_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MegaFieldSpatial",
        Gs2MegaFieldSpatialCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2MegaFieldSpatialCache.cache_key(
            area_model_name,
            layer_model_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MegaFieldSpatial",
        Gs2MegaFieldSpatialCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        Gs2MegaFieldSpatialCache.cache_key(
            area_model_name,
            layer_model_name
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