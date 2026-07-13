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
class_name Gs2RankingEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2RankingUserAccessTokenDomain
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
    domain: Gs2RankingUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func scores(
    category_name,
    scorer_user_id
) -> Gs2RankingEzListScoresIterator:
    return Gs2RankingEzListScoresIterator.new(
        _domain,
        _game_session,
        _connection,
        category_name,
        scorer_user_id
    )


func subscribe_scores(
    callback: Callable,
    category_name,
    scorer_user_id
) -> int:
    return _domain.subscribe_scores(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2RankingEzScore.from_model(v))),
        category_name,
        scorer_user_id
    )


func unsubscribe_scores(
    callback_id: int,
    category_name,
    scorer_user_id
) -> void:
    _domain.unsubscribe_scores(
        callback_id,
        category_name,
        scorer_user_id
    )


func ranking_category(
    category_name,
    additional_scope_name = null
) -> Gs2RankingEzRankingCategoryGameSessionDomain:
    return Gs2RankingEzRankingCategoryGameSessionDomain.new(
        _domain.ranking_category(
            category_name,
            additional_scope_name
        ),
        _game_session,
        _connection
    )


func score(
    category_name,
    scorer_user_id,
    unique_id
) -> Gs2RankingEzScoreGameSessionDomain:
    return Gs2RankingEzScoreGameSessionDomain.new(
        _domain.score(
            category_name,
            scorer_user_id,
            unique_id
        ),
        _game_session,
        _connection
    )