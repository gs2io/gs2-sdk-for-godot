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
class_name Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest
extends Gs2Request


var namespace_name = null
var ranking_name = null
var cluster_name = null
var user_id = null
var season = null
var time_offset_token = null


func with_namespace_name(v) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    namespace_name = v
    return self


func with_ranking_name(v) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    ranking_name = v
    return self


func with_cluster_name(v) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    cluster_name = v
    return self


func with_user_id(v) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    user_id = v
    return self


func with_season(v) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    season = v
    return self


func with_time_offset_token(v) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    time_offset_token = v
    return self


static func from_dict(data) -> Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest:
    if data == null:
        return null
    var ret = Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.cluster_name = null if data.get("clusterName") == null else str(data.get("clusterName"))
    ret.user_id = null if data.get("userId") == null else str(data.get("userId"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.time_offset_token = null if data.get("timeOffsetToken") == null else str(data.get("timeOffsetToken"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["rankingName"] = ranking_name
    ret["clusterName"] = cluster_name
    ret["userId"] = user_id
    ret["season"] = season
    ret["timeOffsetToken"] = time_offset_token
    return ret