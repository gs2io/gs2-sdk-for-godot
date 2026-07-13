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
class_name Gs2MissionDecreaseCounterByUserIdRequest
extends Gs2Request


var namespace_name = null
var counter_name = null
var user_id = null
var value = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2MissionDecreaseCounterByUserIdRequest:
    namespace_name = v
    return self


func with_counter_name(v) -> Gs2MissionDecreaseCounterByUserIdRequest:
    counter_name = v
    return self


func with_user_id(v) -> Gs2MissionDecreaseCounterByUserIdRequest:
    user_id = v
    return self


func with_value(v) -> Gs2MissionDecreaseCounterByUserIdRequest:
    value = v
    return self


func with_time_offset_token(v) -> Gs2MissionDecreaseCounterByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2MissionDecreaseCounterByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2MissionDecreaseCounterByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2MissionDecreaseCounterByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.counter_name = null if data.get("counterName") == null else str(data.get("counterName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.value = null if data.get("value") == null else int(data.get("value"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["counterName"] = counter_name
    ret["userId"] = user_id
    ret["value"] = value
    ret["timeOffsetToken"] = time_offset_token
    return ret