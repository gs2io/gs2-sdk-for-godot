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
class_name Gs2MatchmakingJoinedSeasonGathering
extends RefCounted


var joined_season_gathering_id = null
var user_id = null
var season_name = null
var season = null
var tier = null
var season_gathering_name = null
var created_at = null


func with_joined_season_gathering_id(v) -> Gs2MatchmakingJoinedSeasonGathering:
    joined_season_gathering_id = v
    return self


func with_user_id(v) -> Gs2MatchmakingJoinedSeasonGathering:
    user_id = v
    return self


func with_season_name(v) -> Gs2MatchmakingJoinedSeasonGathering:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingJoinedSeasonGathering:
    season = v
    return self


func with_tier(v) -> Gs2MatchmakingJoinedSeasonGathering:
    tier = v
    return self


func with_season_gathering_name(v) -> Gs2MatchmakingJoinedSeasonGathering:
    season_gathering_name = v
    return self


func with_created_at(v) -> Gs2MatchmakingJoinedSeasonGathering:
    created_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):user:(?<userId>.+):joinedGathering")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):user:(?<userId>.+):joinedGathering")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):user:(?<userId>.+):joinedGathering")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_season_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):user:(?<userId>.+):joinedGathering")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("seasonName")


static func get_season_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):user:(?<userId>.+):joinedGathering")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("season")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):user:(?<userId>.+):joinedGathering")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func from_dict(data) -> Gs2MatchmakingJoinedSeasonGathering:
    if data == null:
        return null
    var ret = Gs2MatchmakingJoinedSeasonGathering.new()
    ret.joined_season_gathering_id = null if data.get("joinedSeasonGatheringId") == null else str(data.get("joinedSeasonGatheringId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.tier = null if data.get("tier") == null else int(data.get("tier"))
    ret.season_gathering_name = null if data.get("seasonGatheringName") == null else str(data.get("seasonGatheringName"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["joinedSeasonGatheringId"] = joined_season_gathering_id
    ret["userId"] = user_id
    ret["seasonName"] = season_name
    ret["season"] = season
    ret["tier"] = tier
    ret["seasonGatheringName"] = season_gathering_name
    ret["createdAt"] = created_at
    return ret