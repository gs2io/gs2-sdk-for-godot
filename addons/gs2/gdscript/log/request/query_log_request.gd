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
class_name Gs2LogQueryLogRequest
extends Gs2Request


var namespace_name = null
var begin = null
var end = null
var query = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2LogQueryLogRequest:
    namespace_name = v
    return self


func with_begin(v) -> Gs2LogQueryLogRequest:
    begin = v
    return self


func with_end(v) -> Gs2LogQueryLogRequest:
    end = v
    return self


func with_query(v) -> Gs2LogQueryLogRequest:
    query = v
    return self


func with_page_token(v) -> Gs2LogQueryLogRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2LogQueryLogRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2LogQueryLogRequest:
    if data == null:
        return null
    var ret = Gs2LogQueryLogRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.begin = null if data.get("begin") == null else int(data.get("begin"))
    ret.end = null if data.get("end") == null else int(data.get("end"))
    ret.query = null if data.get("query") == null else str(data.get("query"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["begin"] = begin
    ret["end"] = end
    ret["query"] = query
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret