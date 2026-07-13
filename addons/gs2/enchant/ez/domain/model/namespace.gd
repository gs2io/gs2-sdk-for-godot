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
class_name Gs2EnchantEzNamespaceDomain
extends RefCounted


var _domain: Gs2EnchantNamespaceDomain
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
    domain: Gs2EnchantNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func balance_parameter_models(
) -> Gs2EnchantEzListBalanceParameterModelsIterator:
    return Gs2EnchantEzListBalanceParameterModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_balance_parameter_models(
    callback: Callable
) -> int:
    return _domain.subscribe_balance_parameter_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2EnchantEzBalanceParameterModel.from_model(v)))
    )


func unsubscribe_balance_parameter_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_balance_parameter_models(
        callback_id
    )


func rarity_parameter_models(
) -> Gs2EnchantEzListRarityParameterModelsIterator:
    return Gs2EnchantEzListRarityParameterModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_rarity_parameter_models(
    callback: Callable
) -> int:
    return _domain.subscribe_rarity_parameter_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2EnchantEzRarityParameterModel.from_model(v)))
    )


func unsubscribe_rarity_parameter_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_rarity_parameter_models(
        callback_id
    )


func balance_parameter_model(
    parameter_name
) -> Gs2EnchantEzBalanceParameterModelDomain:
    return Gs2EnchantEzBalanceParameterModelDomain.new(
        _domain.balance_parameter_model(
            parameter_name
        ),
        _connection
    )


func rarity_parameter_model(
    parameter_name
) -> Gs2EnchantEzRarityParameterModelDomain:
    return Gs2EnchantEzRarityParameterModelDomain.new(
        _domain.rarity_parameter_model(
            parameter_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2EnchantEzUserDomain:
    return Gs2EnchantEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2EnchantEzUserGameSessionDomain:
    return Gs2EnchantEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )