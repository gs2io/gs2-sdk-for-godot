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
class_name Gs2MatchmakingSeasonGathering
extends RefCounted


var season_gathering_id = null
var season_name = null
var season = null
var tier = null
var name = null
var participants = null
var created_at = null
var revision = null


func with_season_gathering_id(v) -> Gs2MatchmakingSeasonGathering:
    season_gathering_id = v
    return self


func with_season_name(v) -> Gs2MatchmakingSeasonGathering:
    season_name = v
    return self


func with_season(v) -> Gs2MatchmakingSeasonGathering:
    season = v
    return self


func with_tier(v) -> Gs2MatchmakingSeasonGathering:
    tier = v
    return self


func with_name(v) -> Gs2MatchmakingSeasonGathering:
    name = v
    return self


func with_participants(v) -> Gs2MatchmakingSeasonGathering:
    participants = v
    return self


func with_created_at(v) -> Gs2MatchmakingSeasonGathering:
    created_at = v
    return self


func with_revision(v) -> Gs2MatchmakingSeasonGathering:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_season_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("seasonName")


static func get_season_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("season")


static func get_tier_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("tier")


static func get_season_gathering_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):season:(?<seasonName>.+):(?<season>.+):(?<tier>.+):gathering:(?<seasonGatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("seasonGatheringName")


static func from_dict(data) -> Gs2MatchmakingSeasonGathering:
    if data == null:
        return null
    var ret = Gs2MatchmakingSeasonGathering.new()
    ret.season_gathering_id = null if data.get("seasonGatheringId") == null else str(data.get("seasonGatheringId"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.tier = null if data.get("tier") == null else int(data.get("tier"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.participants = null if data.get("participants") == null else data.get("participants").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["seasonGatheringId"] = season_gathering_id
    ret["seasonName"] = season_name
    ret["season"] = season
    ret["tier"] = tier
    ret["name"] = name
    ret["participants"] = participants
    ret["createdAt"] = created_at
    ret["revision"] = revision
    return ret