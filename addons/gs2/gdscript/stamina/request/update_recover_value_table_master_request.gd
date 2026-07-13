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
class_name Gs2StaminaUpdateRecoverValueTableMasterRequest
extends Gs2Request


var namespace_name = null
var recover_value_table_name = null
var description = null
var metadata = null
var experience_model_id = null
var values = null


func with_namespace_name(v) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    namespace_name = v
    return self


func with_recover_value_table_name(v) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    recover_value_table_name = v
    return self


func with_description(v) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    metadata = v
    return self


func with_experience_model_id(v) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    experience_model_id = v
    return self


func with_values(v) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    values = v
    return self


static func from_dict(data) -> Gs2StaminaUpdateRecoverValueTableMasterRequest:
    if data == null:
        return null
    var ret = Gs2StaminaUpdateRecoverValueTableMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.recover_value_table_name = null if data.get("recoverValueTableName") == null else str(data.get("recoverValueTableName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.experience_model_id = null if data.get("experienceModelId") == null else str(data.get("experienceModelId"))
    ret.values = null if data.get("values") == null else data.get("values").map(func(v): return int(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["recoverValueTableName"] = recover_value_table_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["experienceModelId"] = experience_model_id
    ret["values"] = values
    return ret