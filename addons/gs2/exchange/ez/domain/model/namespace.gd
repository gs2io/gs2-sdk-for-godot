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
class_name Gs2ExchangeEzNamespaceDomain
extends RefCounted


var _domain: Gs2ExchangeNamespaceDomain
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
    domain: Gs2ExchangeNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func rate_models(
) -> Gs2ExchangeEzListRateModelsIterator:
    return Gs2ExchangeEzListRateModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_rate_models(
    callback: Callable
) -> int:
    return _domain.subscribe_rate_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ExchangeEzRateModel.from_model(v)))
    )


func unsubscribe_rate_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_rate_models(
        callback_id
    )


func incremental_rate_models(
) -> Gs2ExchangeEzListIncrementalRateModelsIterator:
    return Gs2ExchangeEzListIncrementalRateModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_incremental_rate_models(
    callback: Callable
) -> int:
    return _domain.subscribe_incremental_rate_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2ExchangeEzIncrementalRateModel.from_model(v)))
    )


func unsubscribe_incremental_rate_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_incremental_rate_models(
        callback_id
    )


func rate_model(
    rate_name
) -> Gs2ExchangeEzRateModelDomain:
    return Gs2ExchangeEzRateModelDomain.new(
        _domain.rate_model(
            rate_name
        ),
        _connection
    )


func me(
    game_session
) -> Gs2ExchangeEzUserGameSessionDomain:
    return Gs2ExchangeEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )


func incremental_rate_model(
    rate_name
) -> Gs2ExchangeEzIncrementalRateModelDomain:
    return Gs2ExchangeEzIncrementalRateModelDomain.new(
        _domain.incremental_rate_model(
            rate_name
        ),
        _connection
    )