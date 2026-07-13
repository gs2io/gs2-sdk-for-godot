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
class_name Gs2SkillTreeNodeModelMaster
extends RefCounted


var node_model_id = null
var name = null
var description = null
var metadata = null
var release_verify_actions = null
var release_consume_actions = null
var restrain_return_rate = null
var premise_node_names = null
var created_at = null
var updated_at = null
var revision = null


func with_node_model_id(v) -> Gs2SkillTreeNodeModelMaster:
    node_model_id = v
    return self


func with_name(v) -> Gs2SkillTreeNodeModelMaster:
    name = v
    return self


func with_description(v) -> Gs2SkillTreeNodeModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2SkillTreeNodeModelMaster:
    metadata = v
    return self


func with_release_verify_actions(v) -> Gs2SkillTreeNodeModelMaster:
    release_verify_actions = v
    return self


func with_release_consume_actions(v) -> Gs2SkillTreeNodeModelMaster:
    release_consume_actions = v
    return self


func with_restrain_return_rate(v) -> Gs2SkillTreeNodeModelMaster:
    restrain_return_rate = v
    return self


func with_premise_node_names(v) -> Gs2SkillTreeNodeModelMaster:
    premise_node_names = v
    return self


func with_created_at(v) -> Gs2SkillTreeNodeModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2SkillTreeNodeModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2SkillTreeNodeModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):model:(?<nodeModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):model:(?<nodeModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):model:(?<nodeModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_node_model_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):skillTree:(?<namespaceName>.+):model:(?<nodeModelName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("nodeModelName")


static func from_dict(data) -> Gs2SkillTreeNodeModelMaster:
    if data == null:
        return null
    var ret = Gs2SkillTreeNodeModelMaster.new()
    ret.node_model_id = null if data.get("nodeModelId") == null else str(data.get("nodeModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.release_verify_actions = null if data.get("releaseVerifyActions") == null else data.get("releaseVerifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.release_consume_actions = null if data.get("releaseConsumeActions") == null else data.get("releaseConsumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.restrain_return_rate = null if data.get("restrainReturnRate") == null else float(data.get("restrainReturnRate"))
    ret.premise_node_names = null if data.get("premiseNodeNames") == null else data.get("premiseNodeNames").map(func(v): return str(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["nodeModelId"] = node_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["releaseVerifyActions"] = null if release_verify_actions == null else release_verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["releaseConsumeActions"] = null if release_consume_actions == null else release_consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["restrainReturnRate"] = restrain_return_rate
    ret["premiseNodeNames"] = premise_node_names
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret