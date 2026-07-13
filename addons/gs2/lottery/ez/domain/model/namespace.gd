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
class_name Gs2LotteryEzNamespaceDomain
extends RefCounted


var _domain: Gs2LotteryNamespaceDomain
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
    domain: Gs2LotteryNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func lottery_models(
) -> Gs2LotteryEzListLotteryModelsIterator:
    return Gs2LotteryEzListLotteryModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_lottery_models(
    callback: Callable
) -> int:
    return _domain.subscribe_lottery_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2LotteryEzLotteryModel.from_model(v)))
    )


func unsubscribe_lottery_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_lottery_models(
        callback_id
    )


func lottery_model(
    lottery_name
) -> Gs2LotteryEzLotteryModelDomain:
    return Gs2LotteryEzLotteryModelDomain.new(
        _domain.lottery_model(
            lottery_name
        ),
        _connection
    )


func drawn_prizes() -> Gs2LotteryEzListDrawnPrizesIterator:
    return Gs2LotteryEzListDrawnPrizesIterator.new(_domain, _connection)


func drawn_prize(index) -> Gs2LotteryEzDrawnPrizeDomain:
    return Gs2LotteryEzDrawnPrizeDomain.new(_domain.drawn_prize(index), _connection)


func subscribe_drawn_prizes(callback: Callable) -> int:
    return _domain.subscribe_drawn_prizes(
        func(items): callback.call([] if items == null else items.map(func(item): return Gs2LotteryEzDrawnPrize.from_model(item)))
    )


func unsubscribe_drawn_prizes(callback_id: int) -> void:
    _domain.unsubscribe_drawn_prizes(callback_id)


func user(
    user_id
) -> Gs2LotteryEzUserDomain:
    return Gs2LotteryEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2LotteryEzUserGameSessionDomain:
    return Gs2LotteryEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )
