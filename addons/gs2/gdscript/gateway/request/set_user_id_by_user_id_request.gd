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
class_name Gs2GatewaySetUserIdByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var allow_concurrent_access = null
var session_id = null
var force = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    user_id = v
    return self


func with_allow_concurrent_access(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    allow_concurrent_access = v
    return self


func with_session_id(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    session_id = v
    return self


func with_force(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    force = v
    return self


func with_time_offset_token(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2GatewaySetUserIdByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2GatewaySetUserIdByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2GatewaySetUserIdByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.allow_concurrent_access = null if data.get("allowConcurrentAccess") == null else bool(data.get("allowConcurrentAccess"))
    ret.session_id = null if data.get("sessionId") == null else str(data.get("sessionId"))
    ret.force = null if data.get("force") == null else bool(data.get("force"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["allowConcurrentAccess"] = allow_concurrent_access
    ret["sessionId"] = session_id
    ret["force"] = force
    ret["timeOffsetToken"] = time_offset_token
    return ret