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
class_name Gs2FriendRegisterBlackListRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var target_user_id = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2FriendRegisterBlackListRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2FriendRegisterBlackListRequest:
    access_token = v
    return self


func with_target_user_id(v) -> Gs2FriendRegisterBlackListRequest:
    target_user_id = v
    return self


func with_duplication_avoider(v) -> Gs2FriendRegisterBlackListRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2FriendRegisterBlackListRequest:
    if data == null:
        return null
    var ret = Gs2FriendRegisterBlackListRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.target_user_id = null if data.get("targetUserId") == null else str(data.get("targetUserId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["targetUserId"] = target_user_id
    return ret