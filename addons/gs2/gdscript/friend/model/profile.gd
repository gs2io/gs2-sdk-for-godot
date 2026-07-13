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
class_name Gs2FriendProfile
extends RefCounted


var profile_id = null
var user_id = null
var public_profile = null
var follower_profile = null
var friend_profile = null
var created_at = null
var updated_at = null
var revision = null


func with_profile_id(v) -> Gs2FriendProfile:
    profile_id = v
    return self


func with_user_id(v) -> Gs2FriendProfile:
    user_id = v
    return self


func with_public_profile(v) -> Gs2FriendProfile:
    public_profile = v
    return self


func with_follower_profile(v) -> Gs2FriendProfile:
    follower_profile = v
    return self


func with_friend_profile(v) -> Gs2FriendProfile:
    friend_profile = v
    return self


func with_created_at(v) -> Gs2FriendProfile:
    created_at = v
    return self


func with_updated_at(v) -> Gs2FriendProfile:
    updated_at = v
    return self


func with_revision(v) -> Gs2FriendProfile:
    revision = v
    return self


static func get_region_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):friend:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("region")


static func get_owner_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):friend:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("ownerId")


static func get_namespace_name_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):friend:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("namespaceName")


static func get_user_id_from_grn(grn):
    if grn == null:
        return null
    var regex = RegEx.new()
    regex.compile("grn:gs2:(?<region>.+):(?<ownerId>.+):friend:(?<namespaceName>.+):user:(?<userId>.+)")
    var matched = regex.search(grn)
    if matched == null:
        return null
    return matched.get_string("userId")


static func from_dict(data) -> Gs2FriendProfile:
    if data == null:
        return null
    var ret = Gs2FriendProfile.new()
    ret.profile_id = null if data.get("profileId") == null else str(data.get("profileId"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.public_profile = null if data.get("publicProfile") == null else str(data.get("publicProfile"))
    ret.follower_profile = null if data.get("followerProfile") == null else str(data.get("followerProfile"))
    ret.friend_profile = null if data.get("friendProfile") == null else str(data.get("friendProfile"))
    ret.created_at = null if data.get("createdAt") == null else int(data.get("createdAt"))
    ret.updated_at = null if data.get("updatedAt") == null else int(data.get("updatedAt"))
    ret.revision = null if data.get("revision") == null else int(data.get("revision"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["profileId"] = profile_id
    ret["userId"] = user_id
    ret["publicProfile"] = public_profile
    ret["followerProfile"] = follower_profile
    ret["friendProfile"] = friend_profile
    ret["createdAt"] = created_at
    ret["updatedAt"] = updated_at
    ret["revision"] = revision
    return ret