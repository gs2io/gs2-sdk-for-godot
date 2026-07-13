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
class_name Gs2MatchmakingEzGathering
extends RefCounted


var gathering_id = null
var name = null
var attribute_ranges = []
var capacity_of_roles = []
var allow_user_ids = []
var metadata = null
var expires_at = 0
var created_at = 0
var updated_at = 0


func with_gathering_id(v) -> Gs2MatchmakingEzGathering:
    gathering_id = v
    return self


func with_name(v) -> Gs2MatchmakingEzGathering:
    name = v
    return self


func with_attribute_ranges(v) -> Gs2MatchmakingEzGathering:
    attribute_ranges = v
    return self


func with_capacity_of_roles(v) -> Gs2MatchmakingEzGathering:
    capacity_of_roles = v
    return self


func with_allow_user_ids(v) -> Gs2MatchmakingEzGathering:
    allow_user_ids = v
    return self


func with_metadata(v) -> Gs2MatchmakingEzGathering:
    metadata = v
    return self


func with_expires_at(v) -> Gs2MatchmakingEzGathering:
    expires_at = v
    return self


func with_created_at(v) -> Gs2MatchmakingEzGathering:
    created_at = v
    return self


func with_updated_at(v) -> Gs2MatchmakingEzGathering:
    updated_at = v
    return self


func to_model() -> Gs2MatchmakingGathering:
    var ret = Gs2MatchmakingGathering.new()
    ret.gathering_id = gathering_id
    ret.name = name
    ret.attribute_ranges = null if attribute_ranges == null else attribute_ranges.map(func(v): return null if v == null else v.to_model())
    ret.capacity_of_roles = null if capacity_of_roles == null else capacity_of_roles.map(func(v): return null if v == null else v.to_model())
    ret.allow_user_ids = null if allow_user_ids == null else allow_user_ids.map(func(v): return v)
    ret.metadata = metadata
    ret.expires_at = expires_at
    ret.created_at = created_at
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2MatchmakingEzGathering:
    var ret = Gs2MatchmakingEzGathering.new()
    ret.gathering_id = model.gathering_id
    ret.name = model.name
    ret.attribute_ranges = [] if model.attribute_ranges == null else model.attribute_ranges.map(func(v): return Gs2MatchmakingEzAttributeRange.from_model(v))
    ret.capacity_of_roles = [] if model.capacity_of_roles == null else model.capacity_of_roles.map(func(v): return Gs2MatchmakingEzCapacityOfRole.from_model(v))
    ret.allow_user_ids = [] if model.allow_user_ids == null else model.allow_user_ids.map(func(v): return v)
    ret.metadata = model.metadata
    ret.expires_at = 0 if model.expires_at == null else model.expires_at
    ret.created_at = 0 if model.created_at == null else model.created_at
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret