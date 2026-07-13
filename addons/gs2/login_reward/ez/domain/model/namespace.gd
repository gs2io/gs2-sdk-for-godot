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
class_name Gs2LoginRewardEzNamespaceDomain
extends RefCounted


var _domain: Gs2LoginRewardNamespaceDomain
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
    domain: Gs2LoginRewardNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func bonus_models(
) -> Gs2LoginRewardEzListBonusModelsIterator:
    return Gs2LoginRewardEzListBonusModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_bonus_models(
    callback: Callable
) -> int:
    return _domain.subscribe_bonus_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2LoginRewardEzBonusModel.from_model(v)))
    )


func unsubscribe_bonus_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_bonus_models(
        callback_id
    )


func user(
    user_id
) -> Gs2LoginRewardEzUserDomain:
    return Gs2LoginRewardEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2LoginRewardEzUserGameSessionDomain:
    return Gs2LoginRewardEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )


func bonus_model(
    bonus_model_name
) -> Gs2LoginRewardEzBonusModelDomain:
    return Gs2LoginRewardEzBonusModelDomain.new(
        _domain.bonus_model(
            bonus_model_name
        ),
        _connection
    )