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
class_name Gs2MatchmakingPlayer
extends RefCounted


var user_id = null
var attributes = null
var role_name = null
var deny_user_ids = null
var created_at = null


func with_user_id(v) -> Gs2MatchmakingPlayer:
    user_id = v
    return self


func with_attributes(v) -> Gs2MatchmakingPlayer:
    attributes = v
    return self


func with_role_name(v) -> Gs2MatchmakingPlayer:
    role_name = v
    return self


func with_deny_user_ids(v) -> Gs2MatchmakingPlayer:
    deny_user_ids = v
    return self


func with_created_at(v) -> Gs2MatchmakingPlayer:
    created_at = v
    return self


static func from_dict(data) -> Gs2MatchmakingPlayer:
    if data == null:
        return null
    var ret = Gs2MatchmakingPlayer.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.attributes = null if data.get("attributes") == null else data.get("attributes").map(func(v): return Gs2MatchmakingAttribute.from_dict(v))
    ret.role_name = null if data.get("roleName") == null else str(data.get("roleName"))
    ret.deny_user_ids = null if data.get("denyUserIds") == null else data.get("denyUserIds").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["attributes"] = null if attributes == null else attributes.map(func(v): return null if v == null else v.to_dict())
    ret["roleName"] = role_name
    ret["denyUserIds"] = deny_user_ids
    ret["createdAt"] = created_at
    return ret