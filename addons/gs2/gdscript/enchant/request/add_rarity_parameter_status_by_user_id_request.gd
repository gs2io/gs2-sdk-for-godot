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
class_name Gs2EnchantAddRarityParameterStatusByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var parameter_name = null
var property_id = null
var count = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    user_id = v
    return self


func with_parameter_name(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    parameter_name = v
    return self


func with_property_id(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    property_id = v
    return self


func with_count(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    count = v
    return self


func with_time_offset_token(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2EnchantAddRarityParameterStatusByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2EnchantAddRarityParameterStatusByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.parameter_name = null if data.get("parameterName") == null else str(data.get("parameterName"))
    ret.property_id = null if data.get("propertyId") == null else str(data.get("propertyId"))
    ret.count = null if data.get("count") == null else int(data.get("count"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["parameterName"] = parameter_name
    ret["propertyId"] = property_id
    ret["count"] = count
    ret["timeOffsetToken"] = time_offset_token
    return ret