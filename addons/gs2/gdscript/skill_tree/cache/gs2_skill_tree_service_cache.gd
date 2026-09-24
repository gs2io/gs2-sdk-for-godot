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
class_name Gs2SkillTreeServiceCache
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
    if kind == "status":
        var item = Gs2SkillTreeStatus.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2SkillTreeStatusCache.put_user_data(
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
    if kind == "status":
        cache.set_list_cached("Gs2SkillTreeStatus", parent_key)
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
        Gs2SkillTreeDescribeNamespacesMethodCache.put_cache(
            Gs2SkillTreeDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2SkillTreeCreateNamespaceMethodCache.put_cache(
            Gs2SkillTreeCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2SkillTreeGetNamespaceStatusMethodCache.put_cache(
            Gs2SkillTreeGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2SkillTreeGetNamespaceMethodCache.put_cache(
            Gs2SkillTreeGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2SkillTreeUpdateNamespaceMethodCache.put_cache(
            Gs2SkillTreeUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2SkillTreeDeleteNamespaceMethodCache.put_cache(
            Gs2SkillTreeDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2SkillTreeGetServiceVersionMethodCache.put_cache(
            Gs2SkillTreeGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2SkillTreeDumpUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreeDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2SkillTreeCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreeCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2SkillTreeCleanUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreeCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2SkillTreeCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreeCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2SkillTreePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2SkillTreeImportUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreeImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2SkillTreeCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2SkillTreeCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeNodeModels":
        Gs2SkillTreeDescribeNodeModelsMethodCache.put_cache(
            Gs2SkillTreeDescribeNodeModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDescribeNodeModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNodeModel":
        Gs2SkillTreeGetNodeModelMethodCache.put_cache(
            Gs2SkillTreeGetNodeModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetNodeModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeNodeModelMasters":
        Gs2SkillTreeDescribeNodeModelMastersMethodCache.put_cache(
            Gs2SkillTreeDescribeNodeModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDescribeNodeModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNodeModelMaster":
        Gs2SkillTreeCreateNodeModelMasterMethodCache.put_cache(
            Gs2SkillTreeCreateNodeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeCreateNodeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNodeModelMaster":
        Gs2SkillTreeGetNodeModelMasterMethodCache.put_cache(
            Gs2SkillTreeGetNodeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetNodeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNodeModelMaster":
        Gs2SkillTreeUpdateNodeModelMasterMethodCache.put_cache(
            Gs2SkillTreeUpdateNodeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeUpdateNodeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNodeModelMaster":
        Gs2SkillTreeDeleteNodeModelMasterMethodCache.put_cache(
            Gs2SkillTreeDeleteNodeModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDeleteNodeModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "markReleaseByUserId":
        Gs2SkillTreeMarkReleaseByUserIdMethodCache.put_cache(
            Gs2SkillTreeMarkReleaseByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeMarkReleaseByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "release":
        Gs2SkillTreeReleaseMethodCache.put_cache(
            Gs2SkillTreeReleaseResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeReleaseRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "releaseByUserId":
        Gs2SkillTreeReleaseByUserIdMethodCache.put_cache(
            Gs2SkillTreeReleaseByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeReleaseByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "markRestrain":
        Gs2SkillTreeMarkRestrainMethodCache.put_cache(
            Gs2SkillTreeMarkRestrainResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeMarkRestrainRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "markRestrainByUserId":
        Gs2SkillTreeMarkRestrainByUserIdMethodCache.put_cache(
            Gs2SkillTreeMarkRestrainByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeMarkRestrainByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "restrain":
        Gs2SkillTreeRestrainMethodCache.put_cache(
            Gs2SkillTreeRestrainResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeRestrainRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "restrainByUserId":
        Gs2SkillTreeRestrainByUserIdMethodCache.put_cache(
            Gs2SkillTreeRestrainByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeRestrainByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatuses":
        Gs2SkillTreeDescribeStatusesMethodCache.put_cache(
            Gs2SkillTreeDescribeStatusesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDescribeStatusesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeStatusesByUserId":
        Gs2SkillTreeDescribeStatusesByUserIdMethodCache.put_cache(
            Gs2SkillTreeDescribeStatusesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeDescribeStatusesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatus":
        Gs2SkillTreeGetStatusMethodCache.put_cache(
            Gs2SkillTreeGetStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getStatusByUserId":
        Gs2SkillTreeGetStatusByUserIdMethodCache.put_cache(
            Gs2SkillTreeGetStatusByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetStatusByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "reset":
        Gs2SkillTreeResetMethodCache.put_cache(
            Gs2SkillTreeResetResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeResetRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "resetByUserId":
        Gs2SkillTreeResetByUserIdMethodCache.put_cache(
            Gs2SkillTreeResetByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeResetByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2SkillTreeExportMasterMethodCache.put_cache(
            Gs2SkillTreeExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentTreeMaster":
        Gs2SkillTreeGetCurrentTreeMasterMethodCache.put_cache(
            Gs2SkillTreeGetCurrentTreeMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeGetCurrentTreeMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentTreeMaster":
        Gs2SkillTreePreUpdateCurrentTreeMasterMethodCache.put_cache(
            Gs2SkillTreePreUpdateCurrentTreeMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreePreUpdateCurrentTreeMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentTreeMaster":
        Gs2SkillTreeUpdateCurrentTreeMasterMethodCache.put_cache(
            Gs2SkillTreeUpdateCurrentTreeMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeUpdateCurrentTreeMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentTreeMasterFromGitHub":
        Gs2SkillTreeUpdateCurrentTreeMasterFromGitHubMethodCache.put_cache(
            Gs2SkillTreeUpdateCurrentTreeMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2SkillTreeUpdateCurrentTreeMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass