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
class_name Gs2ScheduleGetRawEventRequest
extends Gs2Request


var namespace_name = null
var event_name = null


func with_namespace_name(v) -> Gs2ScheduleGetRawEventRequest:
    namespace_name = v
    return self


func with_event_name(v) -> Gs2ScheduleGetRawEventRequest:
    event_name = v
    return self


static func from_dict(data) -> Gs2ScheduleGetRawEventRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleGetRawEventRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.event_name = null if data.get("eventName") == null else str(data.get("eventName"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["eventName"] = event_name
    return ret