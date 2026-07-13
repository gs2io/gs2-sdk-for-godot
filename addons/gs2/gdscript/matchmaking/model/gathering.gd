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
class_name Gs2MatchmakingGathering
extends RefCounted


var gathering_id = null
var name = null
var attribute_ranges = null
var capacity_of_roles = null
var allow_user_ids = null
var metadata = null
var expires_at = null
var created_at = null
var updated_at = null
var revision = null


func with_gathering_id(v) -> Gs2MatchmakingGathering:
    gathering_id = v
    return self


func with_name(v) -> Gs2MatchmakingGathering:
    name = v
    return self


func with_attribute_ranges(v) -> Gs2MatchmakingGathering:
    attribute_ranges = v
    return self


func with_capacity_of_roles(v) -> Gs2MatchmakingGathering:
    capacity_of_roles = v
    return self


func with_allow_user_ids(v) -> Gs2MatchmakingGathering:
    allow_user_ids = v
    return self


func with_metadata(v) -> Gs2MatchmakingGathering:
    metadata = v
    return self


func with_expires_at(v) -> Gs2MatchmakingGathering:
    expires_at = v
    return self


func with_created_at(v) -> Gs2MatchmakingGathering:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MatchmakingGathering:
    updated_at = v
    return self


func with_revision(v) -> Gs2MatchmakingGathering:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):gathering:(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):gathering:(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):gathering:(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_gathering_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):matchmaking:(?<namespaceName>.+):gathering:(?<gatheringName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("gatheringName")


static func from_dict(data) -> Gs2MatchmakingGathering:
    if data == null:
        return null
    var ret = Gs2MatchmakingGathering.new()
    ret.gathering_id = null if data.get("gatheringId") == null else str(data.get("gatheringId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.attribute_ranges = null if data.get("attributeRanges") == null else data.get("attributeRanges").map(func(v): return Gs2MatchmakingAttributeRange.from_dict(v))
    ret.capacity_of_roles = null if data.get("capacityOfRoles") == null else data.get("capacityOfRoles").map(func(v): return Gs2MatchmakingCapacityOfRole.from_dict(v))
    ret.allow_user_ids = null if data.get("allowUserIds") == null else data.get("allowUserIds").map(func(v): return str(v))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["gatheringId"] = gathering_id
    ret["name"] = name
    ret["attributeRanges"] = null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    ret["capacityOfRoles"] = null if capacity_of_roles == null else capacity_of_roles.map(func(v): return null if v == null else v.to_dict())
    ret["allowUserIds"] = allow_user_ids
    ret["metadata"] = metadata
    ret["expiresAt"] = expires_at
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret