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
class_name Gs2FormationCreateMoldModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var form_model_name = null
var initial_max_capacity = null
var max_capacity = null


func with_namespace_name(v) -> Gs2FormationCreateMoldModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2FormationCreateMoldModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2FormationCreateMoldModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2FormationCreateMoldModelMasterRequest:
    metadata = v
    return self


func with_form_model_name(v) -> Gs2FormationCreateMoldModelMasterRequest:
    form_model_name = v
    return self


func with_initial_max_capacity(v) -> Gs2FormationCreateMoldModelMasterRequest:
    initial_max_capacity = v
    return self


func with_max_capacity(v) -> Gs2FormationCreateMoldModelMasterRequest:
    max_capacity = v
    return self


static func from_dict(data) -> Gs2FormationCreateMoldModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2FormationCreateMoldModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.form_model_name = null if data.get("formModelName") == null else str(data.get("formModelName"))
    ret.initial_max_capacity = null if data.get("initialMaxCapacity") == null else int(data.get("initialMaxCapacity"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["formModelName"] = form_model_name
    ret["initialMaxCapacity"] = initial_max_capacity
    ret["maxCapacity"] = max_capacity
    return ret