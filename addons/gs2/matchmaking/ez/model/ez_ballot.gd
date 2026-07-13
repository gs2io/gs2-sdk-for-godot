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
class_name Gs2MatchmakingEzBallot
extends RefCounted


var user_id = null
var rating_name = null
var gathering_name = null
var number_of_player = 0


func with_user_id(v) -> Gs2MatchmakingEzBallot:
    user_id = v
    return self


func with_rating_name(v) -> Gs2MatchmakingEzBallot:
    rating_name = v
    return self


func with_gathering_name(v) -> Gs2MatchmakingEzBallot:
    gathering_name = v
    return self


func with_number_of_player(v) -> Gs2MatchmakingEzBallot:
    number_of_player = v
    return self


func to_model() -> Gs2MatchmakingBallot:
    var ret = Gs2MatchmakingBallot.new()
    ret.user_id = user_id
    ret.rating_name = rating_name
    ret.gathering_name = gathering_name
    ret.number_of_player = number_of_player
    return ret


static func from_model(model) -> Gs2MatchmakingEzBallot:
    var ret = Gs2MatchmakingEzBallot.new()
    ret.user_id = model.user_id
    ret.rating_name = model.rating_name
    ret.gathering_name = model.gathering_name
    ret.number_of_player = 0 if model.number_of_player == null else model.number_of_player
    return ret