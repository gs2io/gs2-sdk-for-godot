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
class_name Gs2EnhanceEzNamespaceDomain
extends RefCounted


var _domain: Gs2EnhanceNamespaceDomain
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
    domain: Gs2EnhanceNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func rate_models(
) -> Gs2EnhanceEzListRateModelsIterator:
    return Gs2EnhanceEzListRateModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_rate_models(
    callback: Callable
) -> int:
    return _domain.subscribe_rate_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2EnhanceEzRateModel.from_model(v)))
    )


func unsubscribe_rate_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_rate_models(
        callback_id
    )


func unleash_rate_models(
) -> Gs2EnhanceEzListUnleashRateModelsIterator:
    return Gs2EnhanceEzListUnleashRateModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_unleash_rate_models(
    callback: Callable
) -> int:
    return _domain.subscribe_unleash_rate_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2EnhanceEzUnleashRateModel.from_model(v)))
    )


func unsubscribe_unleash_rate_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_unleash_rate_models(
        callback_id
    )


func unleash_rate_model(
    rate_name
) -> Gs2EnhanceEzUnleashRateModelDomain:
    return Gs2EnhanceEzUnleashRateModelDomain.new(
        _domain.unleash_rate_model(
            rate_name
        ),
        _connection
    )


func rate_model(
    rate_name
) -> Gs2EnhanceEzRateModelDomain:
    return Gs2EnhanceEzRateModelDomain.new(
        _domain.rate_model(
            rate_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2EnhanceEzUserDomain:
    return Gs2EnhanceEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2EnhanceEzUserGameSessionDomain:
    return Gs2EnhanceEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )