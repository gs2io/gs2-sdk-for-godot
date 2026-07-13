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
class_name Gs2LogCountExecuteStampSheetLogRequest
extends Gs2Request


var namespace_name = null
var service = null
var method = null
var user_id = null
var action = null
var begin = null
var end = null
var long_term = null
var page_token = null
var limit = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    namespace_name = v
    return self


func with_service(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    service = v
    return self


func with_method(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    method = v
    return self


func with_user_id(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    user_id = v
    return self


func with_action(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    action = v
    return self


func with_begin(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    begin = v
    return self


func with_end(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    end = v
    return self


func with_long_term(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    long_term = v
    return self


func with_page_token(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    limit = v
    return self


func with_time_offset_token(v) -> Gs2LogCountExecuteStampSheetLogRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2LogCountExecuteStampSheetLogRequest:
    if data == null:
        return null
    var ret = Gs2LogCountExecuteStampSheetLogRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.service = null if data.get("service") == null else bool(data.get("service"))
    ret.method = null if data.get("method") == null else bool(data.get("method"))
    ret.user_id = null if data.get("userId") == null else bool(data.get("userId"))
    ret.action = null if data.get("action") == null else bool(data.get("action"))
    ret.begin = null if data.get("begin") == null else int(data.get("begin"))
    ret.end = null if data.get("end") == null else int(data.get("end"))
    ret.long_term = null if data.get("longTerm") == null else bool(data.get("longTerm"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["service"] = service
    ret["method"] = method
    ret["userId"] = user_id
    ret["action"] = action
    ret["begin"] = begin
    ret["end"] = end
    ret["longTerm"] = long_term
    ret["pageToken"] = page_token
    ret["limit"] = limit
    ret["timeOffsetToken"] = time_offset_token
    return ret