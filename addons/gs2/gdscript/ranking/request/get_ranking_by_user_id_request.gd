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
class_name Gs2RankingGetRankingByUserIdRequest
extends Gs2Request


var namespace_name = null
var category_name = null
var user_id = null
var scorer_user_id = null
var unique_id = null
var additional_scope_name = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2RankingGetRankingByUserIdRequest:
    namespace_name = v
    return self


func with_category_name(v) -> Gs2RankingGetRankingByUserIdRequest:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingGetRankingByUserIdRequest:
    user_id = v
    return self


func with_scorer_user_id(v) -> Gs2RankingGetRankingByUserIdRequest:
    scorer_user_id = v
    return self


func with_unique_id(v) -> Gs2RankingGetRankingByUserIdRequest:
    unique_id = v
    return self


func with_additional_scope_name(v) -> Gs2RankingGetRankingByUserIdRequest:
    additional_scope_name = v
    return self


func with_time_offset_token(v) -> Gs2RankingGetRankingByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2RankingGetRankingByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2RankingGetRankingByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.scorer_user_id = null if data.get("scorerUserId") == null else str(data.get("scorerUserId"))
    ret.unique_id = null if data.get("uniqueId") == null else str(data.get("uniqueId"))
    ret.additional_scope_name = null if data.get("additionalScopeName") == null else str(data.get("additionalScopeName"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["scorerUserId"] = scorer_user_id
    ret["uniqueId"] = unique_id
    ret["additionalScopeName"] = additional_scope_name
    ret["timeOffsetToken"] = time_offset_token
    return ret