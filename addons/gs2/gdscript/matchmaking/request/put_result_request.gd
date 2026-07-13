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
class_name Gs2MatchmakingPutResultRequest
extends Gs2Request


var namespace_name = null
var rating_name = null
var game_results = null


func with_namespace_name(v) -> Gs2MatchmakingPutResultRequest:
    namespace_name = v
    return self


func with_rating_name(v) -> Gs2MatchmakingPutResultRequest:
    rating_name = v
    return self


func with_game_results(v) -> Gs2MatchmakingPutResultRequest:
    game_results = v
    return self


static func from_dict(data) -> Gs2MatchmakingPutResultRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingPutResultRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.rating_name = null if data.get("ratingName") == null else str(data.get("ratingName"))
    ret.game_results = null if data.get("gameResults") == null else data.get("gameResults").map(func(v): return Gs2MatchmakingGameResult.from_dict(v))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["ratingName"] = rating_name
    ret["gameResults"] = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_dict())
    return ret