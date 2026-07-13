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
class_name Gs2MatchmakingVote
extends RefCounted


var vote_id = null
var rating_name = null
var gathering_name = null
var written_ballots = null
var created_at = null
var updated_at = null


func with_vote_id(v) -> Gs2MatchmakingVote:
    vote_id = v
    return self


func with_rating_name(v) -> Gs2MatchmakingVote:
    rating_name = v
    return self


func with_gathering_name(v) -> Gs2MatchmakingVote:
    gathering_name = v
    return self


func with_written_ballots(v) -> Gs2MatchmakingVote:
    written_ballots = v
    return self


func with_created_at(v) -> Gs2MatchmakingVote:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MatchmakingVote:
    updated_at = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):vote:(?<ratingName>.+):(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):vote:(?<ratingName>.+):(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):vote:(?<ratingName>.+):(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_rating_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):vote:(?<ratingName>.+):(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ratingName")


static func get_gathering_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):vote:(?<ratingName>.+):(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("gatheringName")


static func from_dict(data) -> Gs2MatchmakingVote:
    if data == null:
        return null
    var ret = Gs2MatchmakingVote.new()
    ret.vote_id = null if data.get("voteId") == null else str(data.get("voteId"))
    ret.rating_name = null if data.get("ratingName") == null else str(data.get("ratingName"))
    ret.gathering_name = null if data.get("gatheringName") == null else str(data.get("gatheringName"))
    ret.written_ballots = null if data.get("writtenBallots") == null else data.get("writtenBallots").map(func(v): return Gs2MatchmakingWrittenBallot.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["voteId"] = vote_id
    ret["ratingName"] = rating_name
    ret["gatheringName"] = gathering_name
    ret["writtenBallots"] = null if written_ballots == null else written_ballots.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    return ret