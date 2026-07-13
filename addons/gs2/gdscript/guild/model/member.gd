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
class_name Gs2GuildMember
extends RefCounted


var user_id = null
var role_name = null
var metadata = null
var joined_at = null


func with_user_id(v) -> Gs2GuildMember:
    user_id = v
    return self


func with_role_name(v) -> Gs2GuildMember:
    role_name = v
    return self


func with_metadata(v) -> Gs2GuildMember:
    metadata = v
    return self


func with_joined_at(v) -> Gs2GuildMember:
    joined_at = v
    return self


static func from_dict(data) -> Gs2GuildMember:
    if data == null:
        return null
    var ret = Gs2GuildMember.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.role_name = null if data.get("roleName") == null else str(data.get("roleName"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.joined_at = null if data.get("joinedAt") == null else int(data.get("joinedAt"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["roleName"] = role_name
    ret["metadata"] = metadata
    ret["joinedAt"] = joined_at
    return ret