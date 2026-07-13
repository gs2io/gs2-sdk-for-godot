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
class_name Gs2EnchantUpdateBalanceParameterModelMasterRequest
extends Gs2Request


var namespace_name = null
var parameter_name = null
var description = null
var metadata = null
var total_value = null
var initial_value_strategy = null
var parameters = null


func with_namespace_name(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    namespace_name = v
    return self


func with_parameter_name(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    parameter_name = v
    return self


func with_description(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    metadata = v
    return self


func with_total_value(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    total_value = v
    return self


func with_initial_value_strategy(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    initial_value_strategy = v
    return self


func with_parameters(v) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    parameters = v
    return self


static func from_dict(data) -> Gs2EnchantUpdateBalanceParameterModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2EnchantUpdateBalanceParameterModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.total_value = null if data.get("totalValue") == null else int(data.get("totalValue"))
    ret.initial_value_strategy = null if data.get("initialValueStrategy") == null else str(data.get("initialValueStrategy"))
    ret.parameters = null if data.get("parameters") == null else data.get("parameters").map(func(v): return Gs2EnchantBalanceParameterValueModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["parameterName"] = parameter_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["totalValue"] = total_value
    ret["initialValueStrategy"] = initial_value_strategy
    ret["parameters"] = null if parameters == null else parameters.map(func(v): return null if v == null else v.to_dict())
    return ret