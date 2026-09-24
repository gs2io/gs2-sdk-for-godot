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
class_name Gs2Ranking2ServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


# Gs2Distributor:DescribeUserData（ユーザーの全データの一括取得）の 1 エントリを、kind に対応するモデルのキャッシュへ入れる。
# 戻り値は親キー（null は知らない kind ＝ SDK が古い / 対応表に無い）。呼び手は全ページを読み終えてから
# set_list_cached(cache, time_offset, kind, parent_key) を呼ぶ。対応表は sdk-gen の type/user_data_cache.py（kind → モデル）。
static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    if kind == "clusterRankingReceivedReward":
        var item = Gs2Ranking2ClusterRankingReceivedReward.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2ClusterRankingReceivedRewardCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "clusterRankingScore":
        var item = Gs2Ranking2ClusterRankingScore.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2ClusterRankingScoreCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "globalRankingReceivedReward":
        var item = Gs2Ranking2GlobalRankingReceivedReward.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2GlobalRankingReceivedRewardCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "globalRankingScore":
        var item = Gs2Ranking2GlobalRankingScore.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2GlobalRankingScoreCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "subscribeRankingData":
        var item = Gs2Ranking2SubscribeRankingData.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2SubscribeRankingDataCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "subscribeRankingScore":
        var item = Gs2Ranking2SubscribeRankingScore.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2SubscribeRankingScoreCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "subscribeUser":
        var item = Gs2Ranking2SubscribeUser.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2Ranking2SubscribeUserCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    return null


