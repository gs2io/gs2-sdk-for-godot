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
class_name Gs2MatchmakingRating
extends RefCounted


var rating_id = null
var name = null
var user_id = null
var rate_value = null
var created_at = null
var updated_at = null
var revision = null


func with_rating_id(v) -> Gs2MatchmakingRating:
    rating_id = v
    return self


func with_name(v) -> Gs2MatchmakingRating:
    name = v
    return self


func with_user_id(v) -> Gs2MatchmakingRating:
    user_id = v
    return self


func with_rate_value(v) -> Gs2MatchmakingRating:
    rate_value = v
    return self


func with_created_at(v) -> Gs2MatchmakingRating:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MatchmakingRating:
    updated_at = v
    return self


func with_revision(v) -> Gs2MatchmakingRating:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):user:(?<userId>.+):rating:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):user:(?<userId>.+):rating:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):user:(?<userId>.+):rating:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):user:(?<userId>.+):rating:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func get_rating_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):user:(?<userId>.+):rating:(?<ratingName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ratingName")


static func from_dict(data) -> Gs2MatchmakingRating:
    if data == null:
        return null
    var ret = Gs2MatchmakingRating.new()
    ret.rating_id = null if data.get("ratingId") == null else str(data.get("ratingId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.rate_value = null if data.get("rateValue") == null else float(data.get("rateValue"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["ratingId"] = rating_id
    ret["name"] = name
    ret["userId"] = user_id
    ret["rateValue"] = rate_value
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret