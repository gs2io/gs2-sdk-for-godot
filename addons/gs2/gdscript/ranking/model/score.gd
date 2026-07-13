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
class_name Gs2RankingScore
extends RefCounted


var score_id = null
var category_name = null
var user_id = null
var unique_id = null
var scorer_user_id = null
var score = null
var metadata = null
var created_at = null
var revision = null


func with_score_id(v) -> Gs2RankingScore:
    score_id = v
    return self


func with_category_name(v) -> Gs2RankingScore:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingScore:
    user_id = v
    return self


func with_unique_id(v) -> Gs2RankingScore:
    unique_id = v
    return self


func with_scorer_user_id(v) -> Gs2RankingScore:
    scorer_user_id = v
    return self


func with_score(v) -> Gs2RankingScore:
    score = v
    return self


func with_metadata(v) -> Gs2RankingScore:
    metadata = v
    return self


func with_created_at(v) -> Gs2RankingScore:
    created_at = v
    return self


func with_revision(v) -> Gs2RankingScore:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_category_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("categoryName")


static func get_scorer_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("scorerUserId")


static func get_unique_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):ranking:(?<namespaceName>.+):user:(?<userId>.+):category:(?<categoryName>.+):score:(?<scorerUserId>.+):(?<uniqueId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("uniqueId")


static func from_dict(data) -> Gs2RankingScore:
    if data == null:
        return null
    var ret = Gs2RankingScore.new()
    ret.score_id = null if data.get("scoreId") == null else str(data.get("scoreId"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.unique_id = null if data.get("uniqueId") == null else str(data.get("uniqueId"))
    ret.scorer_user_id = null if data.get("scorerUserId") == null else str(data.get("scorerUserId"))
    ret.score = null if data.get("score") == null else int(data.get("score"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["scoreId"] = score_id
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["uniqueId"] = unique_id
    ret["scorerUserId"] = scorer_user_id
    ret["score"] = score
    ret["metadata"] = metadata
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret