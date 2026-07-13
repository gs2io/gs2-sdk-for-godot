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
class_name Gs2StaminaVerifyStaminaValueRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var stamina_name = null
var verify_type = null
var value = null
var multiply_value_specifying_quantity = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2StaminaVerifyStaminaValueRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2StaminaVerifyStaminaValueRequest:
    access_token = v
    return self


func with_stamina_name(v) -> Gs2StaminaVerifyStaminaValueRequest:
    stamina_name = v
    return self


func with_verify_type(v) -> Gs2StaminaVerifyStaminaValueRequest:
    verify_type = v
    return self


func with_value(v) -> Gs2StaminaVerifyStaminaValueRequest:
    value = v
    return self


func with_multiply_value_specifying_quantity(v) -> Gs2StaminaVerifyStaminaValueRequest:
    multiply_value_specifying_quantity = v
    return self


func with_duplication_avoider(v) -> Gs2StaminaVerifyStaminaValueRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2StaminaVerifyStaminaValueRequest:
    if data == null:
        return null
    var ret = Gs2StaminaVerifyStaminaValueRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.stamina_name = null if data.get("staminaName") == null else str(data.get("staminaName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.multiply_value_specifying_quantity = null if data.get("multiplyValueSpecifyingQuantity") == null else bool(data.get("multiplyValueSpecifyingQuantity"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["staminaName"] = stamina_name
    ret["verifyType"] = verify_type
    ret["value"] = value
    ret["multiplyValueSpecifyingQuantity"] = multiply_value_specifying_quantity
    return ret