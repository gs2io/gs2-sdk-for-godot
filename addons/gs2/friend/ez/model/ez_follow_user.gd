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
class_name Gs2FriendEzFollowUser
extends RefCounted


var user_id = null
var public_profile = null
var follower_profile = null


func with_user_id(v) -> Gs2FriendEzFollowUser:
    user_id = v
    return self


func with_public_profile(v) -> Gs2FriendEzFollowUser:
    public_profile = v
    return self


func with_follower_profile(v) -> Gs2FriendEzFollowUser:
    follower_profile = v
    return self


func to_model() -> Gs2FriendFollowUser:
    var ret = Gs2FriendFollowUser.new()
    ret.user_id = user_id
    ret.public_profile = public_profile
    ret.follower_profile = follower_profile
    return ret


static func from_model(model) -> Gs2FriendEzFollowUser:
    var ret = Gs2FriendEzFollowUser.new()
    ret.user_id = model.user_id
    ret.public_profile = model.public_profile
    ret.follower_profile = model.follower_profile
    return ret