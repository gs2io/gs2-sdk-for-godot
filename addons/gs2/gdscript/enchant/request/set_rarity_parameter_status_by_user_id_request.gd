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
class_name Gs2EnchantSetRarityParameterStatusByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var parameter_name = null
var property_id = null
var parameter_values = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    user_id = v
    return self


func with_parameter_name(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    parameter_name = v
    return self


func with_property_id(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    property_id = v
    return self


func with_parameter_values(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    parameter_values = v
    return self


func with_time_offset_token(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnchantSetRarityParameterStatusByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2EnchantSetRarityParameterStatusByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.parameter_values = null if data.get("parameterValues") == null else data.get("parameterValues").map(func(v): return Gs2EnchantRarityParameterValue.from_dict(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["parameterName"] = parameter_name
    ret["propertyId"] = property_id
    ret["parameterValues"] = null if parameter_values == null else parameter_values.map(func(v): return null if v == null else v.to_dict())
    ret["timeOffsetToken"] = time_offset_token
    return ret