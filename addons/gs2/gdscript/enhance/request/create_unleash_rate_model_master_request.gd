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
class_name Gs2EnhanceCreateUnleashRateModelMasterRequest
extends Gs2Request


var namespace_name = null
var name = null
var description = null
var metadata = null
var target_inventory_model_id = null
var grade_model_id = null
var group_key_hierarchy = null
var grade_entries = null


func with_namespace_name(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    namespace_name = v
    return self


func with_name(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    name = v
    return self


func with_description(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    metadata = v
    return self


func with_target_inventory_model_id(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    target_inventory_model_id = v
    return self


func with_grade_model_id(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    grade_model_id = v
    return self


func with_group_key_hierarchy(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    group_key_hierarchy = v
    return self


func with_grade_entries(v) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    grade_entries = v
    return self


static func from_dict(data) -> Gs2EnhanceCreateUnleashRateModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2EnhanceCreateUnleashRateModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.target_inventory_model_id = null if data.get("targetInventoryModelId") == null else str(data.get("targetInventoryModelId"))
    ret.grade_model_id = null if data.get("gradeModelId") == null else str(data.get("gradeModelId"))
    ret.group_key_hierarchy = null if data.get("groupKeyHierarchy") == null else data.get("groupKeyHierarchy").map(func(v): return str(v))
    ret.grade_entries = null if data.get("gradeEntries") == null else data.get("gradeEntries").map(func(v): return Gs2EnhanceUnleashRateEntryModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["targetInventoryModelId"] = target_inventory_model_id
    ret["gradeModelId"] = grade_model_id
    ret["groupKeyHierarchy"] = group_key_hierarchy
    ret["gradeEntries"] = null if grade_entries == null else grade_entries.map(func(v): return null if v == null else v.to_dict())
    return ret