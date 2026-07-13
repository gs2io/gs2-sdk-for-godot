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
class_name Gs2ScheduleVerifyEventByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var event_name = null
var verify_type = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ScheduleVerifyEventByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2ScheduleVerifyEventByUserIdRequest:
    user_id = v
    return self


func with_event_name(v) -> Gs2ScheduleVerifyEventByUserIdRequest:
    event_name = v
    return self


func with_verify_type(v) -> Gs2ScheduleVerifyEventByUserIdRequest:
    verify_type = v
    return self


func with_time_offset_token(v) -> Gs2ScheduleVerifyEventByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ScheduleVerifyEventByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ScheduleVerifyEventByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleVerifyEventByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.event_name = null if data.get("eventName") == null else str(data.get("eventName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["eventName"] = event_name
    ret["verifyType"] = verify_type
    ret["timeOffsetToken"] = time_offset_token
    return ret