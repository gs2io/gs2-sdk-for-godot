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
class_name Gs2RankingEzScore
extends RefCounted


var category_name = null
var user_id = null
var unique_id = null
var scorer_user_id = null
var score = 0
var metadata = null


func with_category_name(v) -> Gs2RankingEzScore:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingEzScore:
    user_id = v
    return self


func with_unique_id(v) -> Gs2RankingEzScore:
    unique_id = v
    return self


func with_scorer_user_id(v) -> Gs2RankingEzScore:
    scorer_user_id = v
    return self


func with_score(v) -> Gs2RankingEzScore:
    score = v
    return self


func with_metadata(v) -> Gs2RankingEzScore:
    metadata = v
    return self


func to_model() -> Gs2RankingScore:
    var ret = Gs2RankingScore.new()
    ret.category_name = category_name
    ret.user_id = user_id
    ret.unique_id = unique_id
    ret.scorer_user_id = scorer_user_id
    ret.score = score
    ret.metadata = metadata
    return ret


static func from_model(model) -> Gs2RankingEzScore:
    var ret = Gs2RankingEzScore.new()
    ret.category_name = model.category_name
    ret.user_id = model.user_id
    ret.unique_id = model.unique_id
    ret.scorer_user_id = model.scorer_user_id
    ret.score = 0 if model.score == null else model.score
    ret.metadata = model.metadata
    return ret