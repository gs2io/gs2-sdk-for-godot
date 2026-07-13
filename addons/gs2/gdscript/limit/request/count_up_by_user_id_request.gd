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
class_name Gs2LimitCountUpByUserIdRequest
extends Gs2Request


var namespace_name = null
var limit_name = null
var counter_name = null
var user_id = null
var count_up_value = null
var max_value = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LimitCountUpByUserIdRequest:
    namespace_name = v
    return self


func with_limit_name(v) -> Gs2LimitCountUpByUserIdRequest:
    limit_name = v
    return self


func with_counter_name(v) -> Gs2LimitCountUpByUserIdRequest:
    counter_name = v
    return self


func with_user_id(v) -> Gs2LimitCountUpByUserIdRequest:
    user_id = v
    return self


func with_count_up_value(v) -> Gs2LimitCountUpByUserIdRequest:
    count_up_value = v
    return self


func with_max_value(v) -> Gs2LimitCountUpByUserIdRequest:
    max_value = v
    return self


func with_time_offset_token(v) -> Gs2LimitCountUpByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2LimitCountUpByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LimitCountUpByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2LimitCountUpByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.limit_name = null if data.get("limitName") == null else str(data.get("limitName"))
    ret.counter_name = null if data.get("counterName") == null else str(data.get("counterName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.count_up_value = null if data.get("countUpValue") == null else int(data.get("countUpValue"))
    ret.max_value = null if data.get("maxValue") == null else int(data.get("maxValue"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["limitName"] = limit_name
    ret["counterName"] = counter_name
    ret["userId"] = user_id
    ret["countUpValue"] = count_up_value
    ret["maxValue"] = max_value
    ret["timeOffsetToken"] = time_offset_token
    return ret