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
class_name Gs2GuildRoleModel
extends RefCounted


var name = null
var metadata = null
var policy_document = null


func with_name(v) -> Gs2GuildRoleModel:
    name = v
    return self


func with_metadata(v) -> Gs2GuildRoleModel:
    metadata = v
    return self


func with_policy_document(v) -> Gs2GuildRoleModel:
    policy_document = v
    return self


static func from_dict(data) -> Gs2GuildRoleModel:
    if data == null:
        return null
    var ret = Gs2GuildRoleModel.new()
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.policy_document = null if data.get("policyDocument") == null else str(data.get("policyDocument"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["name"] = name
    ret["metadata"] = metadata
    ret["policyDocument"] = policy_document
    return ret