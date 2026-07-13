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
class_name Gs2Ranking2PutSubscribeRankingScoreRequest
extends Gs2Request


var namespace_name = null
var ranking_name = null
var access_token = null
var score = null
var metadata = null
var duplication_avoider = null


func with_namespace_name(v) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    namespace_name = v
    return self


func with_ranking_name(v) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    ranking_name = v
    return self


func with_access_token(v) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    access_token = v
    return self


func with_score(v) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    score = v
    return self


func with_metadata(v) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    metadata = v
    return self


func with_duplication_avoider(v) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    duplication_avoider = v
    return self


static func from_dict(data) -> Gs2Ranking2PutSubscribeRankingScoreRequest:
    if data == null:
        return null
    var ret = Gs2Ranking2PutSubscribeRankingScoreRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.score = null if data.get("score") == null else int(data.get("score"))
    ret.metadata = null if data.get("metadata") == null else str(data.get("metadata"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rankingName"] = ranking_name
    ret["accessToken"] = access_token
    ret["score"] = score
    ret["metadata"] = metadata
    return ret