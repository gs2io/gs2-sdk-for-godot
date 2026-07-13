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
class_name Gs2Ranking2DescribeClusterRankingsRequest
extends Gs2Request


var namespace_name = null
var access_token = null
var ranking_name = null
var cluster_name = null
var season = null
var page_token = null
var limit = null


func with_namespace_name(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    namespace_name = v
    return self


func with_access_token(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    access_token = v
    return self


func with_ranking_name(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    ranking_name = v
    return self


func with_cluster_name(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    cluster_name = v
    return self


func with_season(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    season = v
    return self


func with_page_token(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    page_token = v
    return self


func with_limit(v) -> Gs2Ranking2DescribeClusterRankingsRequest:
    limit = v
    return self


static func from_dict(data) -> Gs2Ranking2DescribeClusterRankingsRequest:
    if data == null:
        return null
    var ret = Gs2Ranking2DescribeClusterRankingsRequest.new()
    ret.namespace_name = null if data.get("namespaceName") == null else str(data.get("namespaceName"))
    ret.access_token = null if data.get("accessToken") == null else str(data.get("accessToken"))
    ret.ranking_name = null if data.get("rankingName") == null else str(data.get("rankingName"))
    ret.cluster_name = null if data.get("clusterName") == null else str(data.get("clusterName"))
    ret.season = null if data.get("season") == null else int(data.get("season"))
    ret.page_token = null if data.get("pageToken") == null else str(data.get("pageToken"))
    ret.limit = null if data.get("limit") == null else int(data.get("limit"))
    return ret


func to_dict() -> Dictionary:
    var ret = {}
    ret["namespaceName"] = namespace_name
    ret["accessToken"] = access_token
    ret["rankingName"] = ranking_name
    ret["clusterName"] = cluster_name
    ret["season"] = season
    ret["pageToken"] = page_token
    ret["limit"] = limit
    return ret