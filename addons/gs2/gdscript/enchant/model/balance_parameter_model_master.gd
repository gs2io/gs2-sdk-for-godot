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
class_name Gs2EnchantBalanceParameterModelMaster
extends RefCounted


var balance_parameter_model_id = null
var name = null
var description = null
var metadata = null
var total_value = null
var initial_value_strategy = null
var parameters = null
var created_at = null
var updated_at = null
var revision = null


func with_balance_parameter_model_id(v) -> Gs2EnchantBalanceParameterModelMaster:
    balance_parameter_model_id = v
    return self


func with_name(v) -> Gs2EnchantBalanceParameterModelMaster:
    name = v
    return self


func with_description(v) -> Gs2EnchantBalanceParameterModelMaster:
    description = v
    return self


func with_metadata(v) -> Gs2EnchantBalanceParameterModelMaster:
    metadata = v
    return self


func with_total_value(v) -> Gs2EnchantBalanceParameterModelMaster:
    total_value = v
    return self


func with_initial_value_strategy(v) -> Gs2EnchantBalanceParameterModelMaster:
    initial_value_strategy = v
    return self


func with_parameters(v) -> Gs2EnchantBalanceParameterModelMaster:
    parameters = v
    return self


func with_created_at(v) -> Gs2EnchantBalanceParameterModelMaster:
    created_at = v
    return self


func with_updated_at(v) -> Gs2EnchantBalanceParameterModelMaster:
    updated_at = v
    return self


func with_revision(v) -> Gs2EnchantBalanceParameterModelMaster:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:balance:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:balance:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:balance:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_parameter_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):enchant:(?<namespaceName>.+):model:balance:(?<parameterName>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("parameterName")


static func from_dict(data) -> Gs2EnchantBalanceParameterModelMaster:
    if data == null:
        return null
    var ret = Gs2EnchantBalanceParameterModelMaster.new()
    ret.balance_parameter_model_id = null if data.get("balanceParameterModelId") == null else str(data.get("balanceParameterModelId"))
    ret.name = null if data.get("name") == null else str(data.get("name"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.total_value = null if data.get("totalValue") == null else int(data.get("totalValue"))
    ret.initial_value_strategy = null if data.get("initialValueStrategy") == null else str(data.get("initialValueStrategy"))
    ret.parameters = null if data.get("parameters") == null else data.get("parameters").map(func(v): return Gs2EnchantBalanceParameterValueModel.from_dict(v))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["balanceParameterModelId"] = balance_parameter_model_id
    ret["name"] = name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["totalValue"] = total_value
    ret["initialValueStrategy"] = initial_value_strategy
    ret["parameters"] = null if parameters == null else parameters.map(func(v): return null if v == null else v.to_dict())
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret