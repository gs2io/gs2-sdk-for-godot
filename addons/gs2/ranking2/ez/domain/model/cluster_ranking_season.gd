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
class_name Gs2Ranking2EzClusterRankingSeasonDomain
extends RefCounted


var _domain: Gs2Ranking2ClusterRankingSeasonDomain
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
var cluster_name: Variant:
    get:
        return null if _domain == null else _domain.cluster_name
var season: Variant:
    get:
        return null if _domain == null else _domain.season
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id


func _init(
    domain: Gs2Ranking2ClusterRankingSeasonDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func cluster_ranking_received_reward(
) -> Gs2Ranking2EzClusterRankingReceivedRewardDomain:
    return Gs2Ranking2EzClusterRankingReceivedRewardDomain.new(
        _domain.cluster_ranking_received_reward(
        ),
        _connection
    )


func cluster_ranking_score(
) -> Gs2Ranking2EzClusterRankingScoreDomain:
    return Gs2Ranking2EzClusterRankingScoreDomain.new(
        _domain.cluster_ranking_score(
        ),
        _connection
    )