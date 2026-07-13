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
class_name Gs2LogExecuteStampTaskLog
extends RefCounted


var timestamp = null
var task_id = null
var service = null
var method = null
var user_id = null
var action = null
var args = null


func with_timestamp(v) -> Gs2LogExecuteStampTaskLog:
    timestamp = v
    return self


func with_task_id(v) -> Gs2LogExecuteStampTaskLog:
    task_id = v
    return self


func with_service(v) -> Gs2LogExecuteStampTaskLog:
    service = v
    return self


func with_method(v) -> Gs2LogExecuteStampTaskLog:
    method = v
    return self


func with_user_id(v) -> Gs2LogExecuteStampTaskLog:
    user_id = v
    return self


func with_action(v) -> Gs2LogExecuteStampTaskLog:
    action = v
    return self


func with_args(v) -> Gs2LogExecuteStampTaskLog:
    args = v
    return self


static func from_dict(data) -> Gs2LogExecuteStampTaskLog:
    if data == null:
        return null
    var ret = Gs2LogExecuteStampTaskLog.new()
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    ret.task_id = null if data.get("taskId") == null else str(data.get("taskId"))
    ret.service = null if data.get("service") == null else str(data.get("service"))
    ret.method = null if data.get("method") == null else str(data.get("method"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.action = null if data.get("action") == null else str(data.get("action"))
    ret.args = null if data.get("args") == null else str(data.get("args"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["timestamp"] = timestamp
    ret["taskId"] = task_id
    ret["service"] = service
    ret["method"] = method
    ret["userId"] = user_id
    ret["action"] = action
    ret["args"] = args
    return ret