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
class_name Gs2SkillTreeUpdateNodeModelMasterRequest
extends Gs2Request


var namespace_name = null
var node_model_name = null
var description = null
var metadata = null
var release_verify_actions = null
var release_consume_actions = null
var restrain_return_rate = null
var premise_node_names = null


func with_namespace_name(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    namespace_name = v
    return self


func with_node_model_name(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    node_model_name = v
    return self


func with_description(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    metadata = v
    return self


func with_release_verify_actions(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    release_verify_actions = v
    return self


func with_release_consume_actions(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    release_consume_actions = v
    return self


func with_restrain_return_rate(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    restrain_return_rate = v
    return self


func with_premise_node_names(v) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    premise_node_names = v
    return self


static func from_dict(data) -> Gs2SkillTreeUpdateNodeModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2SkillTreeUpdateNodeModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.node_model_name = null if data.get("nodeModelName") == null else str(data.get("nodeModelName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.release_verify_actions = null if data.get("releaseVerifyActions") == null else data.get("releaseVerifyActions").map(func(v): return Gs2VerifyAction.from_dict(v))
    ret.release_consume_actions = null if data.get("releaseConsumeActions") == null else data.get("releaseConsumeActions").map(func(v): return Gs2ConsumeAction.from_dict(v))
    ret.restrain_return_rate = null if data.get("restrainReturnRate") == null else float(data.get("restrainReturnRate"))
    ret.premise_node_names = null if data.get("premiseNodeNames") == null else data.get("premiseNodeNames").map(func(v): return str(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["nodeModelName"] = node_model_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["releaseVerifyActions"] = null if release_verify_actions == null else release_verify_actions.map(func(v): return null if v == null else v.to_dict())
    ret["releaseConsumeActions"] = null if release_consume_actions == null else release_consume_actions.map(func(v): return null if v == null else v.to_dict())
    ret["restrainReturnRate"] = restrain_return_rate
    ret["premiseNodeNames"] = premise_node_names
    return ret