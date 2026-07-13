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
class_name Gs2RankingGetSubscribeByUserIdRequest
extends Gs2Request


var namespace_name = null
var category_name = null
var user_id = null
var target_user_id = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2RankingGetSubscribeByUserIdRequest:
    namespace_name = v
    return self


func with_category_name(v) -> Gs2RankingGetSubscribeByUserIdRequest:
    category_name = v
    return self


func with_user_id(v) -> Gs2RankingGetSubscribeByUserIdRequest:
    user_id = v
    return self


func with_target_user_id(v) -> Gs2RankingGetSubscribeByUserIdRequest:
    target_user_id = v
    return self


func with_time_offset_token(v) -> Gs2RankingGetSubscribeByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2RankingGetSubscribeByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2RankingGetSubscribeByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_user_id = null if data.get("targetUserId") == null else str(data.get("targetUserId"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["categoryName"] = category_name
    ret["userId"] = user_id
    ret["targetUserId"] = target_user_id
    ret["timeOffsetToken"] = time_offset_token
    return ret