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
class_name Gs2GuildEzMember
extends RefCounted


var user_id = null
var role_name = null
var metadata = null
var joined_at = 0


func with_user_id(v) -> Gs2GuildEzMember:
    user_id = v
    return self


func with_role_name(v) -> Gs2GuildEzMember:
    role_name = v
    return self


func with_metadata(v) -> Gs2GuildEzMember:
    metadata = v
    return self


func with_joined_at(v) -> Gs2GuildEzMember:
    joined_at = v
    return self


func to_model() -> Gs2GuildMember:
    var ret = Gs2GuildMember.new()
    ret.user_id = user_id
    ret.role_name = role_name
    ret.metadata = metadata
    ret.joined_at = joined_at
    return ret


static func from_model(model) -> Gs2GuildEzMember:
    var ret = Gs2GuildEzMember.new()
    ret.user_id = model.user_id
    ret.role_name = model.role_name
    ret.metadata = model.metadata
    ret.joined_at = 0 if model.joined_at == null else model.joined_at
    return ret