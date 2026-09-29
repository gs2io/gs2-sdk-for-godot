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
class_name Gs2InventoryEzInventoryModelDomain
extends RefCounted


var _domain: Gs2InventoryInventoryModelDomain
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var inventory_name: Variant:
    get:
        return null if _domain == null else _domain.inventory_name


func _init(
    domain: Gs2InventoryInventoryModelDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func item_models(
) -> Gs2InventoryEzListItemModelsIterator:
    return Gs2InventoryEzListItemModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_item_models(
    callback: Callable
) -> int:
    return _domain.subscribe_item_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzItemModel.from_model(v)))
    )


func unsubscribe_item_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_item_models(
        callback_id
    )


func item_model(
    item_name
) -> Gs2InventoryEzItemModelDomain:
    return Gs2InventoryEzItemModelDomain.new(
        _domain.item_model(
            item_name
        ),
        _connection
    )


func model() -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.model()
    )
    if async_result.error != null:
        return async_result
    if async_result.result == null:
        return Gs2AsyncResult.new(null, null)
    return Gs2AsyncResult.new(Gs2InventoryEzInventoryModel.from_model(async_result.result), null)


func invalidate() -> void:
    _domain.invalidate()


func subscribe_model(callback: Callable) -> int:
    return _domain.subscribe_model(
        func(item): callback.call(null if item == null else Gs2InventoryEzInventoryModel.from_model(item))
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