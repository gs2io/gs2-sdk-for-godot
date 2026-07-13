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
class_name Gs2FriendCancelRequestNotification
extends RefCounted


var namespace_name = null
var user_id = null
var from_user_id = null


func with_namespace_name(v) -> Gs2FriendCancelRequestNotification:
    namespace_name = v
    return self


func with_user_id(v) -> Gs2FriendCancelRequestNotification:
    user_id = v
    return self


func with_from_user_id(v) -> Gs2FriendCancelRequestNotification:
    from_user_id = v
    return self


static func from_dict(data) -> Gs2FriendCancelRequestNotification:
    if data == null:
        return null
    var ret = Gs2FriendCancelRequestNotification.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.from_user_id = null if data.get("fromUserId") == null else str(data.get("fromUserId"))
    return ret