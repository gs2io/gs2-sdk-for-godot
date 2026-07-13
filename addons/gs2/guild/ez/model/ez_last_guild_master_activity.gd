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
class_name Gs2GuildEzLastGuildMasterActivity
extends RefCounted


var user_id = null
var updated_at = 0


func with_user_id(v) -> Gs2GuildEzLastGuildMasterActivity:
    user_id = v
    return self


func with_updated_at(v) -> Gs2GuildEzLastGuildMasterActivity:
    updated_at = v
    return self


func to_model() -> Gs2GuildLastGuildMasterActivity:
    var ret = Gs2GuildLastGuildMasterActivity.new()
    ret.user_id = user_id
    ret.updated_at = updated_at
    return ret


static func from_model(model) -> Gs2GuildEzLastGuildMasterActivity:
    var ret = Gs2GuildEzLastGuildMasterActivity.new()
    ret.user_id = model.user_id
    ret.updated_at = 0 if model.updated_at == null else model.updated_at
    return ret