# 一括取得で入れた kind の親キーに「リストが揃った印」を立てる（Describe のイテレータがサーバーへ出なくなる）。
static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    if kind == "clusterRankingReceivedReward":
        cache.set_list_cached("Gs2Ranking2ClusterRankingReceivedReward", parent_key)
        return true
    if kind == "clusterRankingScore":
        cache.set_list_cached("Gs2Ranking2ClusterRankingScore", parent_key)
        return true
    if kind == "globalRankingReceivedReward":
        cache.set_list_cached("Gs2Ranking2GlobalRankingReceivedReward", parent_key)
        return true
    if kind == "globalRankingScore":
        cache.set_list_cached("Gs2Ranking2GlobalRankingScore", parent_key)
        return true
    if kind == "subscribeRankingData":
        cache.set_list_cached("Gs2Ranking2SubscribeRankingData", parent_key)
        return true
    if kind == "subscribeRankingScore":
        cache.set_list_cached("Gs2Ranking2SubscribeRankingScore", parent_key)
        return true
    if kind == "subscribeUser":
        cache.set_list_cached("Gs2Ranking2SubscribeUser", parent_key)
        return true
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2Ranking2DescribeNamespacesMethodCache.put_cache(
            Gs2Ranking2DescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2Ranking2CreateNamespaceMethodCache.put_cache(
            Gs2Ranking2CreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2Ranking2GetNamespaceStatusMethodCache.put_cache(
            Gs2Ranking2GetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2Ranking2GetNamespaceMethodCache.put_cache(
            Gs2Ranking2GetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2Ranking2UpdateNamespaceMethodCache.put_cache(
            Gs2Ranking2UpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2UpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2Ranking2DeleteNamespaceMethodCache.put_cache(
            Gs2Ranking2DeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2Ranking2GetServiceVersionMethodCache.put_cache(
            Gs2Ranking2GetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2Ranking2DumpUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2DumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2Ranking2CheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2CheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2Ranking2CleanUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2CleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2Ranking2CheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2CheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2Ranking2PrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2PrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2Ranking2ImportUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2ImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2ImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2Ranking2CheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2Ranking2CheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingModels":
        Gs2Ranking2DescribeGlobalRankingModelsMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingModel":
        Gs2Ranking2GetGlobalRankingModelMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingModelMasters":
        Gs2Ranking2DescribeGlobalRankingModelMastersMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGlobalRankingModelMaster":
        Gs2Ranking2CreateGlobalRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2CreateGlobalRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateGlobalRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingModelMaster":
        Gs2Ranking2GetGlobalRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGlobalRankingModelMaster":
        Gs2Ranking2UpdateGlobalRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2UpdateGlobalRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2UpdateGlobalRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGlobalRankingModelMaster":
        Gs2Ranking2DeleteGlobalRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2DeleteGlobalRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteGlobalRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingScores":
        Gs2Ranking2DescribeGlobalRankingScoresMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingScoresResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingScoresRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingScoresByUserId":
        Gs2Ranking2DescribeGlobalRankingScoresByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingScoresByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingScoresByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putGlobalRankingScore":
        Gs2Ranking2PutGlobalRankingScoreMethodCache.put_cache(
            Gs2Ranking2PutGlobalRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PutGlobalRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putGlobalRankingScoreByUserId":
        Gs2Ranking2PutGlobalRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2PutGlobalRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PutGlobalRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingScore":
        Gs2Ranking2GetGlobalRankingScoreMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingScoreByUserId":
        Gs2Ranking2GetGlobalRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGlobalRankingScoreByUserId":
        Gs2Ranking2DeleteGlobalRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2DeleteGlobalRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteGlobalRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyGlobalRankingScore":
        Gs2Ranking2VerifyGlobalRankingScoreMethodCache.put_cache(
            Gs2Ranking2VerifyGlobalRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2VerifyGlobalRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyGlobalRankingScoreByUserId":
        Gs2Ranking2VerifyGlobalRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2VerifyGlobalRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2VerifyGlobalRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingReceivedRewards":
        Gs2Ranking2DescribeGlobalRankingReceivedRewardsMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingReceivedRewardsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingReceivedRewardsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingReceivedRewardsByUserId":
        Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingReceivedRewardsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGlobalRankingReceivedReward":
        Gs2Ranking2CreateGlobalRankingReceivedRewardMethodCache.put_cache(
            Gs2Ranking2CreateGlobalRankingReceivedRewardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateGlobalRankingReceivedRewardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGlobalRankingReceivedRewardByUserId":
        Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateGlobalRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveGlobalRankingReceivedReward":
        Gs2Ranking2ReceiveGlobalRankingReceivedRewardMethodCache.put_cache(
            Gs2Ranking2ReceiveGlobalRankingReceivedRewardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2ReceiveGlobalRankingReceivedRewardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveGlobalRankingReceivedRewardByUserId":
        Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2ReceiveGlobalRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingReceivedReward":
        Gs2Ranking2GetGlobalRankingReceivedRewardMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingReceivedRewardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingReceivedRewardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingReceivedRewardByUserId":
        Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGlobalRankingReceivedRewardByUserId":
        Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteGlobalRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankings":
        Gs2Ranking2DescribeGlobalRankingsMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGlobalRankingsByUserId":
        Gs2Ranking2DescribeGlobalRankingsByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeGlobalRankingsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeGlobalRankingsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRanking":
        Gs2Ranking2GetGlobalRankingMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGlobalRankingByUserId":
        Gs2Ranking2GetGlobalRankingByUserIdMethodCache.put_cache(
            Gs2Ranking2GetGlobalRankingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetGlobalRankingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingModels":
        Gs2Ranking2DescribeClusterRankingModelsMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingModel":
        Gs2Ranking2GetClusterRankingModelMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingModelMasters":
        Gs2Ranking2DescribeClusterRankingModelMastersMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createClusterRankingModelMaster":
        Gs2Ranking2CreateClusterRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2CreateClusterRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateClusterRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingModelMaster":
        Gs2Ranking2GetClusterRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateClusterRankingModelMaster":
        Gs2Ranking2UpdateClusterRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2UpdateClusterRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2UpdateClusterRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteClusterRankingModelMaster":
        Gs2Ranking2DeleteClusterRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2DeleteClusterRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteClusterRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingScores":
        Gs2Ranking2DescribeClusterRankingScoresMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingScoresResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingScoresRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingScoresByUserId":
        Gs2Ranking2DescribeClusterRankingScoresByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingScoresByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingScoresByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putClusterRankingScore":
        Gs2Ranking2PutClusterRankingScoreMethodCache.put_cache(
            Gs2Ranking2PutClusterRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PutClusterRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putClusterRankingScoreByUserId":
        Gs2Ranking2PutClusterRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2PutClusterRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PutClusterRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingScore":
        Gs2Ranking2GetClusterRankingScoreMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingScoreByUserId":
        Gs2Ranking2GetClusterRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteClusterRankingScoreByUserId":
        Gs2Ranking2DeleteClusterRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2DeleteClusterRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteClusterRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyClusterRankingScore":
        Gs2Ranking2VerifyClusterRankingScoreMethodCache.put_cache(
            Gs2Ranking2VerifyClusterRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2VerifyClusterRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifyClusterRankingScoreByUserId":
        Gs2Ranking2VerifyClusterRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2VerifyClusterRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2VerifyClusterRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingReceivedRewards":
        Gs2Ranking2DescribeClusterRankingReceivedRewardsMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingReceivedRewardsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingReceivedRewardsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingReceivedRewardsByUserId":
        Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingReceivedRewardsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createClusterRankingReceivedReward":
        Gs2Ranking2CreateClusterRankingReceivedRewardMethodCache.put_cache(
            Gs2Ranking2CreateClusterRankingReceivedRewardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateClusterRankingReceivedRewardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createClusterRankingReceivedRewardByUserId":
        Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateClusterRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveClusterRankingReceivedReward":
        Gs2Ranking2ReceiveClusterRankingReceivedRewardMethodCache.put_cache(
            Gs2Ranking2ReceiveClusterRankingReceivedRewardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2ReceiveClusterRankingReceivedRewardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveClusterRankingReceivedRewardByUserId":
        Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2ReceiveClusterRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingReceivedReward":
        Gs2Ranking2GetClusterRankingReceivedRewardMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingReceivedRewardResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingReceivedRewardRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingReceivedRewardByUserId":
        Gs2Ranking2GetClusterRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteClusterRankingReceivedRewardByUserId":
        Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdMethodCache.put_cache(
            Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteClusterRankingReceivedRewardByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankings":
        Gs2Ranking2DescribeClusterRankingsMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeClusterRankingsByUserId":
        Gs2Ranking2DescribeClusterRankingsByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeClusterRankingsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeClusterRankingsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRanking":
        Gs2Ranking2GetClusterRankingMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getClusterRankingByUserId":
        Gs2Ranking2GetClusterRankingByUserIdMethodCache.put_cache(
            Gs2Ranking2GetClusterRankingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetClusterRankingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribeRankingModels":
        Gs2Ranking2DescribeSubscribeRankingModelsMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribeRankingModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribeRankingModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeRankingModel":
        Gs2Ranking2GetSubscribeRankingModelMethodCache.put_cache(
            Gs2Ranking2GetSubscribeRankingModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRankingModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribeRankingModelMasters":
        Gs2Ranking2DescribeSubscribeRankingModelMastersMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribeRankingModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribeRankingModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSubscribeRankingModelMaster":
        Gs2Ranking2CreateSubscribeRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2CreateSubscribeRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2CreateSubscribeRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeRankingModelMaster":
        Gs2Ranking2GetSubscribeRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2GetSubscribeRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSubscribeRankingModelMaster":
        Gs2Ranking2UpdateSubscribeRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2UpdateSubscribeRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2UpdateSubscribeRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSubscribeRankingModelMaster":
        Gs2Ranking2DeleteSubscribeRankingModelMasterMethodCache.put_cache(
            Gs2Ranking2DeleteSubscribeRankingModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteSubscribeRankingModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribes":
        Gs2Ranking2DescribeSubscribesMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribesByUserId":
        Gs2Ranking2DescribeSubscribesByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addSubscribe":
        Gs2Ranking2AddSubscribeMethodCache.put_cache(
            Gs2Ranking2AddSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2AddSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "addSubscribeByUserId":
        Gs2Ranking2AddSubscribeByUserIdMethodCache.put_cache(
            Gs2Ranking2AddSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2AddSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribeRankingScores":
        Gs2Ranking2DescribeSubscribeRankingScoresMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribeRankingScoresResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribeRankingScoresRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribeRankingScoresByUserId":
        Gs2Ranking2DescribeSubscribeRankingScoresByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribeRankingScoresByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribeRankingScoresByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putSubscribeRankingScore":
        Gs2Ranking2PutSubscribeRankingScoreMethodCache.put_cache(
            Gs2Ranking2PutSubscribeRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PutSubscribeRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putSubscribeRankingScoreByUserId":
        Gs2Ranking2PutSubscribeRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2PutSubscribeRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PutSubscribeRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeRankingScore":
        Gs2Ranking2GetSubscribeRankingScoreMethodCache.put_cache(
            Gs2Ranking2GetSubscribeRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeRankingScoreByUserId":
        Gs2Ranking2GetSubscribeRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2GetSubscribeRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSubscribeRankingScoreByUserId":
        Gs2Ranking2DeleteSubscribeRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2DeleteSubscribeRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteSubscribeRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifySubscribeRankingScore":
        Gs2Ranking2VerifySubscribeRankingScoreMethodCache.put_cache(
            Gs2Ranking2VerifySubscribeRankingScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2VerifySubscribeRankingScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "verifySubscribeRankingScoreByUserId":
        Gs2Ranking2VerifySubscribeRankingScoreByUserIdMethodCache.put_cache(
            Gs2Ranking2VerifySubscribeRankingScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2VerifySubscribeRankingScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribeRankings":
        Gs2Ranking2DescribeSubscribeRankingsMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribeRankingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribeRankingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribeRankingsByUserId":
        Gs2Ranking2DescribeSubscribeRankingsByUserIdMethodCache.put_cache(
            Gs2Ranking2DescribeSubscribeRankingsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DescribeSubscribeRankingsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeRanking":
        Gs2Ranking2GetSubscribeRankingMethodCache.put_cache(
            Gs2Ranking2GetSubscribeRankingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRankingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeRankingByUserId":
        Gs2Ranking2GetSubscribeRankingByUserIdMethodCache.put_cache(
            Gs2Ranking2GetSubscribeRankingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRankingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2Ranking2ExportMasterMethodCache.put_cache(
            Gs2Ranking2ExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2ExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentRankingMaster":
        Gs2Ranking2GetCurrentRankingMasterMethodCache.put_cache(
            Gs2Ranking2GetCurrentRankingMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetCurrentRankingMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentRankingMaster":
        Gs2Ranking2PreUpdateCurrentRankingMasterMethodCache.put_cache(
            Gs2Ranking2PreUpdateCurrentRankingMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2PreUpdateCurrentRankingMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRankingMaster":
        Gs2Ranking2UpdateCurrentRankingMasterMethodCache.put_cache(
            Gs2Ranking2UpdateCurrentRankingMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2UpdateCurrentRankingMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRankingMasterFromGitHub":
        Gs2Ranking2UpdateCurrentRankingMasterFromGitHubMethodCache.put_cache(
            Gs2Ranking2UpdateCurrentRankingMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2UpdateCurrentRankingMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribe":
        Gs2Ranking2GetSubscribeMethodCache.put_cache(
            Gs2Ranking2GetSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeByUserId":
        Gs2Ranking2GetSubscribeByUserIdMethodCache.put_cache(
            Gs2Ranking2GetSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2GetSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSubscribe":
        Gs2Ranking2DeleteSubscribeMethodCache.put_cache(
            Gs2Ranking2DeleteSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSubscribeByUserId":
        Gs2Ranking2DeleteSubscribeByUserIdMethodCache.put_cache(
            Gs2Ranking2DeleteSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2Ranking2DeleteSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass