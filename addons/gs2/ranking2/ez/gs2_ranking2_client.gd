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
class_name Gs2Ranking2Client
extends RefCounted


var _connection: Gs2Connection
var _rest_client: Gs2Ranking2RestClient


func _init(connection: Gs2Connection):
    _connection = connection
    _rest_client = Gs2Ranking2RestClient.new(connection.rest_session)


func get_global_ranking_rank(game_session, namespace_name, ranking_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetGlobalRankingRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_global_ranking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetGlobalRankingRankResult.from_model(async_result.result), null)


func list_global_rankings(game_session, namespace_name, ranking_name, season = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeGlobalRankingsRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_global_rankings(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListGlobalRankingsResult.from_model(async_result.result), null)


func get_global_ranking_model(namespace_name, ranking_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetGlobalRankingModelRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        return await _rest_client.get_global_ranking_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetGlobalRankingModelResult.from_model(async_result.result), null)


func list_global_ranking_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeGlobalRankingModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_global_ranking_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListGlobalRankingModelsResult.from_model(async_result.result), null)


func get_global_ranking_received_reward(game_session, namespace_name, ranking_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetGlobalRankingReceivedRewardRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_global_ranking_received_reward(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetGlobalRankingReceivedRewardResult.from_model(async_result.result), null)


func list_global_ranking_received_rewards(game_session, namespace_name, ranking_name = null, season = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeGlobalRankingReceivedRewardsRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_global_ranking_received_rewards(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListGlobalRankingReceivedRewardsResult.from_model(async_result.result), null)


func receive_global_ranking_reward(game_session, namespace_name, ranking_name, season = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2ReceiveGlobalRankingReceivedRewardRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.receive_global_ranking_received_reward(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzReceiveGlobalRankingRewardResult.from_model(async_result.result), null)


func get_global_ranking_score(game_session, namespace_name, ranking_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetGlobalRankingScoreRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_global_ranking_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetGlobalRankingScoreResult.from_model(async_result.result), null)


func list_global_ranking_scores(game_session, namespace_name, ranking_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeGlobalRankingScoresRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_global_ranking_scores(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListGlobalRankingScoresResult.from_model(async_result.result), null)


func put_global_ranking(game_session, namespace_name, ranking_name, score, metadata = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2PutGlobalRankingScoreRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.access_token = game_session.access_token.token
        request.score = score
        request.metadata = metadata
        return await _rest_client.put_global_ranking_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzPutGlobalRankingResult.from_model(async_result.result), null)


func get_cluster_ranking_rank(game_session, namespace_name, ranking_name, cluster_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetClusterRankingRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_cluster_ranking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetClusterRankingRankResult.from_model(async_result.result), null)


func list_cluster_rankings(game_session, namespace_name, ranking_name, cluster_name, season = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeClusterRankingsRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_cluster_rankings(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListClusterRankingsResult.from_model(async_result.result), null)


func get_cluster_ranking_model(namespace_name, ranking_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetClusterRankingModelRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        return await _rest_client.get_cluster_ranking_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetClusterRankingModelResult.from_model(async_result.result), null)


func list_cluster_ranking_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeClusterRankingModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_cluster_ranking_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListClusterRankingModelsResult.from_model(async_result.result), null)


func get_cluster_ranking_received_reward(game_session, namespace_name, ranking_name, cluster_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetClusterRankingReceivedRewardRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_cluster_ranking_received_reward(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetClusterRankingReceivedRewardResult.from_model(async_result.result), null)


func list_cluster_ranking_received_rewards(game_session, namespace_name, ranking_name = null, cluster_name = null, season = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeClusterRankingReceivedRewardsRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_cluster_ranking_received_rewards(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListClusterRankingReceivedRewardsResult.from_model(async_result.result), null)


func receive_cluster_ranking_reward(game_session, namespace_name, ranking_name, cluster_name, season = null, config = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2ReceiveClusterRankingReceivedRewardRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.config = null if config == null else config.map(func(v): return null if v == null else v.to_model())
        return await _rest_client.receive_cluster_ranking_received_reward(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzReceiveClusterRankingRewardResult.from_model(async_result.result), null)


func get_cluster_ranking_score(game_session, namespace_name, ranking_name, cluster_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetClusterRankingScoreRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_cluster_ranking_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetClusterRankingScoreResult.from_model(async_result.result), null)


func list_cluster_ranking_scores(game_session, namespace_name, ranking_name = null, cluster_name = null, season = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeClusterRankingScoresRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_cluster_ranking_scores(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListClusterRankingScoresResult.from_model(async_result.result), null)


func put_cluster_ranking(game_session, namespace_name, ranking_name, cluster_name, score, metadata = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2PutClusterRankingScoreRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.cluster_name = cluster_name
        request.access_token = game_session.access_token.token
        request.score = score
        request.metadata = metadata
        return await _rest_client.put_cluster_ranking_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzPutClusterRankingResult.from_model(async_result.result), null)


func get_subscribe(game_session, namespace_name, ranking_name, target_user_id) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetSubscribeRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.access_token = game_session.access_token.token
        request.target_user_id = target_user_id
        return await _rest_client.get_subscribe(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetSubscribeResult.from_model(async_result.result), null)


func list_subscribes(game_session, namespace_name, ranking_name, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeSubscribesRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_subscribes(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListSubscribesResult.from_model(async_result.result), null)


func get_subscribe_ranking_rank(game_session, namespace_name, ranking_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetSubscribeRankingRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_subscribe_ranking(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetSubscribeRankingRankResult.from_model(async_result.result), null)


func list_subscribe_rankings(game_session, namespace_name, ranking_name, season = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeSubscribeRankingsRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_subscribe_rankings(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListSubscribeRankingsResult.from_model(async_result.result), null)


func get_subscribe_ranking_model(namespace_name, ranking_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetSubscribeRankingModelRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        return await _rest_client.get_subscribe_ranking_model(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetSubscribeRankingModelResult.from_model(async_result.result), null)


func list_subscribe_ranking_models(namespace_name) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeSubscribeRankingModelsRequest.new()
        request.namespace_name = namespace_name
        return await _rest_client.describe_subscribe_ranking_models(request)
    var async_result = await _connection.run(null, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListSubscribeRankingModelsResult.from_model(async_result.result), null)


func get_subscribe_ranking_score(game_session, namespace_name, ranking_name, season = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2GetSubscribeRankingScoreRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.season = season
        request.access_token = game_session.access_token.token
        return await _rest_client.get_subscribe_ranking_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzGetSubscribeRankingScoreResult.from_model(async_result.result), null)


func list_subscribe_ranking_scores(game_session, namespace_name, ranking_name = null, page_token = null, limit = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2DescribeSubscribeRankingScoresRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.access_token = game_session.access_token.token
        request.page_token = page_token
        request.limit = limit
        return await _rest_client.describe_subscribe_ranking_scores(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzListSubscribeRankingScoresResult.from_model(async_result.result), null)


func put_subscribe_ranking(game_session, namespace_name, ranking_name, score, metadata = null) -> Gs2AsyncResult:
    var request_action = func():
        var request = Gs2Ranking2PutSubscribeRankingScoreRequest.new()
        request.namespace_name = namespace_name
        request.ranking_name = ranking_name
        request.access_token = game_session.access_token.token
        request.score = score
        request.metadata = metadata
        return await _rest_client.put_subscribe_ranking_score(request)
    var async_result = await _connection.run(game_session, request_action)
    if async_result.error != null:
        return Gs2AsyncResult.new(null, async_result.error)
    return Gs2AsyncResult.new(null if async_result.result == null else Gs2Ranking2EzPutSubscribeRankingResult.from_model(async_result.result), null)