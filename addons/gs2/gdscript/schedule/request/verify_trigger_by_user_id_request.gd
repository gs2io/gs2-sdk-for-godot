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
class_name Gs2ScheduleVerifyTriggerByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var trigger_name = null
var verify_type = null
var elapsed_minutes = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    user_id = v
    return self


func with_trigger_name(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    trigger_name = v
    return self


func with_verify_type(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    verify_type = v
    return self


func with_elapsed_minutes(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    elapsed_minutes = v
    return self


func with_time_offset_token(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ScheduleVerifyTriggerByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleVerifyTriggerByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.trigger_name = null if data.get("triggerName") == null else str(data.get("triggerName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.elapsed_minutes = null if data.get("elapsedMinutes") == null else int(data.get("elapsedMinutes"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["triggerName"] = trigger_name
    ret["verifyType"] = verify_type
    ret["elapsedMinutes"] = elapsed_minutes
    ret["timeOffsetToken"] = time_offset_token
    return ret