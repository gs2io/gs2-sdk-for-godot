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
class_name Gs2LotteryEzLotteryGameSessionDomain
extends RefCounted


var _domain: Gs2LotteryLotteryAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var lottery_name: Variant:
    get:
        return null if _domain == null else _domain.lottery_name


func _init(
    domain: Gs2LotteryLotteryAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func probabilities(
) -> Gs2LotteryEzListProbabilitiesIterator:
    return Gs2LotteryEzListProbabilitiesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_probabilities(
    callback: Callable
) -> int:
    return _domain.subscribe_probabilities(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2LotteryEzProbability.from_model(v)))
    )


func unsubscribe_probabilities(
    callback_id: int
) -> void:
    _domain.unsubscribe_probabilities(
        callback_id
    )


func probability(
    prize_id
) -> Gs2LotteryEzProbabilityGameSessionDomain:
    return Gs2LotteryEzProbabilityGameSessionDomain.new(
        _domain.probability(
            prize_id
        ),
        _game_session,
        _connection
    )