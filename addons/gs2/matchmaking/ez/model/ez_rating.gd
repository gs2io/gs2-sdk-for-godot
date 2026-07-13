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
class_name Gs2MatchmakingEzRating
extends RefCounted


var rating_id = null
var name = null
var user_id = null
var rate_value = 0
var created_at = 0
var updated_at = 0


func with_rating_id(v) -> Gs2MatchmakingEzRating:
    rating_id = v
    return self


func with_name(v) -> Gs2MatchmakingEzRating:
    name = v
    return self


func with_user_id(v) -> Gs2MatchmakingEzRating:
    user_id = v
    return self


func with_rate_value(v) -> Gs2MatchmakingEzRating:
    rate_value = v
    return self


func with_created_at(v) -> Gs2MatchmakingEzRating:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MatchmakingEzRating:
    updated_at = v
    return self


func to_model() -> Gs2MatchmakingRating:
    var ret = Gs2MatchmakingRating.new()
    ret.rating_id = rating_id
    ret.name = name
    ret.user_id = user_id
    ret.rate_value = rate_value
    ret.created_at = created_at
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2MatchmakingEzRating:
    var ret = Gs2MatchmakingEzRating.new()
    ret.rating_id = model.rating_id
    ret.name = model.name
    ret.user_id = model.user_id
    ret.rate_value = 0 if model.rate_value == null else model.rate_value
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret