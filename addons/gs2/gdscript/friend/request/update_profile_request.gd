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
class_name Gs2FriendUpdateProfileRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var public_profile = null
var follower_profile = null
var friend_profile = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FriendUpdateProfileRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2FriendUpdateProfileRequest:
    access_token = v
    return self


func with_public_profile(v) -> Gs2FriendUpdateProfileRequest:
    public_profile = v
    return self


func with_follower_profile(v) -> Gs2FriendUpdateProfileRequest:
    follower_profile = v
    return self


func with_friend_profile(v) -> Gs2FriendUpdateProfileRequest:
    friend_profile = v
    return self


func with_duplication_avoider(v) -> Gs2FriendUpdateProfileRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FriendUpdateProfileRequest:
    if data == null:
        return null
    var ret = Gs2FriendUpdateProfileRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.public_profile = null if data.get("publicProfile") == null else str(data.get("publicProfile"))
    ret.follower_profile = null if data.get("followerProfile") == null else str(data.get("followerProfile"))
    ret.friend_profile = null if data.get("friendProfile") == null else str(data.get("friendProfile"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["publicProfile"] = public_profile
    ret["followerProfile"] = follower_profile
    ret["friendProfile"] = friend_profile
    return ret