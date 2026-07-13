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
class_name Gs2EnchantEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2EnchantUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2EnchantUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func balance_parameter_statuses(
    parameter_name = null
) -> Gs2EnchantEzListBalanceParameterStatusesIterator:
    return Gs2EnchantEzListBalanceParameterStatusesIterator.new(
        _domain,
        _game_session,
        _connection,
        parameter_name
    )


func subscribe_balance_parameter_statuses(
    callback: Callable,
    parameter_name = null
) -> int:
    return _domain.subscribe_balance_parameter_statuses(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2EnchantEzBalanceParameterStatus.from_model(v))),
        parameter_name
    )


func unsubscribe_balance_parameter_statuses(
    callback_id: int,
    parameter_name = null
) -> void:
    _domain.unsubscribe_balance_parameter_statuses(
        callback_id,
        parameter_name
    )


func rarity_parameter_statuses(
    parameter_name = null
) -> Gs2EnchantEzListRarityParameterStatusesIterator:
    return Gs2EnchantEzListRarityParameterStatusesIterator.new(
        _domain,
        _game_session,
        _connection,
        parameter_name
    )


func subscribe_rarity_parameter_statuses(
    callback: Callable,
    parameter_name = null
) -> int:
    return _domain.subscribe_rarity_parameter_statuses(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2EnchantEzRarityParameterStatus.from_model(v))),
        parameter_name
    )


func unsubscribe_rarity_parameter_statuses(
    callback_id: int,
    parameter_name = null
) -> void:
    _domain.unsubscribe_rarity_parameter_statuses(
        callback_id,
        parameter_name
    )


func balance_parameter_status(
    parameter_name,
    property_id
) -> Gs2EnchantEzBalanceParameterStatusGameSessionDomain:
    return Gs2EnchantEzBalanceParameterStatusGameSessionDomain.new(
        _domain.balance_parameter_status(
            parameter_name,
            property_id
        ),
        _game_session,
        _connection
    )


func rarity_parameter_status(
    parameter_name,
    property_id
) -> Gs2EnchantEzRarityParameterStatusGameSessionDomain:
    return Gs2EnchantEzRarityParameterStatusGameSessionDomain.new(
        _domain.rarity_parameter_status(
            parameter_name,
            property_id
        ),
        _game_session,
        _connection
    )