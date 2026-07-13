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
class_name Gs2MegaFieldEzAreaModelDomain
extends RefCounted


var _domain: Gs2MegaFieldAreaModelDomain
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var area_model_name: Variant:
    get:
        return null if _domain == null else _domain.area_model_name


func _init(
    domain: Gs2MegaFieldAreaModelDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func layer_models(
) -> Gs2MegaFieldEzDescribeLayerModelsIterator:
    return Gs2MegaFieldEzDescribeLayerModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_layer_models(
    callback: Callable
) -> int:
    return _domain.subscribe_layer_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MegaFieldEzLayerModel.from_model(v)))
    )


func unsubscribe_layer_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_layer_models(
        callback_id
    )


func layer_model(
    layer_model_name
) -> Gs2MegaFieldEzLayerModelDomain:
    return Gs2MegaFieldEzLayerModelDomain.new(
        _domain.layer_model(
            layer_model_name
        ),
        _connection
    )


# 戻り値: Gs2AsyncResult (result = Gs2MegaFieldEzAreaModel)
func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2MegaFieldEzAreaModel.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2MegaFieldEzAreaModel.from_model(item))
    )


func unsubscribe_model(callback_id: int) -> void:
    _domain.unsubscribe_model(callback_id)


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)