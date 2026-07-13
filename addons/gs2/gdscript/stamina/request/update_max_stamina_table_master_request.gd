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
class_name Gs2StaminaUpdateMaxStaminaTableMasterRequest
extends Gs2Request


var namespace_name = null
var max_stamina_table_name = null
var description = null
var metadata = null
var experience_model_id = null
var values = null


func with_namespace_name(v) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    namespace_name = v
    return self


func with_max_stamina_table_name(v) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    max_stamina_table_name = v
    return self


func with_description(v) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    metadata = v
    return self


func with_experience_model_id(v) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    experience_model_id = v
    return self


func with_values(v) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    values = v
    return self


static func from_dict(data) -> Gs2StaminaUpdateMaxStaminaTableMasterRequest:
    if data == null:
        return null
    var ret = Gs2StaminaUpdateMaxStaminaTableMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.max_stamina_table_name = null if data.get("maxStaminaTableName") == null else str(data.get("maxStaminaTableName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return int(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["maxStaminaTableName"] = max_stamina_table_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["experienceModelId"] = experience_model_id
    ret["values"] = values
    return ret