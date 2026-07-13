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
class_name Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var category_name = null
var increase_minutes = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    user_id = v
    return self


func with_category_name(v) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    category_name = v
    return self


func with_increase_minutes(v) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    increase_minutes = v
    return self


func with_time_offset_token(v) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.category_name = null if data.get("categoryName") == null else str(data.get("categoryName"))
    ret.increase_minutes = null if data.get("increaseMinutes") == null else int(data.get("increaseMinutes"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["categoryName"] = category_name
    ret["increaseMinutes"] = increase_minutes
    ret["timeOffsetToken"] = time_offset_token
    return ret