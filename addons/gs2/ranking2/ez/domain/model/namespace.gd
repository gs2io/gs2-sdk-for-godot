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
class_name Gs2Ranking2EzNamespaceDomain
extends RefCounted


var _domain: Gs2Ranking2NamespaceDomain
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
    domain: Gs2Ranking2NamespaceDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func global_ranking_models(
) -> Gs2Ranking2EzListGlobalRankingModelsIterator:
    return Gs2Ranking2EzListGlobalRankingModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_global_ranking_models(
    callback: Callable
) -> int:
    return _domain.subscribe_global_ranking_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Ranking2EzGlobalRankingModel.from_model(v)))
    )


func unsubscribe_global_ranking_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_global_ranking_models(
        callback_id
    )


func cluster_ranking_models(
) -> Gs2Ranking2EzListClusterRankingModelsIterator:
    return Gs2Ranking2EzListClusterRankingModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_cluster_ranking_models(
    callback: Callable
) -> int:
    return _domain.subscribe_cluster_ranking_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Ranking2EzClusterRankingModel.from_model(v)))
    )


func unsubscribe_cluster_ranking_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_cluster_ranking_models(
        callback_id
    )


func subscribe_ranking_models(
) -> Gs2Ranking2EzListSubscribeRankingModelsIterator:
    return Gs2Ranking2EzListSubscribeRankingModelsIterator.new(
        _domain,
        _connection
    )


func subscribe_subscribe_ranking_models(
    callback: Callable
) -> int:
    return _domain.subscribe_subscribe_ranking_models(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2Ranking2EzSubscribeRankingModel.from_model(v)))
    )


func unsubscribe_subscribe_ranking_models(
    callback_id: int
) -> void:
    _domain.unsubscribe_subscribe_ranking_models(
        callback_id
    )


func global_ranking_model(
    ranking_name
) -> Gs2Ranking2EzGlobalRankingModelDomain:
    return Gs2Ranking2EzGlobalRankingModelDomain.new(
        _domain.global_ranking_model(
            ranking_name
        ),
        _connection
    )


func user(
    user_id
) -> Gs2Ranking2EzUserDomain:
    return Gs2Ranking2EzUserDomain.new(
        _domain.user(
            user_id
        ),
        _connection
    )


func me(
    game_session
) -> Gs2Ranking2EzUserGameSessionDomain:
    return Gs2Ranking2EzUserGameSessionDomain.new(
        _domain.access_token(
            game_session.access_token
        ),
        game_session,
        _connection
    )


func subscribe_ranking_model(
    ranking_name
) -> Gs2Ranking2EzSubscribeRankingModelDomain:
    return Gs2Ranking2EzSubscribeRankingModelDomain.new(
        _domain.subscribe_ranking_model(
            ranking_name
        ),
        _connection
    )


func cluster_ranking_model(
    ranking_name
) -> Gs2Ranking2EzClusterRankingModelDomain:
    return Gs2Ranking2EzClusterRankingModelDomain.new(
        _domain.cluster_ranking_model(
            ranking_name
        ),
        _connection
    )