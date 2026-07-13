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
class_name Gs2StaminaUpdateStaminaModelMasterRequest
extends Gs2Request


var namespace_name = null
var stamina_name = null
var description = null
var metadata = null
var recover_interval_minutes = null
var recover_value = null
var initial_capacity = null
var is_overflow = null
var max_capacity = null
var max_stamina_table_name = null
var recover_interval_table_name = null
var recover_value_table_name = null


func with_namespace_name(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    namespace_name = v
    return self


func with_stamina_name(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    stamina_name = v
    return self


func with_description(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    metadata = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    recover_value = v
    return self


func with_initial_capacity(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    initial_capacity = v
    return self


func with_is_overflow(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    is_overflow = v
    return self


func with_max_capacity(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    max_capacity = v
    return self


func with_max_stamina_table_name(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    max_stamina_table_name = v
    return self


func with_recover_interval_table_name(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    recover_interval_table_name = v
    return self


func with_recover_value_table_name(v) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    recover_value_table_name = v
    return self


static func from_dict(data) -> Gs2StaminaUpdateStaminaModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2StaminaUpdateStaminaModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.stamina_name = null if data.get("staminaName") == null else str(data.get("staminaName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.recover_interval_minutes = null if data.get("recoverIntervalMinutes") == null else int(data.get("recoverIntervalMinutes"))
    ret.recover_value = null if data.get("recoverValue") == null else int(data.get("recoverValue"))
    ret.initial_capacity = null if data.get("initialCapacity") == null else int(data.get("initialCapacity"))
    ret.is_overflow = null if data.get("isOverflow") == null else bool(data.get("isOverflow"))
    ret.max_capacity = null if data.get("maxCapacity") == null else int(data.get("maxCapacity"))
    ret.max_stamina_table_name = null if data.get("maxStaminaTableName") == null else str(data.get("maxStaminaTableName"))
    ret.recover_interval_table_name = null if data.get("recoverIntervalTableName") == null else str(data.get("recoverIntervalTableName"))
    ret.recover_value_table_name = null if data.get("recoverValueTableName") == null else str(data.get("recoverValueTableName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["staminaName"] = stamina_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["recoverIntervalMinutes"] = recover_interval_minutes
    ret["recoverValue"] = recover_value
    ret["initialCapacity"] = initial_capacity
    ret["isOverflow"] = is_overflow
    ret["maxCapacity"] = max_capacity
    ret["maxStaminaTableName"] = max_stamina_table_name
    ret["recoverIntervalTableName"] = recover_interval_table_name
    ret["recoverValueTableName"] = recover_value_table_name
    return ret