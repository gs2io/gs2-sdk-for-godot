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
class_name Gs2StaminaUpdateStaminaByUserIdRequest
extends Gs2Request


var namespace_name = null
var stamina_name = null
var user_id = null
var value = null
var max_value = null
var recover_interval_minutes = null
var recover_value = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    namespace_name = v
    return self


func with_stamina_name(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    stamina_name = v
    return self


func with_user_id(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    user_id = v
    return self


func with_value(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    value = v
    return self


func with_max_value(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    max_value = v
    return self


func with_recover_interval_minutes(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    recover_interval_minutes = v
    return self


func with_recover_value(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    recover_value = v
    return self


func with_time_offset_token(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2StaminaUpdateStaminaByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2StaminaUpdateStaminaByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.stamina_name = null if data.get("staminaName") == null else str(data.get("staminaName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.max_value = null if data.get("maxValue") == null else int(data.get("maxValue"))
    ret.recover_interval_minutes = null if data.get("recoverIntervalMinutes") == null else int(data.get("recoverIntervalMinutes"))
    ret.recover_value = null if data.get("recoverValue") == null else int(data.get("recoverValue"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["staminaName"] = stamina_name
    ret["userId"] = user_id
    ret["value"] = value
    ret["maxValue"] = max_value
    ret["recoverIntervalMinutes"] = recover_interval_minutes
    ret["recoverValue"] = recover_value
    ret["timeOffsetToken"] = time_offset_token
    return ret