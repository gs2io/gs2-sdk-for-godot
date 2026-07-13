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
class_name Gs2MatchmakingVoteMultipleRequest
extends Gs2Request


var namespace_name = null
var signed_ballots = null
var game_results = null
var key_id = null


func with_namespace_name(v) -> Gs2MatchmakingVoteMultipleRequest:
    namespace_name = v
    return self


func with_signed_ballots(v) -> Gs2MatchmakingVoteMultipleRequest:
    signed_ballots = v
    return self


func with_game_results(v) -> Gs2MatchmakingVoteMultipleRequest:
    game_results = v
    return self


func with_key_id(v) -> Gs2MatchmakingVoteMultipleRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2MatchmakingVoteMultipleRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingVoteMultipleRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.signed_ballots = null if data.get("signedBallots") == null else data.get("signedBallots").map(func(v): return Gs2MatchmakingSignedBallot.from_dict(v))
    ret.game_results = null if data.get("gameResults") == null else data.get("gameResults").map(func(v): return Gs2MatchmakingGameResult.from_dict(v))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["signedBallots"] = null if signed_ballots == null else signed_ballots.map(func(v): return null if v == null else v.to_dict())
    ret["gameResults"] = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_dict())
    ret["keyId"] = key_id
    return ret