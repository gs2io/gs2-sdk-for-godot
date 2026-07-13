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
class_name Gs2EnchantVerifyRarityParameterStatusRequest
extends Gs2Request


var namespace_name = null
var parameter_name = null
var access_token = null
var property_id = null
var verify_type = null
var parameter_value_name = null
var parameter_count = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    namespace_name = v
    return self


func with_parameter_name(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    parameter_name = v
    return self


func with_access_token(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    access_token = v
    return self


func with_property_id(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    property_id = v
    return self


func with_verify_type(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    verify_type = v
    return self


func with_parameter_value_name(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    parameter_value_name = v
    return self


func with_parameter_count(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    parameter_count = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnchantVerifyRarityParameterStatusRequest:
    if data == null:
        return null
    var ret = Gs2EnchantVerifyRarityParameterStatusRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.parameter_value_name = null if data.get("parameterValueName") == null else str(data.get("parameterValueName"))
    ret.parameter_count = null if data.get("parameterCount") == null else int(data.get("parameterCount"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["parameterName"] = parameter_name
    ret["accessToken"] = access_token
    ret["propertyId"] = property_id
    ret["verifyType"] = verify_type
    ret["parameterValueName"] = parameter_value_name
    ret["parameterCount"] = parameter_count
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret