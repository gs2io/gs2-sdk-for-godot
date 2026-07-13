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
class_name Gs2SeasonRatingBallot
extends RefCounted


var user_id = null
var season_name = null
var session_name = null
var number_of_player = null


func with_user_id(v) -> Gs2SeasonRatingBallot:
    user_id = v
    return self


func with_season_name(v) -> Gs2SeasonRatingBallot:
    season_name = v
    return self


func with_session_name(v) -> Gs2SeasonRatingBallot:
    session_name = v
    return self


func with_number_of_player(v) -> Gs2SeasonRatingBallot:
    number_of_player = v
    return self


static func from_dict(data) -> Gs2SeasonRatingBallot:
    if data == null:
        return null
    var ret = Gs2SeasonRatingBallot.new()
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.season_name = null if data.get("seasonName") == null else str(data.get("seasonName"))
    ret.session_name = null if data.get("sessionName") == null else str(data.get("sessionName"))
    ret.number_of_player = null if data.get("numberOfPlayer") == null else int(data.get("numberOfPlayer"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["userId"] = user_id
    ret["seasonName"] = season_name
    ret["sessionName"] = session_name
    ret["numberOfPlayer"] = number_of_player
    return ret