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
class_name Gs2SeasonRatingEzNamespaceDomain
extends RefCounted


var _domain: Gs2SeasonRatingNamespaceDomain
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
    domain: Gs2SeasonRatingNamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection
func vote(
    ballot_body,
    ballot_signature,
    game_results = null,
    key_id = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.vote_(
            Gs2SeasonRatingVoteRequest.new()
                .with_ballot_body(ballot_body)
                .with_ballot_signature(ballot_signature)
                .with_game_results(null if game_results == null else game_results.map(func(v): return null if v == null else v.to_model()))
                .with_key_id(key_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2SeasonRatingEzBallotDomain.new(
        async_result.result,
        _connection
    ), null)
func vote_multiple(
    signed_ballots = null,
    game_results = null,
    key_id = null
) -> Gs2AsyncResult:
    var async_result = await _connection.run(
        null,
        func(): return await _domain.vote_multiple(
            Gs2SeasonRatingVoteMultipleRequest.new()
                .with_signed_ballots(null if signed_ballots == null else signed_ballots.map(func(v): return null if v == null else v.to_model()))
                .with_game_results(null if game_results == null else game_results.map(func(v): return null if v == null else v.to_model()))
                .with_key_id(key_id)
        )
    )
    if async_result.error != null:
        return async_result
    return Gs2AsyncResult.new(Gs2SeasonRatingEzBallotDomain.new(
        async_result.result,
        _connection
    ), null)


func season_models(
) -> Gs2SeasonRatingEzListSeasonModelsIterator:
    return Gs2SeasonRatingEzListSeasonModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_season_models(
    callback: Callable
) -> int:
    return _domain.subscribe_season_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2SeasonRatingEzSeasonModel.from_model(v)))
    )


func unsubscribe_season_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_season_models(
        callback_id
    )


func season_model(
    season_name
) -> Gs2SeasonRatingEzSeasonModelDomain:
    return Gs2SeasonRatingEzSeasonModelDomain.new(
        _domain.season_model(
            season_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2SeasonRatingEzUserDomain:
    return Gs2SeasonRatingEzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2SeasonRatingEzUserGameSessionDomain:
    return Gs2SeasonRatingEzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )