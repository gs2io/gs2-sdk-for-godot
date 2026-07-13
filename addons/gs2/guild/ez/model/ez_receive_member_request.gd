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
class_name Gs2GuildEzReceiveMemberRequest
extends RefCounted


var user_id = null
var target_guild_name = null


func with_user_id(v) -> Gs2GuildEzReceiveMemberRequest:
    user_id = v
    return self


func with_target_guild_name(v) -> Gs2GuildEzReceiveMemberRequest:
    target_guild_name = v
    return self


func to_model() -> Gs2GuildReceiveMemberRequest:
    var ret = Gs2GuildReceiveMemberRequest.new()
    ret.user_id = user_id
    ret.target_guild_name = target_guild_name
    return ret


static func from_model(model) -> Gs2GuildEzReceiveMemberRequest:
    var ret = Gs2GuildEzReceiveMemberRequest.new()
    ret.user_id = model.user_id
    ret.target_guild_name = model.target_guild_name
    return ret