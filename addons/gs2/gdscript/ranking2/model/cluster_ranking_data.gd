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
class_name Gs2Ranking2ClusterRankingData
extends RefCounted


var cluster_ranking_data_id = null
var ranking_name = null
var cluster_name = null
var season = null
var user_id = null
var index = null
var rank = null
var score = null
var metadata = null
var invert_updated_at = null
var created_at = null
var updated_at = null
var revision = null


func with_cluster_ranking_data_id(v) -> Gs2Ranking2ClusterRankingData:
    cluster_ranking_data_id = v
    return self


func with_ranking_name(v) -> Gs2Ranking2ClusterRankingData:
    ranking_name = v
    return self


func with_cluster_name(v) -> Gs2Ranking2ClusterRankingData:
    cluster_name = v
    return self


func with_season(v) -> Gs2Ranking2ClusterRankingData:
    season = v
    return self


func with_user_id(v) -> Gs2Ranking2ClusterRankingData:
    user_id = v
    return self


func with_index(v) -> Gs2Ranking2ClusterRankingData:
    index = v
    return self


func with_rank(v) -> Gs2Ranking2ClusterRankingData:
    rank = v
    return self


func with_score(v) -> Gs2Ranking2ClusterRankingData:
    score = v
    return self


func with_metadata(v) -> Gs2Ranking2ClusterRankingData:
    metadata = v
    return self


func with_invert_updated_at(v) -> Gs2Ranking2ClusterRankingData:
    invert_updated_at = v
    return self


func with_created_at(v) -> Gs2Ranking2ClusterRankingData:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Ranking2ClusterRankingData:
    updated_at = v
    return self


func with_revision(v) -> Gs2Ranking2ClusterRankingData:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_ranking_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rankingName")


static func get_cluster_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("clusterName")


static func get_season_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("season")


static func get_scorer_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):cluster:(?<rankingName>.+):ranking:cluster:(?<clusterName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("scorerUserId")


static func from_dict(data) -> Gs2Ranking2ClusterRankingData:
    if data == null:
        return null
    var ret = Gs2Ranking2ClusterRankingData.new()
    ret.cluster_ranking_data_id = null if data.get("clusterRankingDataId") == null else str(data.get("clusterRankingDataId"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.cluster_name = null if data.get("clusterName") == null else str(data.get("clusterName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.index = null if data.get("index") == null else int(data.get("index"))
    ret.rank = null if data.get("rank") == null else int(data.get("rank"))
    ret.score = null if data.get("score") == null else int(data.get("score"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.invert_updated_at = null if data.get("invertUpdatedAt") == null else int(data.get("invertUpdatedAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["clusterRankingDataId"] = cluster_ranking_data_id
    ret["rankingName"] = ranking_name
    ret["clusterName"] = cluster_name
    ret["season"] = season
    ret["userId"] = user_id
    ret["index"] = index
    ret["rank"] = rank
    ret["score"] = score
    ret["metadata"] = metadata
    ret["invertUpdatedAt"] = invert_updated_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret