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
class_name Gs2LimitCountUpRequest
extends Gs2Request


var namespace_name = null
var limit_name = null
var counter_name = null
var access_token = null
var count_up_value = null
var max_value = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LimitCountUpRequest:
    namespace_name = v
    return self


func with_limit_name(v) -> Gs2LimitCountUpRequest:
    limit_name = v
    return self


func with_counter_name(v) -> Gs2LimitCountUpRequest:
    counter_name = v
    return self


func with_access_token(v) -> Gs2LimitCountUpRequest:
    access_token = v
    return self


func with_count_up_value(v) -> Gs2LimitCountUpRequest:
    count_up_value = v
    return self


func with_max_value(v) -> Gs2LimitCountUpRequest:
    max_value = v
    return self


func with_duplication_avoider(v) -> Gs2LimitCountUpRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LimitCountUpRequest:
    if data == null:
        return null
    var ret = Gs2LimitCountUpRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.limit_name = null if data.get("limitName") == null else str(data.get("limitName"))
    ret.counter_name = null if data.get("counterName") == null else str(data.get("counterName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.count_up_value = null if data.get("countUpValue") == null else int(data.get("countUpValue"))
    ret.max_value = null if data.get("maxValue") == null else int(data.get("maxValue"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["limitName"] = limit_name
    ret["counterName"] = counter_name
    ret["accessToken"] = access_token
    ret["countUpValue"] = count_up_value
    ret["maxValue"] = max_value
    return ret