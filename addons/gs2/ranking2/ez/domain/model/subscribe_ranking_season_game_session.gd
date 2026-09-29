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
class_name Gs2Ranking2EzSubscribeRankingSeasonGameSessionDomain
extends RefCounted


var _domain: Gs2Ranking2SubscribeRankingSeasonAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var ranking_name: Variant:
    get:
        return null if _domain == null else _domain.ranking_name
var season: Variant:
    get:
        return null if _domain == null else _domain.season
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2Ranking2SubscribeRankingSeasonAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
func put_subscribe_ranking(
    score,
    metadata = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.put_subscribe_ranking_score(
            Gs2Ranking2PutSubscribeRankingScoreRequest.new()
                .with_score(score)
                .with_metadata(metadata)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2Ranking2EzSubscribeRankingScoreGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func subscribe_rankings(
) -> Gs2Ranking2EzListSubscribeRankingsIterator:
    return Gs2Ranking2EzListSubscribeRankingsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_subscribe_rankings(
    callback: Callable
) -> int:
    return _domain.subscribe_subscribe_rankings(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Ranking2EzSubscribeRankingData.from_model(v)))
    )


func unsubscribe_subscribe_rankings(
    callback_id: int
) -> void:
    _domain.unsubscribe_subscribe_rankings(
        callback_id
    )


func subscribe_ranking_scores(
) -> Gs2Ranking2EzListSubscribeRankingScoresIterator:
    return Gs2Ranking2EzListSubscribeRankingScoresIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_subscribe_ranking_scores(
    callback: Callable
) -> int:
    return _domain.subscribe_subscribe_ranking_scores(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Ranking2EzSubscribeRankingScore.from_model(v)))
    )


func unsubscribe_subscribe_ranking_scores(
    callback_id: int
) -> void:
    _domain.unsubscribe_subscribe_ranking_scores(
        callback_id
    )


func subscribe_ranking_score(
) -> Gs2Ranking2EzSubscribeRankingScoreGameSessionDomain:
    return Gs2Ranking2EzSubscribeRankingScoreGameSessionDomain.new(
        _domain.subscribe_ranking_score(
        ),
        _game_session,
        _connection
    )


func subscribe_ranking_data(
    scorer_user_id
) -> Gs2Ranking2EzSubscribeRankingDataGameSessionDomain:
    return Gs2Ranking2EzSubscribeRankingDataGameSessionDomain.new(
        _domain.subscribe_ranking_data(
            scorer_user_id
        ),
        _game_session,
        _connection
    )