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
class_name Gs2Ranking2DescribeSubscribesRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var ranking_name = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2Ranking2DescribeSubscribesRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2Ranking2DescribeSubscribesRequest:
    access_token = v
    return self


func with_ranking_name(v) -> Gs2Ranking2DescribeSubscribesRequest:
    ranking_name = v
    return self


func with_page_token(v) -> Gs2Ranking2DescribeSubscribesRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2Ranking2DescribeSubscribesRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2Ranking2DescribeSubscribesRequest:
    if data == null:
        return null
    var ret = Gs2Ranking2DescribeSubscribesRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["rankingName"] = ranking_name
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret