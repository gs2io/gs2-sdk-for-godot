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
class_name Gs2SeasonRatingEzTierModel
extends RefCounted


var metadata = null
var raise_rank_bonus = 0
var minimum_change_point = 0
var maximum_change_point = 0


func with_metadata(v) -> Gs2SeasonRatingEzTierModel:
    metadata = v
    return self


func with_raise_rank_bonus(v) -> Gs2SeasonRatingEzTierModel:
    raise_rank_bonus = v
    return self


func with_minimum_change_point(v) -> Gs2SeasonRatingEzTierModel:
    minimum_change_point = v
    return self


func with_maximum_change_point(v) -> Gs2SeasonRatingEzTierModel:
    maximum_change_point = v
    return self


func to_model() -> Gs2SeasonRatingTierModel:
    var ret = Gs2SeasonRatingTierModel.new()
    ret.metadata = metadata
    ret.raise_rank_bonus = raise_rank_bonus
    ret.minimum_change_point = minimum_change_point
    ret.maximum_change_point = maximum_change_point
    return ret


static func from_model(model) -> Gs2SeasonRatingEzTierModel:
    var ret = Gs2SeasonRatingEzTierModel.new()
    ret.metadata = model.metadata
    ret.raise_rank_bonus = 0 if model.raise_rank_bonus == null else model.raise_rank_bonus
    ret.minimum_change_point = 0 if model.minimum_change_point == null else model.minimum_change_point
    ret.maximum_change_point = 0 if model.maximum_change_point == null else model.maximum_change_point
    return ret