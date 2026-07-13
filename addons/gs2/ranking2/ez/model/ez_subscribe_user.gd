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
class_name Gs2Ranking2EzSubscribeUser
extends RefCounted


var ranking_name = null
var user_id = null
var target_user_id = null


func with_ranking_name(v) -> Gs2Ranking2EzSubscribeUser:
    ranking_name = v
    return self


func with_user_id(v) -> Gs2Ranking2EzSubscribeUser:
    user_id = v
    return self


func with_target_user_id(v) -> Gs2Ranking2EzSubscribeUser:
    target_user_id = v
    return self


func to_model() -> Gs2Ranking2SubscribeUser:
    var ret = Gs2Ranking2SubscribeUser.new()
    ret.ranking_name = ranking_name
    ret.user_id = user_id
    ret.target_user_id = target_user_id
    return ret


static func from_model(model) -> Gs2Ranking2EzSubscribeUser:
    var ret = Gs2Ranking2EzSubscribeUser.new()
    ret.ranking_name = model.ranking_name
    ret.user_id = model.user_id
    ret.target_user_id = model.target_user_id
    return ret