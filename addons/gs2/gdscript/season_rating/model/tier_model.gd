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
class_name Gs2SeasonRatingTierModel
extends RefCounted


var metadata = null
var raise_rank_bonus = null
var entry_fee = null
var minimum_change_point = null
var maximum_change_point = null


func with_metadata(v) -> Gs2SeasonRatingTierModel:
    metadata = v
    return self


func with_raise_rank_bonus(v) -> Gs2SeasonRatingTierModel:
    raise_rank_bonus = v
    return self


func with_entry_fee(v) -> Gs2SeasonRatingTierModel:
    entry_fee = v
    return self


func with_minimum_change_point(v) -> Gs2SeasonRatingTierModel:
    minimum_change_point = v
    return self


func with_maximum_change_point(v) -> Gs2SeasonRatingTierModel:
    maximum_change_point = v
    return self


static func from_dict(data) -> Gs2SeasonRatingTierModel:
    if data == null:
        return null
    var ret = Gs2SeasonRatingTierModel.new()
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.raise_rank_bonus = null if data.get("raiseRankBonus") == null else int(data.get("raiseRankBonus"))
    ret.entry_fee = null if data.get("entryFee") == null else int(data.get("entryFee"))
    ret.minimum_change_point = null if data.get("minimumChangePoint") == null else int(data.get("minimumChangePoint"))
    ret.maximum_change_point = null if data.get("maximumChangePoint") == null else int(data.get("maximumChangePoint"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["metadata"] = metadata
    ret["raiseRankBonus"] = raise_rank_bonus
    ret["entryFee"] = entry_fee
    ret["minimumChangePoint"] = minimum_change_point
    ret["maximumChangePoint"] = maximum_change_point
    return ret