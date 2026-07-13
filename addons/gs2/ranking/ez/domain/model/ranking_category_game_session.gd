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
class_name Gs2RankingEzRankingCategoryGameSessionDomain
extends RefCounted


var _domain: Gs2RankingRankingCategoryAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var processing: Variant:
    get:
        return _domain.processing
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var category_name: Variant:
    get:
        return null if _domain == null else _domain.category_name
var additional_scope_name: Variant:
    get:
        return null if _domain == null else _domain.additional_scope_name


func _init(
    domain: Gs2RankingRankingCategoryAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2RankingEzSubscribeUserGameSessionDomain)
func subscribe(
    target_user_id
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.subscribe_(
            Gs2RankingSubscribeRequest.new()
                .with_target_user_id(target_user_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2RankingEzSubscribeUserGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)
# 戻り値: Gs2AsyncResult (result = Gs2RankingEzScoreGameSessionDomain)
func put_score(
    score,
    metadata = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.put_score(
            Gs2RankingPutScoreRequest.new()
                .with_score(score)
                .with_metadata(metadata)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2RankingEzScoreGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func subscribe_users(
) -> Gs2RankingEzListSubscribesIterator:
    return Gs2RankingEzListSubscribesIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_subscribe_users(
    callback: Callable
) -> int:
    return _domain.subscribe_subscribe_users(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2RankingEzSubscribeUser.from_model(v)))
    )


func unsubscribe_subscribe_users(
    callback_id: int
) -> void:
    _domain.unsubscribe_subscribe_users(
        callback_id
    )


func rankings(
) -> Gs2RankingEzGetRankingIterator:
    return Gs2RankingEzGetRankingIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_rankings(
    callback: Callable
) -> int:
    return _domain.subscribe_rankings(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2RankingEzRanking.from_model(v)))
    )


func unsubscribe_rankings(
    callback_id: int
) -> void:
    _domain.unsubscribe_rankings(
        callback_id
    )


func subscribe_user(
    target_user_id
) -> Gs2RankingEzSubscribeUserGameSessionDomain:
    return Gs2RankingEzSubscribeUserGameSessionDomain.new(
        _domain.subscribe_user(
            target_user_id
        ),
        _game_session,
        _connection
    )


func ranking(
    scorer_user_id = null,
    index = null
) -> Gs2RankingEzRankingGameSessionDomain:
    return Gs2RankingEzRankingGameSessionDomain.new(
        _domain.ranking(
            scorer_user_id,
            index
        ),
        _game_session,
        _connection
    )