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
class_name Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var parameter_name = null
var property_id = null
var fixed_parameter_names = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    user_id = v
    return self


func with_parameter_name(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    parameter_name = v
    return self


func with_property_id(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    property_id = v
    return self


func with_fixed_parameter_names(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    fixed_parameter_names = v
    return self


func with_time_offset_token(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.fixed_parameter_names = null if data.get("fixedParameterNames") == null else data.get("fixedParameterNames").map(func(v): return str(v))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["parameterName"] = parameter_name
    ret["propertyId"] = property_id
    ret["fixedParameterNames"] = fixed_parameter_names
    ret["timeOffsetToken"] = time_offset_token
    return ret