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
class_name Gs2FriendErrorResolver
extends RefCounted


static func resolve(method: String, error: Gs2Exception) -> Gs2Exception:
    if error == null:
        return null
    match method:
        "RegisterBlackList", "RegisterBlackListByUserId":
            if error.has_error_code("friend.blackList.targetUserId.duplicate"):
                return Gs2FriendAlreadyInBlackListException.new(error)
        "Follow", "FollowByUserId":
            if error.has_error_code("friend.followUser.targetUserId.duplicate"):
                return Gs2FriendAlreadyFollowingException.new(error)
        "AddFriend", "AddFriendByUserId", "AcceptRequest", "AcceptRequestByUserId":
            if error.has_error_code("friend.friend.targetUserId.duplicate"):
                return Gs2FriendAlreadyFriendException.new(error)
        "SendRequest", "SendRequestByUserId":
            if error.has_error_code("friend.sendFriendRequest.targetUserId.self"):
                return Gs2FriendSendRequestToSelfException.new(error)
            elif error.has_error_code("friend.sendFriendRequest.capacity.full"):
                return Gs2FriendSendRequestCapacityFullException.new(error)
            elif error.has_error_code("friend.sendFriendRequest.targetUserId.duplicate"):
                return Gs2FriendDuplicateFriendRequestException.new(error)
    return error