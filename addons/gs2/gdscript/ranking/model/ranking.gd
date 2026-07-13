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
class_name Gs2RankingRanking
extends RefCounted


var rank = null
var index = null
var category_name = null
var user_id = null
var score = null
var metadata = null
var created_at = null


func with_rank(v) -> Gs2RankingRanking:
    rank = v
    return self


func with_index(v) -> Gs2RankingRanking:
    index = v
    return self


func with_category_name(v) -> Gs2RankingRanking:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingRanking:
    user_id = v
    return self


func with_score(v) -> Gs2RankingRanking:
    score = v
    return self


func with_metadata(v) -> Gs2RankingRanking:
    metadata = v
    return self


func with_created_at(v) -> Gs2RankingRanking:
    created_at = v
    return self


static func from_dict(data) -> Gs2RankingRanking:
    if data == null:
        return null
    var ret = Gs2RankingRanking.new()
    ret.rank = null if data.get("rank") == null else int(data.get("rank"))
    ret.index = null if data.get("index") == null else int(data.get("index"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.score = null if data.get("score") == null else int(data.get("score"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rank"] = rank
    ret["index"] = index
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["score"] = score
    ret["metadata"] = metadata
    ret["createdAt"] = created_at
    return ret