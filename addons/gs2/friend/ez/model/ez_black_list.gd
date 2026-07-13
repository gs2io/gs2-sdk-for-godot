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
class_name Gs2FriendEzBlackList
extends RefCounted


var user_id = null
var target_user_ids = []


func with_user_id(v) -> Gs2FriendEzBlackList:
    user_id = v
    return self


func with_target_user_ids(v) -> Gs2FriendEzBlackList:
    target_user_ids = v
    return self


func to_model() -> Gs2FriendBlackList:
    var ret = Gs2FriendBlackList.new()
    ret.user_id = user_id
    ret.target_user_ids = null if target_user_ids == null else target_user_ids.map(func(v): return v)
    return ret


static func from_model(model) -> Gs2FriendEzBlackList:
    var ret = Gs2FriendEzBlackList.new()
    ret.user_id = model.user_id
    ret.target_user_ids = [] if model.target_user_ids == null else model.target_user_ids.map(func(v): return v)
    return ret