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
class_name Gs2SeasonRatingServiceCache
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
    return null


# 一括取得で入れた kind の親キーに「リストが揃った印」を立てる（Describe のイテレータがサーバーへ出なくなる）。
static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    return false


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2SeasonRatingDescribeNamespacesMethodCache.put_cache(
            Gs2SeasonRatingDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2SeasonRatingCreateNamespaceMethodCache.put_cache(
            Gs2SeasonRatingCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2SeasonRatingGetNamespaceStatusMethodCache.put_cache(
            Gs2SeasonRatingGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2SeasonRatingGetNamespaceMethodCache.put_cache(
            Gs2SeasonRatingGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2SeasonRatingUpdateNamespaceMethodCache.put_cache(
            Gs2SeasonRatingUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2SeasonRatingDeleteNamespaceMethodCache.put_cache(
            Gs2SeasonRatingDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2SeasonRatingGetServiceVersionMethodCache.put_cache(
            Gs2SeasonRatingGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2SeasonRatingDumpUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2SeasonRatingCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2SeasonRatingCleanUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2SeasonRatingCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2SeasonRatingPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2SeasonRatingImportUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2SeasonRatingCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2SeasonRatingCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeMatchSessions":
        Gs2SeasonRatingDescribeMatchSessionsMethodCache.put_cache(
            Gs2SeasonRatingDescribeMatchSessionsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDescribeMatchSessionsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createMatchSession":
        Gs2SeasonRatingCreateMatchSessionMethodCache.put_cache(
            Gs2SeasonRatingCreateMatchSessionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCreateMatchSessionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMatchSession":
        Gs2SeasonRatingGetMatchSessionMethodCache.put_cache(
            Gs2SeasonRatingGetMatchSessionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetMatchSessionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMatchSession":
        Gs2SeasonRatingDeleteMatchSessionMethodCache.put_cache(
            Gs2SeasonRatingDeleteMatchSessionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDeleteMatchSessionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSeasonModelMasters":
        Gs2SeasonRatingDescribeSeasonModelMastersMethodCache.put_cache(
            Gs2SeasonRatingDescribeSeasonModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDescribeSeasonModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createSeasonModelMaster":
        Gs2SeasonRatingCreateSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingCreateSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCreateSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSeasonModelMaster":
        Gs2SeasonRatingGetSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingGetSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateSeasonModelMaster":
        Gs2SeasonRatingUpdateSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingUpdateSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingUpdateSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteSeasonModelMaster":
        Gs2SeasonRatingDeleteSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingDeleteSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDeleteSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeSeasonModels":
        Gs2SeasonRatingDescribeSeasonModelsMethodCache.put_cache(
            Gs2SeasonRatingDescribeSeasonModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingDescribeSeasonModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getSeasonModel":
        Gs2SeasonRatingGetSeasonModelMethodCache.put_cache(
            Gs2SeasonRatingGetSeasonModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetSeasonModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2SeasonRatingExportMasterMethodCache.put_cache(
            Gs2SeasonRatingExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentSeasonModelMaster":
        Gs2SeasonRatingGetCurrentSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingGetCurrentSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetCurrentSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentSeasonModelMaster":
        Gs2SeasonRatingPreUpdateCurrentSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingPreUpdateCurrentSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingPreUpdateCurrentSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentSeasonModelMaster":
        Gs2SeasonRatingUpdateCurrentSeasonModelMasterMethodCache.put_cache(
            Gs2SeasonRatingUpdateCurrentSeasonModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingUpdateCurrentSeasonModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentSeasonModelMasterFromGitHub":
        Gs2SeasonRatingUpdateCurrentSeasonModelMasterFromGitHubMethodCache.put_cache(
            Gs2SeasonRatingUpdateCurrentSeasonModelMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingUpdateCurrentSeasonModelMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBallot":
        Gs2SeasonRatingGetBallotMethodCache.put_cache(
            Gs2SeasonRatingGetBallotResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetBallotRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBallotByUserId":
        Gs2SeasonRatingGetBallotByUserIdMethodCache.put_cache(
            Gs2SeasonRatingGetBallotByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingGetBallotByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "vote":
        Gs2SeasonRatingVoteMethodCache.put_cache(
            Gs2SeasonRatingVoteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingVoteRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "voteMultiple":
        Gs2SeasonRatingVoteMultipleMethodCache.put_cache(
            Gs2SeasonRatingVoteMultipleResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingVoteMultipleRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "commitVote":
        Gs2SeasonRatingCommitVoteMethodCache.put_cache(
            Gs2SeasonRatingCommitVoteResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SeasonRatingCommitVoteRequest.from_dict(_parse(request_payload))
        )
        return
    pass