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
class_name Gs2MissionVerifyCounterValueByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var counter_name = null
var verify_type = null
var scope_type = null
var reset_type = null
var condition_name = null
var value = null
var multiply_value_specifying_quantity = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    user_id = v
    return self


func with_counter_name(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    counter_name = v
    return self


func with_verify_type(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    verify_type = v
    return self


func with_scope_type(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    scope_type = v
    return self


func with_reset_type(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    reset_type = v
    return self


func with_condition_name(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    condition_name = v
    return self


func with_value(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    value = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    multiply_value_specifying_quantity = v
    return self


func with_time_offset_token(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MissionVerifyCounterValueByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MissionVerifyCounterValueByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.counter_name = null if data.get("counterName") == null else str(data.get("counterName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.scope_type = null if data.get("scopeType") == null else str(data.get("scopeType"))
    ret.reset_type = null if data.get("resetType") == null else str(data.get("resetType"))
    ret.condition_name = null if data.get("conditionName") == null else str(data.get("conditionName"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["counterName"] = counter_name
    ret["verifyType"] = verify_type
    ret["scopeType"] = scope_type
    ret["resetType"] = reset_type
    ret["conditionName"] = condition_name
    ret["value"] = value
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    ret["timeOffsetToken"] = time_offset_token
    return ret