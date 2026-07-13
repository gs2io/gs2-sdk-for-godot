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
class_name Gs2StateMachineDescribeStatusesByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var status = null
var page_token = null
var limit = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    user_id = v
    return self


func with_status(v) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    status = v
    return self


func with_page_token(v) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    limit = v
    return self


func with_time_offset_token(v) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2StateMachineDescribeStatusesByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2StateMachineDescribeStatusesByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.status = null if data.get("status") == null else str(data.get("status"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["status"] = status
    ret["pageToken"] = page_token
    ret["limit"] = limit
    ret["timeOffsetToken"] = time_offset_token
    return ret