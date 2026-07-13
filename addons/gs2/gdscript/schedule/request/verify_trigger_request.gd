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
class_name Gs2ScheduleVerifyTriggerRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var trigger_name = null
var verify_type = null
var elapsed_minutes = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2ScheduleVerifyTriggerRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2ScheduleVerifyTriggerRequest:
    access_token = v
    return self


func with_trigger_name(v) -> Gs2ScheduleVerifyTriggerRequest:
    trigger_name = v
    return self


func with_verify_type(v) -> Gs2ScheduleVerifyTriggerRequest:
    verify_type = v
    return self


func with_elapsed_minutes(v) -> Gs2ScheduleVerifyTriggerRequest:
    elapsed_minutes = v
    return self


func with_duplication_avoider(v) -> Gs2ScheduleVerifyTriggerRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2ScheduleVerifyTriggerRequest:
    if data == null:
        return null
    var ret = Gs2ScheduleVerifyTriggerRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.trigger_name = null if data.get("triggerName") == null else str(data.get("triggerName"))
    ret.verify_type = null if data.get("verifyType") == null else str(data.get("verifyType"))
    ret.elapsed_minutes = null if data.get("elapsedMinutes") == null else int(data.get("elapsedMinutes"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["triggerName"] = trigger_name
    ret["verifyType"] = verify_type
    ret["elapsedMinutes"] = elapsed_minutes
    return ret