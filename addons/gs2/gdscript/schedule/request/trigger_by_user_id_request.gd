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
class_name Gs2ScheduleTriggerByUserIdRequest
extends Gs2Request


var namespace_name = null
var trigger_name = null
var user_id = null
var trigger_strategy = null
var ttl = null
var event_id = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ScheduleTriggerByUserIdRequest:
    namespace_name = v
    return self


func with_trigger_name(v) -> Gs2ScheduleTriggerByUserIdRequest:
    trigger_name = v
    return self


func with_user_id(v) -> Gs2ScheduleTriggerByUserIdRequest:
    user_id = v
    return self


func with_trigger_strategy(v) -> Gs2ScheduleTriggerByUserIdRequest:
    trigger_strategy = v
    return self


func with_ttl(v) -> Gs2ScheduleTriggerByUserIdRequest:
    ttl = v
    return self


func with_event_id(v) -> Gs2ScheduleTriggerByUserIdRequest:
    event_id = v
    return self


func with_time_offset_token(v) -> Gs2ScheduleTriggerByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ScheduleTriggerByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ScheduleTriggerByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleTriggerByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.trigger_name = null if data.get("triggerName") == null else str(data.get("triggerName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.trigger_strategy = null if data.get("triggerStrategy") == null else str(data.get("triggerStrategy"))
    ret.ttl = null if data.get("ttl") == null else int(data.get("ttl"))
    ret.event_id = null if data.get("eventId") == null else str(data.get("eventId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["triggerName"] = trigger_name
    ret["userId"] = user_id
    ret["triggerStrategy"] = trigger_strategy
    ret["ttl"] = ttl
    ret["eventId"] = event_id
    ret["timeOffsetToken"] = time_offset_token
    return ret