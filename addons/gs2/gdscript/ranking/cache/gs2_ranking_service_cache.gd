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
class_name Gs2RankingServiceCache
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
    if kind == "score":
        var item = Gs2RankingScore.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2RankingScoreCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "subscribeUser":
        var item = Gs2RankingSubscribeUser.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2RankingSubscribeUserCache.put_user_data(
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
    if kind == "score":
        cache.set_list_cached("Gs2RankingScore", parent_key)
        return true
    if kind == "subscribeUser":
        cache.set_list_cached("Gs2RankingSubscribeUser", parent_key)
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
        Gs2RankingDescribeNamespacesMethodCache.put_cache(
            Gs2RankingDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2RankingCreateNamespaceMethodCache.put_cache(
            Gs2RankingCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2RankingGetNamespaceStatusMethodCache.put_cache(
            Gs2RankingGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2RankingGetNamespaceMethodCache.put_cache(
            Gs2RankingGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2RankingUpdateNamespaceMethodCache.put_cache(
            Gs2RankingUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2RankingDeleteNamespaceMethodCache.put_cache(
            Gs2RankingDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2RankingGetServiceVersionMethodCache.put_cache(
            Gs2RankingGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2RankingDumpUserDataByUserIdMethodCache.put_cache(
            Gs2RankingDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2RankingCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2RankingCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2RankingCleanUserDataByUserIdMethodCache.put_cache(
            Gs2RankingCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2RankingCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2RankingCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2RankingPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2RankingPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2RankingImportUserDataByUserIdMethodCache.put_cache(
            Gs2RankingImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2RankingCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2RankingCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCategoryModels":
        Gs2RankingDescribeCategoryModelsMethodCache.put_cache(
            Gs2RankingDescribeCategoryModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeCategoryModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCategoryModel":
        Gs2RankingGetCategoryModelMethodCache.put_cache(
            Gs2RankingGetCategoryModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetCategoryModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeCategoryModelMasters":
        Gs2RankingDescribeCategoryModelMastersMethodCache.put_cache(
            Gs2RankingDescribeCategoryModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeCategoryModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createCategoryModelMaster":
        Gs2RankingCreateCategoryModelMasterMethodCache.put_cache(
            Gs2RankingCreateCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCreateCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCategoryModelMaster":
        Gs2RankingGetCategoryModelMasterMethodCache.put_cache(
            Gs2RankingGetCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCategoryModelMaster":
        Gs2RankingUpdateCategoryModelMasterMethodCache.put_cache(
            Gs2RankingUpdateCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingUpdateCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteCategoryModelMaster":
        Gs2RankingDeleteCategoryModelMasterMethodCache.put_cache(
            Gs2RankingDeleteCategoryModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDeleteCategoryModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subscribe":
        Gs2RankingSubscribeMethodCache.put_cache(
            Gs2RankingSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "subscribeByUserId":
        Gs2RankingSubscribeByUserIdMethodCache.put_cache(
            Gs2RankingSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeScores":
        Gs2RankingDescribeScoresMethodCache.put_cache(
            Gs2RankingDescribeScoresResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeScoresRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeScoresByUserId":
        Gs2RankingDescribeScoresByUserIdMethodCache.put_cache(
            Gs2RankingDescribeScoresByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeScoresByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getScore":
        Gs2RankingGetScoreMethodCache.put_cache(
            Gs2RankingGetScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getScoreByUserId":
        Gs2RankingGetScoreByUserIdMethodCache.put_cache(
            Gs2RankingGetScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRankings":
        Gs2RankingDescribeRankingsMethodCache.put_cache(
            Gs2RankingDescribeRankingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeRankingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRankingssByUserId":
        Gs2RankingDescribeRankingssByUserIdMethodCache.put_cache(
            Gs2RankingDescribeRankingssByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeRankingssByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeNearRankings":
        Gs2RankingDescribeNearRankingsMethodCache.put_cache(
            Gs2RankingDescribeNearRankingsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeNearRankingsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRanking":
        Gs2RankingGetRankingMethodCache.put_cache(
            Gs2RankingGetRankingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetRankingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRankingByUserId":
        Gs2RankingGetRankingByUserIdMethodCache.put_cache(
            Gs2RankingGetRankingByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetRankingByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putScore":
        Gs2RankingPutScoreMethodCache.put_cache(
            Gs2RankingPutScoreResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingPutScoreRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "putScoreByUserId":
        Gs2RankingPutScoreByUserIdMethodCache.put_cache(
            Gs2RankingPutScoreByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingPutScoreByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "calcRanking":
        Gs2RankingCalcRankingMethodCache.put_cache(
            Gs2RankingCalcRankingResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingCalcRankingRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2RankingExportMasterMethodCache.put_cache(
            Gs2RankingExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentRankingMaster":
        Gs2RankingGetCurrentRankingMasterMethodCache.put_cache(
            Gs2RankingGetCurrentRankingMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetCurrentRankingMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentRankingMaster":
        Gs2RankingPreUpdateCurrentRankingMasterMethodCache.put_cache(
            Gs2RankingPreUpdateCurrentRankingMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingPreUpdateCurrentRankingMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRankingMaster":
        Gs2RankingUpdateCurrentRankingMasterMethodCache.put_cache(
            Gs2RankingUpdateCurrentRankingMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingUpdateCurrentRankingMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentRankingMasterFromGitHub":
        Gs2RankingUpdateCurrentRankingMasterFromGitHubMethodCache.put_cache(
            Gs2RankingUpdateCurrentRankingMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingUpdateCurrentRankingMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribe":
        Gs2RankingGetSubscribeMethodCache.put_cache(
            Gs2RankingGetSubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetSubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSubscribeByUserId":
        Gs2RankingGetSubscribeByUserIdMethodCache.put_cache(
            Gs2RankingGetSubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingGetSubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unsubscribe":
        Gs2RankingUnsubscribeMethodCache.put_cache(
            Gs2RankingUnsubscribeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingUnsubscribeRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unsubscribeByUserId":
        Gs2RankingUnsubscribeByUserIdMethodCache.put_cache(
            Gs2RankingUnsubscribeByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingUnsubscribeByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribesByCategoryName":
        Gs2RankingDescribeSubscribesByCategoryNameMethodCache.put_cache(
            Gs2RankingDescribeSubscribesByCategoryNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeSubscribesByCategoryNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSubscribesByCategoryNameAndUserId":
        Gs2RankingDescribeSubscribesByCategoryNameAndUserIdMethodCache.put_cache(
            Gs2RankingDescribeSubscribesByCategoryNameAndUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RankingDescribeSubscribesByCategoryNameAndUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass