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
class_name Gs2MatchmakingEzCapacityOfRole
extends RefCounted


var role_name = null
var role_aliases = []
var capacity = 0
var participants = []


func with_role_name(v) -> Gs2MatchmakingEzCapacityOfRole:
    role_name = v
    return self


func with_role_aliases(v) -> Gs2MatchmakingEzCapacityOfRole:
    role_aliases = v
    return self


func with_capacity(v) -> Gs2MatchmakingEzCapacityOfRole:
    capacity = v
    return self


func with_participants(v) -> Gs2MatchmakingEzCapacityOfRole:
    participants = v
    return self


func to_model() -> Gs2MatchmakingCapacityOfRole:
    var ret = Gs2MatchmakingCapacityOfRole.new()
    ret.role_name = role_name
    ret.role_aliases = null if role_aliases == null else role_aliases.map(func(v): return v)
    ret.capacity = capacity
    ret.participants = null if participants == null else participants.map(func(v): return null if v == null else v.to_model())
    return ret


static func from_model(model) -> Gs2MatchmakingEzCapacityOfRole:
    var ret = Gs2MatchmakingEzCapacityOfRole.new()
    ret.role_name = model.role_name
    ret.role_aliases = [] if model.role_aliases == null else model.role_aliases.map(func(v): return v)
    ret.capacity = 0 if model.capacity == null else model.capacity
    ret.participants = [] if model.participants == null else model.participants.map(func(v): return Gs2MatchmakingEzPlayer.from_model(v))
    return ret