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
class_name Gs2Ranking2SubscribeUser
extends RefCounted


var ranking_name = null
var user_id = null
var target_user_id = null


func with_ranking_name(v) -> Gs2Ranking2SubscribeUser:
    ranking_name = v
    return self


func with_user_id(v) -> Gs2Ranking2SubscribeUser:
    user_id = v
    return self


func with_target_user_id(v) -> Gs2Ranking2SubscribeUser:
    target_user_id = v
    return self


static func from_dict(data) -> Gs2Ranking2SubscribeUser:
    if data == null:
        return null
    var ret = Gs2Ranking2SubscribeUser.new()
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.target_user_id = null if data.get("targetUserId") == null else str(data.get("targetUserId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["rankingName"] = ranking_name
    ret["userId"] = user_id
    ret["targetUserId"] = target_user_id
    return ret