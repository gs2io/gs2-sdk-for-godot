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
# deny overwrite
class_name Gs2MatchmakingEzUserGameSessionDomain
extends RefCounted


var _domain: Gs2MatchmakingUserAccessTokenDomain
var _game_session: Variant
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var matchmaking_context_token: Variant:
    get:
        return _domain.matchmaking_context_token
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2MatchmakingUserAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection
# 戻り値: Gs2AsyncResult (result = Gs2MatchmakingEzGatheringGameSessionDomain)
func create_gathering(
    player,
    attribute_ranges = null,
    capacity_of_roles = null,
    allow_user_ids = null,
    expires_at = null,
    expires_at_time_span = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        _game_session,
        func(): return await _domain.create_gathering(
            Gs2MatchmakingCreateGatheringRequest.new()
                .with_player(null if player == null else player.to_model())
                .with_attribute_ranges(null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_model()))
                .with_capacity_of_roles(null if capacity_of_roles == null else capacity_of_roles.map(func(v): return null if v == null else v.to_model()))
                .with_allow_user_ids(allow_user_ids)
                .with_expires_at(expires_at)
                .with_expires_at_time_span(null if expires_at_time_span == null else expires_at_time_span.to_model())
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2MatchmakingEzGatheringGameSessionDomain.new(
        async_result.result,
        _game_session,
        _connection
    ), null)


func ratings(
) -> Gs2MatchmakingEzListRatingsIterator:
    return Gs2MatchmakingEzListRatingsIterator.new(
        _domain,
        _game_session,
        _connection
    )


# diff +++ start
# Unity EzUserGameSessionDomain.DoMatchmaking parity.
func do_matchmaking(
    player
) -> Gs2MatchmakingEzDoMatchmakingIterator:
    return Gs2MatchmakingEzDoMatchmakingIterator.new(
        _domain,
        _game_session,
        _connection,
        player
    )
# diff +++ end


func subscribe_ratings(
    callback: Callable
) -> int:
    return _domain.subscribe_ratings(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MatchmakingEzRating.from_model(v)))
    )


func unsubscribe_ratings(
    callback_id: int
) -> void:
    _domain.unsubscribe_ratings(
        callback_id
    )


func gathering(
    gathering_name
) -> Gs2MatchmakingEzGatheringGameSessionDomain:
    return Gs2MatchmakingEzGatheringGameSessionDomain.new(
        _domain.gathering(
            gathering_name
        ),
        _game_session,
        _connection
    )


func rating(
    rating_name
) -> Gs2MatchmakingEzRatingGameSessionDomain:
    return Gs2MatchmakingEzRatingGameSessionDomain.new(
        _domain.rating(
            rating_name
        ),
        _game_session,
        _connection
    )


func ballot(
    rating_name,
    gathering_name,
    number_of_player,
    key_id
) -> Gs2MatchmakingEzBallotGameSessionDomain:
    return Gs2MatchmakingEzBallotGameSessionDomain.new(
        _domain.ballot(
            rating_name,
            gathering_name,
            number_of_player,
            key_id
        ),
        _game_session,
        _connection
    )


func season(
    season_name,
    season
) -> Gs2MatchmakingEzSeasonGameSessionDomain:
    return Gs2MatchmakingEzSeasonGameSessionDomain.new(
        _domain.season(
            season_name,
            season
        ),
        _game_session,
        _connection
    )
