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
class_name Gs2EnchantUpdateRarityParameterModelMasterRequest
extends Gs2Request


var namespace_name = null
var parameter_name = null
var description = null
var metadata = null
var maximum_parameter_count = null
var parameter_counts = null
var parameters = null


func with_namespace_name(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    namespace_name = v
    return self


func with_parameter_name(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    parameter_name = v
    return self


func with_description(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    description = v
    return self


func with_metadata(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    metadata = v
    return self


func with_maximum_parameter_count(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    maximum_parameter_count = v
    return self


func with_parameter_counts(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    parameter_counts = v
    return self


func with_parameters(v) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    parameters = v
    return self


static func from_dict(data) -> Gs2EnchantUpdateRarityParameterModelMasterRequest:
    if data == null:
        return null
    var ret = Gs2EnchantUpdateRarityParameterModelMasterRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.description = null if data.get("description") == null else str(data.get("description"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    ret.maximum_parameter_count = null if data.get("maximumParameterCount") == null else int(data.get("maximumParameterCount"))
    ret.parameter_counts = null if data.get("parameterCounts") == null else data.get("parameterCounts").map(func(v): return Gs2EnchantRarityParameterCountModel.from_dict(v))
    ret.parameters = null if data.get("parameters") == null else data.get("parameters").map(func(v): return Gs2EnchantRarityParameterValueModel.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["parameterName"] = parameter_name
    ret["description"] = description
    ret["metadata"] = metadata
    ret["maximumParameterCount"] = maximum_parameter_count
    ret["parameterCounts"] = null if parameter_counts == null else parameter_counts.map(func(v): return null if v == null else v.to_dict())
    ret["parameters"] = null if parameters == null else parameters.map(func(v): return null if v == null else v.to_dict())
    return ret