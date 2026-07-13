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
class_name Gs2MatchmakingCreateGatheringByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var player = null
var attribute_ranges = null
var capacity_of_roles = null
var allow_user_ids = null
var expires_at = null
var expires_at_time_span = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    user_id = v
    return self


func with_player(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    player = v
    return self


func with_attribute_ranges(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    attribute_ranges = v
    return self


func with_capacity_of_roles(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    capacity_of_roles = v
    return self


func with_allow_user_ids(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    allow_user_ids = v
    return self


func with_expires_at(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    expires_at = v
    return self


func with_expires_at_time_span(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    expires_at_time_span = v
    return self


func with_time_offset_token(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MatchmakingCreateGatheringByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingCreateGatheringByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.player = null if data.get("player") == null else Gs2MatchmakingPlayer.from_dict(data.get("player"))
    ret.attribute_ranges = null if data.get("attributeRanges") == null else data.get("attributeRanges").map(func(v): return Gs2MatchmakingAttributeRange.from_dict(v))
    ret.capacity_of_roles = null if data.get("capacityOfRoles") == null else data.get("capacityOfRoles").map(func(v): return Gs2MatchmakingCapacityOfRole.from_dict(v))
    ret.allow_user_ids = null if data.get("allowUserIds") == null else data.get("allowUserIds").map(func(v): return str(v))
    ret.expires_at = null if data.get("expiresAt") == null else int(data.get("expiresAt"))
    ret.expires_at_time_span = null if data.get("expiresAtTimeSpan") == null else Gs2MatchmakingTimeSpan.from_dict(data.get("expiresAtTimeSpan"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["player"] = null if player == null else player.to_dict()
    ret["attributeRanges"] = null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_dict())
    ret["capacityOfRoles"] = null if capacity_of_roles == null else capacity_of_roles.map(func(v): return null if v == null else v.to_dict())
    ret["allowUserIds"] = allow_user_ids
    ret["expiresAt"] = expires_at
    ret["expiresAtTimeSpan"] = null if expires_at_time_span == null else expires_at_time_span.to_dict()
    ret["timeOffsetToken"] = time_offset_token
    return ret