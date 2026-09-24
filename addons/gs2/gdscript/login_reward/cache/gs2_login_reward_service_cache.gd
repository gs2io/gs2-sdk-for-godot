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
class_name Gs2LoginRewardServiceCache
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
    if kind == "receiveStatus":
        var item = Gs2LoginRewardReceiveStatus.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2LoginRewardReceiveStatusCache.put_user_data(
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
    if kind == "receiveStatus":
        cache.set_list_cached("Gs2LoginRewardReceiveStatus", parent_key)
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
        Gs2LoginRewardDescribeNamespacesMethodCache.put_cache(
            Gs2LoginRewardDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2LoginRewardCreateNamespaceMethodCache.put_cache(
            Gs2LoginRewardCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2LoginRewardGetNamespaceStatusMethodCache.put_cache(
            Gs2LoginRewardGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2LoginRewardGetNamespaceMethodCache.put_cache(
            Gs2LoginRewardGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2LoginRewardUpdateNamespaceMethodCache.put_cache(
            Gs2LoginRewardUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2LoginRewardDeleteNamespaceMethodCache.put_cache(
            Gs2LoginRewardDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2LoginRewardGetServiceVersionMethodCache.put_cache(
            Gs2LoginRewardGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2LoginRewardDumpUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2LoginRewardCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2LoginRewardCleanUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2LoginRewardCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2LoginRewardPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2LoginRewardImportUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2LoginRewardCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2LoginRewardCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBonusModelMasters":
        Gs2LoginRewardDescribeBonusModelMastersMethodCache.put_cache(
            Gs2LoginRewardDescribeBonusModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDescribeBonusModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createBonusModelMaster":
        Gs2LoginRewardCreateBonusModelMasterMethodCache.put_cache(
            Gs2LoginRewardCreateBonusModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardCreateBonusModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBonusModelMaster":
        Gs2LoginRewardGetBonusModelMasterMethodCache.put_cache(
            Gs2LoginRewardGetBonusModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetBonusModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateBonusModelMaster":
        Gs2LoginRewardUpdateBonusModelMasterMethodCache.put_cache(
            Gs2LoginRewardUpdateBonusModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardUpdateBonusModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteBonusModelMaster":
        Gs2LoginRewardDeleteBonusModelMasterMethodCache.put_cache(
            Gs2LoginRewardDeleteBonusModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDeleteBonusModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2LoginRewardExportMasterMethodCache.put_cache(
            Gs2LoginRewardExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentBonusMaster":
        Gs2LoginRewardGetCurrentBonusMasterMethodCache.put_cache(
            Gs2LoginRewardGetCurrentBonusMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetCurrentBonusMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentBonusMaster":
        Gs2LoginRewardPreUpdateCurrentBonusMasterMethodCache.put_cache(
            Gs2LoginRewardPreUpdateCurrentBonusMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardPreUpdateCurrentBonusMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentBonusMaster":
        Gs2LoginRewardUpdateCurrentBonusMasterMethodCache.put_cache(
            Gs2LoginRewardUpdateCurrentBonusMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardUpdateCurrentBonusMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentBonusMasterFromGitHub":
        Gs2LoginRewardUpdateCurrentBonusMasterFromGitHubMethodCache.put_cache(
            Gs2LoginRewardUpdateCurrentBonusMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardUpdateCurrentBonusMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeBonusModels":
        Gs2LoginRewardDescribeBonusModelsMethodCache.put_cache(
            Gs2LoginRewardDescribeBonusModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDescribeBonusModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getBonusModel":
        Gs2LoginRewardGetBonusModelMethodCache.put_cache(
            Gs2LoginRewardGetBonusModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetBonusModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receive":
        Gs2LoginRewardReceiveMethodCache.put_cache(
            Gs2LoginRewardReceiveResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardReceiveRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "receiveByUserId":
        Gs2LoginRewardReceiveByUserIdMethodCache.put_cache(
            Gs2LoginRewardReceiveByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardReceiveByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "missedReceive":
        Gs2LoginRewardMissedReceiveMethodCache.put_cache(
            Gs2LoginRewardMissedReceiveResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardMissedReceiveRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "missedReceiveByUserId":
        Gs2LoginRewardMissedReceiveByUserIdMethodCache.put_cache(
            Gs2LoginRewardMissedReceiveByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardMissedReceiveByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceiveStatuses":
        Gs2LoginRewardDescribeReceiveStatusesMethodCache.put_cache(
            Gs2LoginRewardDescribeReceiveStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDescribeReceiveStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeReceiveStatusesByUserId":
        Gs2LoginRewardDescribeReceiveStatusesByUserIdMethodCache.put_cache(
            Gs2LoginRewardDescribeReceiveStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDescribeReceiveStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceiveStatus":
        Gs2LoginRewardGetReceiveStatusMethodCache.put_cache(
            Gs2LoginRewardGetReceiveStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetReceiveStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getReceiveStatusByUserId":
        Gs2LoginRewardGetReceiveStatusByUserIdMethodCache.put_cache(
            Gs2LoginRewardGetReceiveStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardGetReceiveStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteReceiveStatusByUserId":
        Gs2LoginRewardDeleteReceiveStatusByUserIdMethodCache.put_cache(
            Gs2LoginRewardDeleteReceiveStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardDeleteReceiveStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "markReceived":
        Gs2LoginRewardMarkReceivedMethodCache.put_cache(
            Gs2LoginRewardMarkReceivedResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardMarkReceivedRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "markReceivedByUserId":
        Gs2LoginRewardMarkReceivedByUserIdMethodCache.put_cache(
            Gs2LoginRewardMarkReceivedByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardMarkReceivedByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unmarkReceivedByUserId":
        Gs2LoginRewardUnmarkReceivedByUserIdMethodCache.put_cache(
            Gs2LoginRewardUnmarkReceivedByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LoginRewardUnmarkReceivedByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass