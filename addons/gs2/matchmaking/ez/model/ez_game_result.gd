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
class_name Gs2MatchmakingEzGameResult
extends RefCounted


var rank = 0
var user_id = null


func with_rank(v) -> Gs2MatchmakingEzGameResult:
    rank = v
    return self


func with_user_id(v) -> Gs2MatchmakingEzGameResult:
    user_id = v
    return self


func to_model() -> Gs2MatchmakingGameResult:
    var ret = Gs2MatchmakingGameResult.new()
    ret.rank = rank
    ret.user_id = user_id
    return ret


static func from_model(model) -> Gs2MatchmakingEzGameResult:
    var ret = Gs2MatchmakingEzGameResult.new()
    ret.rank = 0 if model.rank == null else model.rank
    ret.user_id = model.user_id
    return ret