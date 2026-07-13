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
class_name Gs2RankingDescribeRankingssByUserIdRequest
extends Gs2Request


var namespace_name = null
var category_name = null
var user_id = null
var additional_scope_name = null
var start_index = null
var page_token = null
var limit = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    namespace_name = v
    return self


func with_category_name(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    user_id = v
    return self


func with_additional_scope_name(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    additional_scope_name = v
    return self


func with_start_index(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    start_index = v
    return self


func with_page_token(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    limit = v
    return self


func with_time_offset_token(v) -> Gs2RankingDescribeRankingssByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2RankingDescribeRankingssByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2RankingDescribeRankingssByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.additional_scope_name = null if data.get("additionalScopeName") == null else str(data.get("additionalScopeName"))
    ret.start_index = null if data.get("startIndex") == null else int(data.get("startIndex"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["additionalScopeName"] = additional_scope_name
    ret["startIndex"] = start_index
    ret["pageToken"] = page_token
    ret["limit"] = limit
    ret["timeOffsetToken"] = time_offset_token
    return ret