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
class_name Gs2GuildEzRoleModel
extends RefCounted


var name = null
var metadata = null
var policy_document = null


func with_name(v) -> Gs2GuildEzRoleModel:
    name = v
    return self


func with_metadata(v) -> Gs2GuildEzRoleModel:
    metadata = v
    return self


func with_policy_document(v) -> Gs2GuildEzRoleModel:
    policy_document = v
    return self


func to_model() -> Gs2GuildRoleModel:
    var ret = Gs2GuildRoleModel.new()
    ret.name = name
    ret.metadata = metadata
    ret.policy_document = policy_document
    return ret


static func from_model(model) -> Gs2GuildEzRoleModel:
    var ret = Gs2GuildEzRoleModel.new()
    ret.name = model.name
    ret.metadata = model.metadata
    ret.policy_document = model.policy_document
    return ret