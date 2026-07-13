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
class_name Gs2LogQueryInGameLogRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var tags = null
var begin = null
var end = null
var long_term = null
var page_token = null
var limit = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2LogQueryInGameLogRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2LogQueryInGameLogRequest:
    user_id = v
    return self


func with_tags(v) -> Gs2LogQueryInGameLogRequest:
    tags = v
    return self


func with_begin(v) -> Gs2LogQueryInGameLogRequest:
    begin = v
    return self


func with_end(v) -> Gs2LogQueryInGameLogRequest:
    end = v
    return self


func with_long_term(v) -> Gs2LogQueryInGameLogRequest:
    long_term = v
    return self


func with_page_token(v) -> Gs2LogQueryInGameLogRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2LogQueryInGameLogRequest:
    limit = v
    return self


func with_time_offset_token(v) -> Gs2LogQueryInGameLogRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2LogQueryInGameLogRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2LogQueryInGameLogRequest:
    if data == null:
        return null
    var ret = Gs2LogQueryInGameLogRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.tags = null if data.get("tags") == null else data.get("tags").map(func(v): return Gs2LogInGameLogTag.from_dict(v))
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
    ret["userId"] = user_id
    ret["tags"] = null if tags == null else tags.map(func(v): return null if v == null else v.to_dict())
    ret["begin"] = begin
    ret["end"] = end
    ret["longTerm"] = long_term
    ret["pageToken"] = page_token
    ret["limit"] = limit
    ret["timeOffsetToken"] = time_offset_token
    return ret