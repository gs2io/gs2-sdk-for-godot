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
class_name Gs2SeasonRatingClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2SeasonRatingRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2SeasonRatingRestClient.new(connection.rest_session)


func get_season_model(namespace_name, season_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SeasonRatingGetSeasonModelRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        return await _rest_client.get_season_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SeasonRatingEzGetSeasonModelResult.from_model(async_result.result), null)


func list_season_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SeasonRatingDescribeSeasonModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_season_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SeasonRatingEzListSeasonModelsResult.from_model(async_result.result), null)


func create_vote(game_session, namespace_name, season_name, number_of_player, session_name = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SeasonRatingGetBallotRequest.new()
        request.namespace_name = namespace_name
        request.season_name = season_name
        request.session_name = session_name
        request.access_token = game_session.access_token.token
        request.number_of_player = number_of_player
        request.key_id = key_id
        return await _rest_client.get_ballot(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SeasonRatingEzCreateVoteResult.from_model(async_result.result), null)


func vote(namespace_name, ballot_body, ballot_signature, game_results = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SeasonRatingVoteRequest.new()
        request.namespace_name = namespace_name
        request.ballot_body = ballot_body
        request.ballot_signature = ballot_signature
        request.game_results = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_model())
        request.key_id = key_id
        return await _rest_client.vote(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SeasonRatingEzVoteResult.from_model(async_result.result), null)


func vote_multiple(namespace_name, signed_ballots = null, game_results = null, key_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2SeasonRatingVoteMultipleRequest.new()
        request.namespace_name = namespace_name
        request.signed_ballots = null if signed_ballots == null else signed_ballots.map(func(v): return null if v == null else v.to_model())
        request.game_results = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_model())
        request.key_id = key_id
        return await _rest_client.vote_multiple(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2SeasonRatingEzVoteMultipleResult.from_model(async_result.result), null)