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
class_name Gs2ScriptDebugInvokeRequest
extends Gs2Request


var script_ = null
var args = null
var user_id = null
var random_status = null
var disable_string_number_to_number = null
var time_offset_token = null
var duplication_avoider = null


func with_script(v) -> Gs2ScriptDebugInvokeRequest:
    script_ = v
    return self


func with_args(v) -> Gs2ScriptDebugInvokeRequest:
    args = v
    return self


func with_user_id(v) -> Gs2ScriptDebugInvokeRequest:
    user_id = v
    return self


func with_random_status(v) -> Gs2ScriptDebugInvokeRequest:
    random_status = v
    return self


func with_disable_string_number_to_number(v) -> Gs2ScriptDebugInvokeRequest:
    disable_string_number_to_number = v
    return self


func with_time_offset_token(v) -> Gs2ScriptDebugInvokeRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ScriptDebugInvokeRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ScriptDebugInvokeRequest:
    if data == null:
        return null
    var ret = Gs2ScriptDebugInvokeRequest.new()
    ret.script_ = null if data.get("script") == null else str(data.get("script"))
    ret.args = null if data.get("args") == null else str(data.get("args"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.random_status = null if data.get("randomStatus") == null else Gs2ScriptRandomStatus.from_dict(data.get("randomStatus"))
    ret.disable_string_number_to_number = null if data.get("disableStringNumberToNumber") == null else bool(data.get("disableStringNumberToNumber"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["script"] = script_
    ret["args"] = args
    ret["userId"] = user_id
    ret["randomStatus"] = null if random_status == null else random_status.to_dict()
    ret["disableStringNumberToNumber"] = disable_string_number_to_number
    ret["timeOffsetToken"] = time_offset_token
    return ret