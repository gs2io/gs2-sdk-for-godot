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
class_name Gs2MatchmakingVoteRequest
extends Gs2Request


var namespace_name = null
var ballot_body = null
var ballot_signature = null
var game_results = null
var key_id = null


func with_namespace_name(v) -> Gs2MatchmakingVoteRequest:
    namespace_name = v
    return self


func with_ballot_body(v) -> Gs2MatchmakingVoteRequest:
    ballot_body = v
    return self


func with_ballot_signature(v) -> Gs2MatchmakingVoteRequest:
    ballot_signature = v
    return self


func with_game_results(v) -> Gs2MatchmakingVoteRequest:
    game_results = v
    return self


func with_key_id(v) -> Gs2MatchmakingVoteRequest:
    key_id = v
    return self


static func from_dict(data) -> Gs2MatchmakingVoteRequest:
    if data == null:
        return null
    var ret = Gs2MatchmakingVoteRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.ballot_body = null if data.get("ballotBody") == null else str(data.get("ballotBody"))
    ret.ballot_signature = null if data.get("ballotSignature") == null else str(data.get("ballotSignature"))
    ret.game_results = null if data.get("gameResults") == null else data.get("gameResults").map(func(v): return Gs2MatchmakingGameResult.from_dict(v))
    ret.key_id = null if data.get("keyId") == null else str(data.get("keyId"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["ballotBody"] = ballot_body
    ret["ballotSignature"] = ballot_signature
    ret["gameResults"] = null if game_results == null else game_results.map(func(v): return null if v == null else v.to_dict())
    ret["keyId"] = key_id
    return ret