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
class_name Gs2ScheduleGetEventByUserIdRequest
extends Gs2Request


var namespace_name = null
var event_name = null
var user_id = null
var is_in_schedule = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2ScheduleGetEventByUserIdRequest:
    namespace_name = v
    return self


func with_event_name(v) -> Gs2ScheduleGetEventByUserIdRequest:
    event_name = v
    return self


func with_user_id(v) -> Gs2ScheduleGetEventByUserIdRequest:
    user_id = v
    return self


func with_is_in_schedule(v) -> Gs2ScheduleGetEventByUserIdRequest:
    is_in_schedule = v
    return self


func with_time_offset_token(v) -> Gs2ScheduleGetEventByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2ScheduleGetEventByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleGetEventByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.event_name = null if data.get("eventName") == null else str(data.get("eventName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.is_in_schedule = null if data.get("isInSchedule") == null else bool(data.get("isInSchedule"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["eventName"] = event_name
    ret["userId"] = user_id
    ret["isInSchedule"] = is_in_schedule
    ret["timeOffsetToken"] = time_offset_token
    return ret