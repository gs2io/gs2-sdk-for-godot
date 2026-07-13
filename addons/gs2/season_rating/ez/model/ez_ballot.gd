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
class_name Gs2SeasonRatingEzBallot
extends RefCounted


var user_id = null
var season_name = null
var session_name = null
var number_of_player = 0


func with_user_id(v) -> Gs2SeasonRatingEzBallot:
    user_id = v
    return self


func with_season_name(v) -> Gs2SeasonRatingEzBallot:
    season_name = v
    return self


func with_session_name(v) -> Gs2SeasonRatingEzBallot:
    session_name = v
    return self


func with_number_of_player(v) -> Gs2SeasonRatingEzBallot:
    number_of_player = v
    return self


func to_model() -> Gs2SeasonRatingBallot:
    var ret = Gs2SeasonRatingBallot.new()
    ret.user_id = user_id
    ret.season_name = season_name
    ret.session_name = session_name
    ret.number_of_player = number_of_player
    return ret


static func from_model(model) -> Gs2SeasonRatingEzBallot:
    var ret = Gs2SeasonRatingEzBallot.new()
    ret.user_id = model.user_id
    ret.season_name = model.season_name
    ret.session_name = model.session_name
    ret.number_of_player = 0 if model.number_of_player == null else model.number_of_player
    return ret