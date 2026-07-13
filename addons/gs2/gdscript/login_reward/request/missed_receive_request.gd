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
class_name Gs2LoginRewardMissedReceiveRequest
extends Gs2Request


var namespace_name = null
var bonus_model_name = null
var access_token = null
var step_number = null
var config = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LoginRewardMissedReceiveRequest:
    namespace_name = v
    return self


func with_bonus_model_name(v) -> Gs2LoginRewardMissedReceiveRequest:
    bonus_model_name = v
    return self


func with_access_token(v) -> Gs2LoginRewardMissedReceiveRequest:
    access_token = v
    return self


func with_step_number(v) -> Gs2LoginRewardMissedReceiveRequest:
    step_number = v
    return self


func with_config(v) -> Gs2LoginRewardMissedReceiveRequest:
    config = v
    return self


func with_duplication_avoider(v) -> Gs2LoginRewardMissedReceiveRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LoginRewardMissedReceiveRequest:
    if data == null:
        return null
    var ret = Gs2LoginRewardMissedReceiveRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.bonus_model_name = null if data.get("bonusModelName") == null else str(data.get("bonusModelName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.step_number = null if data.get("stepNumber") == null else int(data.get("stepNumber"))
    ret.config = null if data.get("config") == null else data.get("config").map(func(v): return Gs2LoginRewardConfig.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["bonusModelName"] = bonus_model_name
    ret["accessToken"] = access_token
    ret["stepNumber"] = step_number
    ret["config"] = null if config == null else config.map(func(v): return null if v == null else v.to_dict())
    return ret