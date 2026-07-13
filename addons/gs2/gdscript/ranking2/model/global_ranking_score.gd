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
class_name Gs2Ranking2GlobalRankingScore
extends RefCounted


var global_ranking_score_id = null
var ranking_name = null
var user_id = null
var season = null
var score = null
var metadata = null
var created_at = null
var updated_at = null
var revision = null


func with_global_ranking_score_id(v) -> Gs2Ranking2GlobalRankingScore:
    global_ranking_score_id = v
    return self


func with_ranking_name(v) -> Gs2Ranking2GlobalRankingScore:
    ranking_name = v
    return self


func with_user_id(v) -> Gs2Ranking2GlobalRankingScore:
    user_id = v
    return self


func with_season(v) -> Gs2Ranking2GlobalRankingScore:
    season = v
    return self


func with_score(v) -> Gs2Ranking2GlobalRankingScore:
    score = v
    return self


func with_metadata(v) -> Gs2Ranking2GlobalRankingScore:
    metadata = v
    return self


func with_created_at(v) -> Gs2Ranking2GlobalRankingScore:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Ranking2GlobalRankingScore:
    updated_at = v
    return self


func with_revision(v) -> Gs2Ranking2GlobalRankingScore:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):global:(?<rankingName>.+):(?<season>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):global:(?<rankingName>.+):(?<season>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):global:(?<rankingName>.+):(?<season>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):global:(?<rankingName>.+):(?<season>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_ranking_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):global:(?<rankingName>.+):(?<season>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rankingName")


static func get_season_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):global:(?<rankingName>.+):(?<season>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("season")


static func from_dict(data) -> Gs2Ranking2GlobalRankingScore:
    if data == null:
        return null
    var ret = Gs2Ranking2GlobalRankingScore.new()
    ret.global_ranking_score_id = null if data.get("globalRankingScoreId") == null else str(data.get("globalRankingScoreId"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.score = null if data.get("score") == null else int(data.get("score"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["globalRankingScoreId"] = global_ranking_score_id
    ret["rankingName"] = ranking_name
    ret["userId"] = user_id
    ret["season"] = season
    ret["score"] = score
    ret["metadata"] = metadata
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret