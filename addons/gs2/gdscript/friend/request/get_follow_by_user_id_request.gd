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
class_name Gs2FriendGetFollowByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var target_user_id = null
var with_profile = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2FriendGetFollowByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2FriendGetFollowByUserIdRequest:
    user_id = v
    return self


func with_target_user_id(v) -> Gs2FriendGetFollowByUserIdRequest:
    target_user_id = v
    return self


func with_with_profile(v) -> Gs2FriendGetFollowByUserIdRequest:
    with_profile = v
    return self


func with_time_offset_token(v) -> Gs2FriendGetFollowByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2FriendGetFollowByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2FriendGetFollowByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_user_id = null if data.get("targetUserId") == null else str(data.get("targetUserId"))
    ret.with_profile = null if data.get("withProfile") == null else bool(data.get("withProfile"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["targetUserId"] = target_user_id
    ret["withProfile"] = with_profile
    ret["timeOffsetToken"] = time_offset_token
    return ret