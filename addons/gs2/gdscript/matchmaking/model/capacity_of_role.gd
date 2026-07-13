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
class_name Gs2MatchmakingCapacityOfRole
extends RefCounted


var role_name = null
var role_aliases = null
var capacity = null
var participants = null


func with_role_name(v) -> Gs2MatchmakingCapacityOfRole:
    role_name = v
    return self


func with_role_aliases(v) -> Gs2MatchmakingCapacityOfRole:
    role_aliases = v
    return self


func with_capacity(v) -> Gs2MatchmakingCapacityOfRole:
    capacity = v
    return self


func with_participants(v) -> Gs2MatchmakingCapacityOfRole:
    participants = v
    return self


static func from_dict(data) -> Gs2MatchmakingCapacityOfRole:
    if data == null:
        return null
    var ret = Gs2MatchmakingCapacityOfRole.new()
    ret.role_name = null if data.get("roleName") == null else str(data.get("roleName"))
    ret.role_aliases = null if data.get("roleAliases") == null else data.get("roleAliases").map(func(v): return str(v))
    ret.capacity = null if data.get("capacity") == null else int(data.get("capacity"))
    ret.participants = null if data.get("participants") == null else data.get("participants").map(func(v): return Gs2MatchmakingPlayer.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["roleName"] = role_name
    ret["roleAliases"] = role_aliases
    ret["capacity"] = capacity
    ret["participants"] = null if participants == null else participants.map(func(v): return null if v == null else v.to_dict())
    return ret