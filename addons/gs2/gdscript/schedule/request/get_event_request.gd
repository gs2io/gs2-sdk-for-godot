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
class_name Gs2ScheduleGetEventRequest
extends Gs2Request


var namespace_name = null
var event_name = null
var access_token = null
var is_in_schedule = null


func with_namespace_name(v) -> Gs2ScheduleGetEventRequest:
    namespace_name = v
    return self


func with_event_name(v) -> Gs2ScheduleGetEventRequest:
    event_name = v
    return self


func with_access_token(v) -> Gs2ScheduleGetEventRequest:
    access_token = v
    return self


func with_is_in_schedule(v) -> Gs2ScheduleGetEventRequest:
    is_in_schedule = v
    return self


static func from_dict(data) -> Gs2ScheduleGetEventRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleGetEventRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.event_name = null if data.get("eventName") == null else str(data.get("eventName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.is_in_schedule = null if data.get("isInSchedule") == null else bool(data.get("isInSchedule"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["eventName"] = event_name
    ret["accessToken"] = access_token
    ret["isInSchedule"] = is_in_schedule
    return ret