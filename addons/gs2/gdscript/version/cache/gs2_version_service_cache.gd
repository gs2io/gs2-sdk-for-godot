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
class_name Gs2VersionServiceCache
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
    if kind == "acceptVersion":
        var item = Gs2VersionAcceptVersion.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2VersionAcceptVersionCache.put_user_data(
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
    if kind == "acceptVersion":
        cache.set_list_cached("Gs2VersionAcceptVersion", parent_key)
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
        Gs2VersionDescribeNamespacesMethodCache.put_cache(
            Gs2VersionDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2VersionCreateNamespaceMethodCache.put_cache(
            Gs2VersionCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2VersionGetNamespaceStatusMethodCache.put_cache(
            Gs2VersionGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2VersionGetNamespaceMethodCache.put_cache(
            Gs2VersionGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2VersionUpdateNamespaceMethodCache.put_cache(
            Gs2VersionUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2VersionDeleteNamespaceMethodCache.put_cache(
            Gs2VersionDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2VersionGetServiceVersionMethodCache.put_cache(
            Gs2VersionGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2VersionDumpUserDataByUserIdMethodCache.put_cache(
            Gs2VersionDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2VersionCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2VersionCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2VersionCleanUserDataByUserIdMethodCache.put_cache(
            Gs2VersionCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2VersionCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2VersionCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2VersionPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2VersionPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2VersionImportUserDataByUserIdMethodCache.put_cache(
            Gs2VersionImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2VersionCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2VersionCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeVersionModelMasters":
        Gs2VersionDescribeVersionModelMastersMethodCache.put_cache(
            Gs2VersionDescribeVersionModelMastersResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDescribeVersionModelMastersRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createVersionModelMaster":
        Gs2VersionCreateVersionModelMasterMethodCache.put_cache(
            Gs2VersionCreateVersionModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCreateVersionModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getVersionModelMaster":
        Gs2VersionGetVersionModelMasterMethodCache.put_cache(
            Gs2VersionGetVersionModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetVersionModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateVersionModelMaster":
        Gs2VersionUpdateVersionModelMasterMethodCache.put_cache(
            Gs2VersionUpdateVersionModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionUpdateVersionModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteVersionModelMaster":
        Gs2VersionDeleteVersionModelMasterMethodCache.put_cache(
            Gs2VersionDeleteVersionModelMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDeleteVersionModelMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeVersionModels":
        Gs2VersionDescribeVersionModelsMethodCache.put_cache(
            Gs2VersionDescribeVersionModelsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDescribeVersionModelsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getVersionModel":
        Gs2VersionGetVersionModelMethodCache.put_cache(
            Gs2VersionGetVersionModelResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetVersionModelRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAcceptVersions":
        Gs2VersionDescribeAcceptVersionsMethodCache.put_cache(
            Gs2VersionDescribeAcceptVersionsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDescribeAcceptVersionsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeAcceptVersionsByUserId":
        Gs2VersionDescribeAcceptVersionsByUserIdMethodCache.put_cache(
            Gs2VersionDescribeAcceptVersionsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDescribeAcceptVersionsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "accept":
        Gs2VersionAcceptMethodCache.put_cache(
            Gs2VersionAcceptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionAcceptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acceptByUserId":
        Gs2VersionAcceptByUserIdMethodCache.put_cache(
            Gs2VersionAcceptByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionAcceptByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "reject":
        Gs2VersionRejectMethodCache.put_cache(
            Gs2VersionRejectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionRejectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "rejectByUserId":
        Gs2VersionRejectByUserIdMethodCache.put_cache(
            Gs2VersionRejectByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionRejectByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAcceptVersion":
        Gs2VersionGetAcceptVersionMethodCache.put_cache(
            Gs2VersionGetAcceptVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetAcceptVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getAcceptVersionByUserId":
        Gs2VersionGetAcceptVersionByUserIdMethodCache.put_cache(
            Gs2VersionGetAcceptVersionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetAcceptVersionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAcceptVersion":
        Gs2VersionDeleteAcceptVersionMethodCache.put_cache(
            Gs2VersionDeleteAcceptVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDeleteAcceptVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteAcceptVersionByUserId":
        Gs2VersionDeleteAcceptVersionByUserIdMethodCache.put_cache(
            Gs2VersionDeleteAcceptVersionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionDeleteAcceptVersionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkVersion":
        Gs2VersionCheckVersionMethodCache.put_cache(
            Gs2VersionCheckVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCheckVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkVersionByUserId":
        Gs2VersionCheckVersionByUserIdMethodCache.put_cache(
            Gs2VersionCheckVersionByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCheckVersionByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "calculateSignature":
        Gs2VersionCalculateSignatureMethodCache.put_cache(
            Gs2VersionCalculateSignatureResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionCalculateSignatureRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "exportMaster":
        Gs2VersionExportMasterMethodCache.put_cache(
            Gs2VersionExportMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionExportMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getCurrentVersionMaster":
        Gs2VersionGetCurrentVersionMasterMethodCache.put_cache(
            Gs2VersionGetCurrentVersionMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionGetCurrentVersionMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "preUpdateCurrentVersionMaster":
        Gs2VersionPreUpdateCurrentVersionMasterMethodCache.put_cache(
            Gs2VersionPreUpdateCurrentVersionMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionPreUpdateCurrentVersionMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentVersionMaster":
        Gs2VersionUpdateCurrentVersionMasterMethodCache.put_cache(
            Gs2VersionUpdateCurrentVersionMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionUpdateCurrentVersionMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentVersionMasterFromGitHub":
        Gs2VersionUpdateCurrentVersionMasterFromGitHubMethodCache.put_cache(
            Gs2VersionUpdateCurrentVersionMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2VersionUpdateCurrentVersionMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    pass