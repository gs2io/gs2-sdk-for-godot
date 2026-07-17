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
class_name Gs2RankingClient
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2RankingRestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2RankingRestClient.new(connection.rest_session)


func get_category(namespace_name, category_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingGetCategoryModelRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        return await _rest_client.get_category_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzGetCategoryResult.from_model(async_result.result), null)


func list_categories(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingDescribeCategoryModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_category_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzListCategoriesResult.from_model(async_result.result), null)


func list_subscribes(game_session, namespace_name, category_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingDescribeSubscribesByCategoryNameRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        return await _rest_client.describe_subscribes_by_category_name(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzListSubscribesResult.from_model(async_result.result), null)


func subscribe(game_session, namespace_name, category_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingSubscribeRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.subscribe(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzSubscribeResult.from_model(async_result.result), null)


func unsubscribe(game_session, namespace_name, category_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingUnsubscribeRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.unsubscribe(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzUnsubscribeResult.from_model(async_result.result), null)


func get_near_ranking(namespace_name, category_name, score, additional_scope_name = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingDescribeNearRankingsRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.additional_scope_name = additional_scope_name
        request.score = score
        return await _rest_client.describe_near_rankings(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzGetNearRankingResult.from_model(async_result.result), null)


func get_rank(game_session, namespace_name, category_name, scorer_user_id, additional_scope_name = null, unique_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingGetRankingRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.additional_scope_name = additional_scope_name
        request.scorer_user_id = scorer_user_id
        request.access_token = game_session.access_token.token
        request.unique_id = unique_id
        return await _rest_client.get_ranking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzGetRankResult.from_model(async_result.result), null)


func get_ranking(game_session, namespace_name, category_name, additional_scope_name = null, limit = null, page_token = null, start_index = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingDescribeRankingsRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.additional_scope_name = additional_scope_name
        request.access_token = game_session.access_token.token
        request.limit = limit
        request.page_token = page_token
        request.start_index = start_index
        return await _rest_client.describe_rankings(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzGetRankingResult.from_model(async_result.result), null)


func put_score(game_session, namespace_name, category_name, score, metadata = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingPutScoreRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        request.score = score
        request.metadata = metadata
        return await _rest_client.put_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzPutScoreResult.from_model(async_result.result), null)


func get_score(game_session, namespace_name, category_name, scorer_user_id, unique_id = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingGetScoreRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.access_token = game_session.access_token.token
        request.scorer_user_id = scorer_user_id
        request.unique_id = unique_id
        return await _rest_client.get_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzGetScoreResult.from_model(async_result.result), null)


func list_scores(game_session, namespace_name, category_name, scorer_user_id, limit = null, page_token = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2RankingDescribeScoresRequest.new()
        request.namespace_name = namespace_name
        request.category_name = category_name
        request.scorer_user_id = scorer_user_id
        request.access_token = game_session.access_token.token
        request.limit = limit
        request.page_token = page_token
        return await _rest_client.describe_scores(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2RankingEzListScoresResult.from_model(async_result.result), null)