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
class_name Gs2MatchmakingEzPlayer
extends RefCounted


var user_id = null
var attributes = []
var role_name = null
var deny_user_ids = []


func with_user_id(v) -> Gs2MatchmakingEzPlayer:
    user_id = v
    return self


func with_attributes(v) -> Gs2MatchmakingEzPlayer:
    attributes = v
    return self


func with_role_name(v) -> Gs2MatchmakingEzPlayer:
    role_name = v
    return self


func with_deny_user_ids(v) -> Gs2MatchmakingEzPlayer:
    deny_user_ids = v
    return self


func to_model() -> Gs2MatchmakingPlayer:
    var ret = Gs2MatchmakingPlayer.new()
    ret.user_id = user_id
    ret.attributes = null if attributes == null else attributes.map(func(v): return null if v == null else v.to_model())
    ret.role_name = role_name
    ret.deny_user_ids = null if deny_user_ids == null else deny_user_ids.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2MatchmakingEzPlayer:
    var ret = Gs2MatchmakingEzPlayer.new()
    ret.user_id = model.user_id
    ret.attributes = [] if model.attributes == null else model.attributes.map(func(v): return Gs2MatchmakingEzAttribute.from_model(v))
    ret.role_name = model.role_name
    ret.deny_user_ids = [] if model.deny_user_ids == null else model.deny_user_ids.map(func(v): return v)
    return ret