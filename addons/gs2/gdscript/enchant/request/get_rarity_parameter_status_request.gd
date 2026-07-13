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
class_name Gs2EnchantGetRarityParameterStatusRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var parameter_name = null
var property_id = null


func with_namespace_name(v) -> Gs2EnchantGetRarityParameterStatusRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2EnchantGetRarityParameterStatusRequest:
    access_token = v
    return self


func with_parameter_name(v) -> Gs2EnchantGetRarityParameterStatusRequest:
    parameter_name = v
    return self


func with_property_id(v) -> Gs2EnchantGetRarityParameterStatusRequest:
    property_id = v
    return self


static func from_dict(data) -> Gs2EnchantGetRarityParameterStatusRequest:
    if data == null:
        return null
    var ret = Gs2EnchantGetRarityParameterStatusRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["parameterName"] = parameter_name
    ret["propertyId"] = property_id
    return ret