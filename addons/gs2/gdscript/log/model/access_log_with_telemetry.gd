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
class_name Gs2LogAccessLogWithTelemetry
extends RefCounted


var timestamp = null
var source_request_id = null
var request_id = null
var duration = null
var service = null
var method = null
var user_id = null
var request = null
var result = null
var status = null


func with_timestamp(v) -> Gs2LogAccessLogWithTelemetry:
    timestamp = v
    return self


func with_source_request_id(v) -> Gs2LogAccessLogWithTelemetry:
    source_request_id = v
    return self


func with_request_id(v) -> Gs2LogAccessLogWithTelemetry:
    request_id = v
    return self


func with_duration(v) -> Gs2LogAccessLogWithTelemetry:
    duration = v
    return self


func with_service(v) -> Gs2LogAccessLogWithTelemetry:
    service = v
    return self


func with_method(v) -> Gs2LogAccessLogWithTelemetry:
    method = v
    return self


func with_user_id(v) -> Gs2LogAccessLogWithTelemetry:
    user_id = v
    return self


func with_request(v) -> Gs2LogAccessLogWithTelemetry:
    request = v
    return self


func with_result(v) -> Gs2LogAccessLogWithTelemetry:
    result = v
    return self


func with_status(v) -> Gs2LogAccessLogWithTelemetry:
    status = v
    return self


static func from_dict(data) -> Gs2LogAccessLogWithTelemetry:
    if data == null:
        return null
    var ret = Gs2LogAccessLogWithTelemetry.new()
    ret.timestamp = null if data.get("timestamp") == null else int(data.get("timestamp"))
    ret.source_request_id = null if data.get("sourceRequestId") == null else str(data.get("sourceRequestId"))
    ret.request_id = null if data.get("requestId") == null else str(data.get("requestId"))
    ret.duration = null if data.get("duration") == null else int(data.get("duration"))
    ret.service = null if data.get("service") == null else str(data.get("service"))
    ret.method = null if data.get("method") == null else str(data.get("method"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.request = null if data.get("request") == null else str(data.get("request"))
    ret.result = null if data.get("result") == null else str(data.get("result"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["timestamp"] = timestamp
    ret["sourceRequestId"] = source_request_id
    ret["requestId"] = request_id
    ret["duration"] = duration
    ret["service"] = service
    ret["method"] = method
    ret["userId"] = user_id
    ret["request"] = request
    ret["result"] = result
    ret["status"] = status
    return ret