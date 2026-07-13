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
class_name Gs2StateMachineEmitRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var status_name = null
var event_name = null
var args = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2StateMachineEmitRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2StateMachineEmitRequest:
    access_token = v
    return self


func with_status_name(v) -> Gs2StateMachineEmitRequest:
    status_name = v
    return self


func with_event_name(v) -> Gs2StateMachineEmitRequest:
    event_name = v
    return self


func with_args(v) -> Gs2StateMachineEmitRequest:
    args = v
    return self


func with_duplication_avoider(v) -> Gs2StateMachineEmitRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2StateMachineEmitRequest:
    if data == null:
        return null
    var ret = Gs2StateMachineEmitRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.status_name = null if data.get("statusName") == null else str(data.get("statusName"))
    ret.event_name = null if data.get("eventName") == null else str(data.get("eventName"))
    ret.args = null if data.get("args") == null else str(data.get("args"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["statusName"] = status_name
    ret["eventName"] = event_name
    ret["args"] = args
    return ret