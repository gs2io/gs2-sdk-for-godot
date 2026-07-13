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
class_name Gs2FriendFriendUser
extends RefCounted


var user_id = null
var public_profile = null
var friend_profile = null


func with_user_id(v) -> Gs2FriendFriendUser:
    user_id = v
    return self


func with_public_profile(v) -> Gs2FriendFriendUser:
    public_profile = v
    return self


func with_friend_profile(v) -> Gs2FriendFriendUser:
    friend_profile = v
    return self


static func from_dict(data) -> Gs2FriendFriendUser:
    if data == null:
        return null
    var ret = Gs2FriendFriendUser.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.public_profile = null if data.get("publicProfile") == null else str(data.get("publicProfile"))
    ret.friend_profile = null if data.get("friendProfile") == null else str(data.get("friendProfile"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["publicProfile"] = public_profile
    ret["friendProfile"] = friend_profile
    return ret