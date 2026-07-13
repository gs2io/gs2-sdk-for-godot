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
class_name Gs2InventoryEzNamespaceDomain
extends RefCounted


var _domain: Gs2InventoryNamespaceDomain
var _connection: Gs2Connection
var status: Variant:
    get:
        return _domain.status
var url: Variant:
    get:
        return _domain.url
var upload_token: Variant:
    get:
        return _domain.upload_token
var upload_url: Variant:
    get:
        return _domain.upload_url
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name


func _init(
    domain: Gs2InventoryNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func inventory_models(
) -> Gs2InventoryEzListInventoryModelsIterator:
    return Gs2InventoryEzListInventoryModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_inventory_models(
    callback: Callable
) -> int:
    return _domain.subscribe_inventory_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzInventoryModel.from_model(v)))
    )


func unsubscribe_inventory_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_inventory_models(
        callback_id
    )


func simple_inventory_models(
) -> Gs2InventoryEzListSimpleInventoryModelsIterator:
    return Gs2InventoryEzListSimpleInventoryModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_simple_inventory_models(
    callback: Callable
) -> int:
    return _domain.subscribe_simple_inventory_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzSimpleInventoryModel.from_model(v)))
    )


func unsubscribe_simple_inventory_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_simple_inventory_models(
        callback_id
    )


func big_inventory_models(
) -> Gs2InventoryEzListBigInventoryModelsIterator:
    return Gs2InventoryEzListBigInventoryModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_big_inventory_models(
    callback: Callable
) -> int:
    return _domain.subscribe_big_inventory_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2InventoryEzBigInventoryModel.from_model(v)))
    )


func unsubscribe_big_inventory_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_big_inventory_models(
        callback_id
    )


func inventory_model(
    inventory_name
) -> Gs2InventoryEzInventoryModelDomain:
    return Gs2InventoryEzInventoryModelDomain.new(
        _domain.inventory_model(
            inventory_name
        ),
        _connection
    )


func user(
    user_id = null
) -> Gs2InventoryEzUserDomain:
    return Gs2InventoryEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2InventoryEzUserGameSessionDomain:
    return Gs2InventoryEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )


func simple_inventory_model(
    inventory_name
) -> Gs2InventoryEzSimpleInventoryModelDomain:
    return Gs2InventoryEzSimpleInventoryModelDomain.new(
        _domain.simple_inventory_model(
            inventory_name
        ),
        _connection
    )


func big_inventory_model(
    inventory_name
) -> Gs2InventoryEzBigInventoryModelDomain:
    return Gs2InventoryEzBigInventoryModelDomain.new(
        _domain.big_inventory_model(
            inventory_name
        ),
        _connection
    )