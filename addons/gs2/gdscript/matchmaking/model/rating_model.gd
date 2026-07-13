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
class_name Gs2MatchmakingRatingModel
extends RefCounted


var rating_model_id = null
var name = null
var metadata = null
var initial_value = null
var volatility = null


func with_rating_model_id(v) -> Gs2MatchmakingRatingModel:
    rating_model_id = v
    return self


func with_name(v) -> Gs2MatchmakingRatingModel:
    name = v
    return self


func with_metadata(v) -> Gs2MatchmakingRatingModel:
    metadata = v
    return self


func with_initial_value(v) -> Gs2MatchmakingRatingModel:
    initial_value = v
    return self


func with_volatility(v) -> Gs2MatchmakingRatingModel:
    volatility = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):model:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):model:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):model:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_rating_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):model:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ratingName")


static func from_dict(data) -> Gs2MatchmakingRatingModel:
    if data == null:
        return null
    var ret = Gs2MatchmakingRatingModel.new()
    ret.rating_model_id = null if data.get("ratingModelId") == null else str(data.get("ratingModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.initial_value = null if data.get("initialValue") == null else int(data.get("initialValue"))
    ret.volatility = null if data.get("volatility") == null else int(data.get("volatility"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["ratingModelId"] = rating_model_id
    ret["name"] = name
    ret["metadata"] = metadata
    ret["initialValue"] = initial_value
    ret["volatility"] = volatility
    return ret