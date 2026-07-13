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
class_name Gs2FriendUpdateProfileByUserIdRequest
extends Gs2Request


var namespace_name = null
var user_id = null
var public_profile = null
var follower_profile = null
var friend_profile = null
var time_offset_token = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    user_id = v
    return self


func with_public_profile(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    public_profile = v
    return self


func with_follower_profile(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    follower_profile = v
    return self


func with_friend_profile(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    friend_profile = v
    return self


func with_time_offset_token(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    time_offset_token = v
    return self


func with_duplication_avoider(v) -> Gs2FriendUpdateProfileByUserIdRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FriendUpdateProfileByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2FriendUpdateProfileByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.public_profile = null if data.get("publicProfile") == null else str(data.get("publicProfile"))
    ret.follower_profile = null if data.get("followerProfile") == null else str(data.get("followerProfile"))
    ret.friend_profile = null if data.get("friendProfile") == null else str(data.get("friendProfile"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["userId"] = user_id
    ret["publicProfile"] = public_profile
    ret["followerProfile"] = follower_profile
    ret["friendProfile"] = friend_profile
    ret["timeOffsetToken"] = time_offset_token
    return ret