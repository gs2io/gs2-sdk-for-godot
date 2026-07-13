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
class_name Gs2SeasonRatingWrittenBallot
extends RefCounted


var ballot = null
var game_results = null


func with_ballot(v) -> Gs2SeasonRatingWrittenBallot:
    ballot = v
    return self


func with_game_results(v) -> Gs2SeasonRatingWrittenBallot:
    game_results = v
    return self


static func from_dict(data) -> Gs2SeasonRatingWrittenBallot:
    if data == null:
        return null
    var ret = Gs2SeasonRatingWrittenBallot.new()
    ret.ballot = null if data.get("ballot") == null else Gs2SeasonRatingBallot.from_dict(data.get("ballot"))
    ret.game_results = null if data.get("gameResults") == null else data.get("gameResults").map(func(v): return Gs2SeasonRatingGameResult.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["ballot"] = null if ballot == null else ballot.to_dict()
    ret["gameResults"] = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_dict())
    return ret