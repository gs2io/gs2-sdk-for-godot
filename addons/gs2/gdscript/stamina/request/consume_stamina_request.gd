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
class_name Gs2StaminaConsumeStaminaRequest
extends Gs2Request


var namespace_name = null
var stamina_name = null
var access_token = null
var consume_value = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2StaminaConsumeStaminaRequest:
    namespace_name = v
    return self


func with_stamina_name(v) -> Gs2StaminaConsumeStaminaRequest:
    stamina_name = v
    return self


func with_access_token(v) -> Gs2StaminaConsumeStaminaRequest:
    access_token = v
    return self


func with_consume_value(v) -> Gs2StaminaConsumeStaminaRequest:
    consume_value = v
    return self


func with_duplication_avoider(v) -> Gs2StaminaConsumeStaminaRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2StaminaConsumeStaminaRequest:
    if data == null:
        return null
    var ret = Gs2StaminaConsumeStaminaRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.stamina_name = null if data.get("staminaName") == null else str(data.get("staminaName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.consume_value = null if data.get("consumeValue") == null else int(data.get("consumeValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["staminaName"] = stamina_name
    ret["accessToken"] = access_token
    ret["consumeValue"] = consume_value
    return ret