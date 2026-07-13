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
class_name Gs2MatchmakingClient
extends RefCounted


var _connection: Gs2Connection
var _web_socket_client: Gs2MatchmakingWebSocketClient
var _rest_client: Gs2MatchmakingRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _web_socket_client = Gs2MatchmakingWebSocketClient.new(connection.web_socket_session)
    _rest_client = Gs2MatchmakingRestClient.new(connection.rest_session)


func cancel_matchmaking(game_session, namespace_name, gathering_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingCancelMatchmakingRequest.new()
        request.namespace_name = namespace_name
        request.gathering_name = gathering_name
        request.access_token = game_session.access_token.token
        return await _rest_client.cancel_matchmaking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzCancelMatchmakingResult.from_model(async_result.result), null)


func create_gathering(game_session, namespace_name, player, attribute_ranges = null, capacity_of_roles = null, allow_user_ids = null, expires_at = null, expires_at_time_span = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingCreateGatheringRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.player = null if player == null else player.to_model()
        request.attribute_ranges = null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_model())
        request.capacity_of_roles = null if capacity_of_roles == null else capacity_of_roles.map(func(v): return null if v == null else v.to_model())
        request.allow_user_ids = null if allow_user_ids == null else allow_user_ids.map(func(v): return v)
        request.expires_at = expires_at
        request.expires_at_time_span = null if expires_at_time_span == null else expires_at_time_span.to_model()
        return await _rest_client.create_gathering(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzCreateGatheringResult.from_model(async_result.result), null)


func do_matchmaking(game_session, namespace_name, player, matchmaking_context_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingDoMatchmakingRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.player = null if player == null else player.to_model()
        request.matchmaking_context_token = matchmaking_context_token
        return await _rest_client.do_matchmaking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzDoMatchmakingResult.from_model(async_result.result), null)


func early_complete_matchmaking(game_session, namespace_name, gathering_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingEarlyCompleteRequest.new()
        request.namespace_name = namespace_name
        request.gathering_name = gathering_name
        request.access_token = game_session.access_token.token
        return await _rest_client.early_complete(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzEarlyCompleteMatchmakingResult.from_model(async_result.result), null)


func get_gathering(namespace_name, gathering_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetGatheringRequest.new()
        request.namespace_name = namespace_name
        request.gathering_name = gathering_name
        return await _rest_client.get_gathering(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzGetGatheringResult.from_model(async_result.result), null)


func ping(game_session, namespace_name, gathering_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingPingRequest.new()
        request.namespace_name = namespace_name
        request.gathering_name = gathering_name
        return await _rest_client.ping(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzPingResult.from_model(async_result.result), null)


func update_gathering(game_session, namespace_name, gathering_name = null, attribute_ranges = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingUpdateGatheringRequest.new()
        request.namespace_name = namespace_name
        request.gathering_name = gathering_name
        request.access_token = game_session.access_token.token
        request.attribute_ranges = null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.update_gathering(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzUpdateGatheringResult.from_model(async_result.result), null)


func get_rating_model(namespace_name, rating_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetRatingModelRequest.new()
        request.namespace_name = namespace_name
        request.rating_name = rating_name
        return await _web_socket_client.get_rating_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzGetRatingModelResult.from_model(async_result.result), null)


func list_rating_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingDescribeRatingModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_rating_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzListRatingModelsResult.from_model(async_result.result), null)


func get_rating(game_session, namespace_name, rating_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetRatingRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.rating_name = rating_name
        return await _web_socket_client.get_rating(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzGetRatingResult.from_model(async_result.result), null)


func list_ratings(game_session, namespace_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingDescribeRatingsRequest.new()
        request.namespace_name = namespace_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_ratings(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzListRatingsResult.from_model(async_result.result), null)


func create_vote(game_session, namespace_name, rating_name, number_of_player, gathering_name = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetBallotRequest.new()
        request.namespace_name = namespace_name
        request.rating_name = rating_name
        request.gathering_name = gathering_name
        request.access_token = game_session.access_token.token
        request.number_of_player = number_of_player
        request.key_id = key_id
        return await _rest_client.get_ballot(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzCreateVoteResult.from_model(async_result.result), null)


func vote(namespace_name, ballot_body, ballot_signature, game_results = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingVoteRequest.new()
        request.namespace_name = namespace_name
        request.ballot_body = ballot_body
        request.ballot_signature = ballot_signature
        request.game_results = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_model())
        request.key_id = key_id
        return await _web_socket_client.vote(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzVoteResult.from_model(async_result.result), null)


func vote_multiple(namespace_name, signed_ballots = null, game_results = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingVoteMultipleRequest.new()
        request.namespace_name = namespace_name
        request.signed_ballots = null if signed_ballots == null else signed_ballots.map(func(v): return null if v == null else v.to_model())
        request.game_results = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_model())
        request.key_id = key_id
        return await _web_socket_client.vote_multiple(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzVoteMultipleResult.from_model(async_result.result), null)


func get_joined_season_gathering(game_session, namespace_name, season_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetJoinedSeasonGatheringRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _web_socket_client.get_joined_season_gathering(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzGetJoinedSeasonGatheringResult.from_model(async_result.result), null)


func list_joined_season_gatherings(game_session, namespace_name, season_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingDescribeJoinedSeasonGatheringsRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        request.access_token = game_session.access_token.token
        return await _rest_client.describe_joined_season_gatherings(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzListJoinedSeasonGatheringsResult.from_model(async_result.result), null)


func do_season_matchmaking(game_session, namespace_name, season_name, matchmaking_context_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingDoSeasonMatchmakingRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        request.access_token = game_session.access_token.token
        request.matchmaking_context_token = matchmaking_context_token
        return await _rest_client.do_season_matchmaking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzDoSeasonMatchmakingResult.from_model(async_result.result), null)


func get_season_gathering(namespace_name, season_name, tier, season = null, season_gathering_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetSeasonGatheringRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        request.season = season
        request.tier = tier
        request.season_gathering_name = season_gathering_name
        return await _rest_client.get_season_gathering(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzGetSeasonGatheringResult.from_model(async_result.result), null)


func get_season_model(namespace_name, season_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingGetSeasonModelRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        return await _web_socket_client.get_season_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzGetSeasonModelResult.from_model(async_result.result), null)


func list_season_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2MatchmakingDescribeSeasonModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_season_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2MatchmakingEzListSeasonModelsResult.from_model(async_result.result), null)