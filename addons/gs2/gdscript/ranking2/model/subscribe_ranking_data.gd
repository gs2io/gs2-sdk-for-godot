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
class_name Gs2Ranking2SubscribeRankingData
extends RefCounted


var subscribe_ranking_data_id = null
var ranking_name = null
var season = null
var user_id = null
var index = null
var rank = null
var scorer_user_id = null
var score = null
var metadata = null
var invert_updated_at = null
var created_at = null
var updated_at = null
var revision = null


func with_subscribe_ranking_data_id(v) -> Gs2Ranking2SubscribeRankingData:
    subscribe_ranking_data_id = v
    return self


func with_ranking_name(v) -> Gs2Ranking2SubscribeRankingData:
    ranking_name = v
    return self


func with_season(v) -> Gs2Ranking2SubscribeRankingData:
    season = v
    return self


func with_user_id(v) -> Gs2Ranking2SubscribeRankingData:
    user_id = v
    return self


func with_index(v) -> Gs2Ranking2SubscribeRankingData:
    index = v
    return self


func with_rank(v) -> Gs2Ranking2SubscribeRankingData:
    rank = v
    return self


func with_scorer_user_id(v) -> Gs2Ranking2SubscribeRankingData:
    scorer_user_id = v
    return self


func with_score(v) -> Gs2Ranking2SubscribeRankingData:
    score = v
    return self


func with_metadata(v) -> Gs2Ranking2SubscribeRankingData:
    metadata = v
    return self


func with_invert_updated_at(v) -> Gs2Ranking2SubscribeRankingData:
    invert_updated_at = v
    return self


func with_created_at(v) -> Gs2Ranking2SubscribeRankingData:
    created_at = v
    return self


func with_updated_at(v) -> Gs2Ranking2SubscribeRankingData:
    updated_at = v
    return self


func with_revision(v) -> Gs2Ranking2SubscribeRankingData:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_ranking_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("rankingName")


static func get_season_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("season")


static func get_scorer_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking2:(?<namespaceName>.+):user:(?<userId>.+):ranking:subscribe:(?<rankingName>.+):(?<season>.+):user:(?<scorerUserId>.+):score")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("scorerUserId")


static func from_dict(data) -> Gs2Ranking2SubscribeRankingData:
    if data == null:
        return null
    var ret = Gs2Ranking2SubscribeRankingData.new()
    ret.subscribe_ranking_data_id = null if data.get("subscribeRankingDataId") == null else str(data.get("subscribeRankingDataId"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.index = null if data.get("index") == null else int(data.get("index"))
    ret.rank = null if data.get("rank") == null else int(data.get("rank"))
    ret.scorer_user_id = null if data.get("scorerUserId") == null else str(data.get("scorerUserId"))
    ret.score = null if data.get("score") == null else int(data.get("score"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.invert_updated_at = null if data.get("invertUpdatedAt") == null else int(data.get("invertUpdatedAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["subscribeRankingDataId"] = subscribe_ranking_data_id
    ret["rankingName"] = ranking_name
    ret["season"] = season
    ret["userId"] = user_id
    ret["index"] = index
    ret["rank"] = rank
    ret["scorerUserId"] = scorer_user_id
    ret["score"] = score
    ret["metadata"] = metadata
    ret["invertUpdatedAt"] = invert_updated_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret