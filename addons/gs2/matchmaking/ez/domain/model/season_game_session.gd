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
class_name Gs2MatchmakingEzSeasonGameSessionDomain
extends RefCounted


var _domain: Gs2MatchmakingSeasonAccessTokenDomain
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
var season_name: Variant:
    get:
        return null if _domain == null else _domain.season_name
var season: Variant:
    get:
        return null if _domain == null else _domain.season


func _init(
    domain: Gs2MatchmakingSeasonAccessTokenDomain,
    game_session: Variant,
    connection: Gs2Connection
):
    _domain = domain
    _game_session = game_session
    _connection = connection


func joined_season_gatherings(
) -> Gs2MatchmakingEzListJoinedSeasonGatheringsIterator:
    return Gs2MatchmakingEzListJoinedSeasonGatheringsIterator.new(
        _domain,
        _game_session,
        _connection
    )


func subscribe_joined_season_gatherings(
    callback: Callable
) -> int:
    return _domain.subscribe_joined_season_gatherings(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2MatchmakingEzJoinedSeasonGathering.from_model(v)))
    )


func unsubscribe_joined_season_gatherings(
    callback_id: int
) -> void:
    _domain.unsubscribe_joined_season_gatherings(
        callback_id
    )


func season_gathering(
    tier,
    season_gathering_name
) -> Gs2MatchmakingEzSeasonGatheringGameSessionDomain:
    return Gs2MatchmakingEzSeasonGatheringGameSessionDomain.new(
        _domain.season_gathering(
            tier,
            season_gathering_name
        ),
        _game_session,
        _connection
    )


func joined_season_gathering(
) -> Gs2MatchmakingEzJoinedSeasonGatheringGameSessionDomain:
    return Gs2MatchmakingEzJoinedSeasonGatheringGameSessionDomain.new(
        _domain.joined_season_gathering(
        ),
        _game_session,
        _connection
    )