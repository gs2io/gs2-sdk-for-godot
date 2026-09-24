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
class_name Gs2DatastoreServiceCache
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
    if kind == "dataObject":
        var item = Gs2DatastoreDataObject.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2DatastoreDataObjectCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    if kind == "dataObjectHistory":
        var item = Gs2DatastoreDataObjectHistory.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2DatastoreDataObjectHistoryCache.put_user_data(
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
    if kind == "dataObject":
        cache.set_list_cached("Gs2DatastoreDataObject", parent_key)
        return true
    if kind == "dataObjectHistory":
        cache.set_list_cached("Gs2DatastoreDataObjectHistory", parent_key)
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
        Gs2DatastoreDescribeNamespacesMethodCache.put_cache(
            Gs2DatastoreDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2DatastoreCreateNamespaceMethodCache.put_cache(
            Gs2DatastoreCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2DatastoreGetNamespaceStatusMethodCache.put_cache(
            Gs2DatastoreGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2DatastoreGetNamespaceMethodCache.put_cache(
            Gs2DatastoreGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2DatastoreUpdateNamespaceMethodCache.put_cache(
            Gs2DatastoreUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2DatastoreDeleteNamespaceMethodCache.put_cache(
            Gs2DatastoreDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2DatastoreGetServiceVersionMethodCache.put_cache(
            Gs2DatastoreGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2DatastoreDumpUserDataByUserIdMethodCache.put_cache(
            Gs2DatastoreDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2DatastoreCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2DatastoreCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2DatastoreCleanUserDataByUserIdMethodCache.put_cache(
            Gs2DatastoreCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2DatastoreCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2DatastoreCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2DatastorePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2DatastorePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2DatastoreImportUserDataByUserIdMethodCache.put_cache(
            Gs2DatastoreImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2DatastoreCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2DatastoreCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDataObjects":
        Gs2DatastoreDescribeDataObjectsMethodCache.put_cache(
            Gs2DatastoreDescribeDataObjectsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDescribeDataObjectsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDataObjectsByUserId":
        Gs2DatastoreDescribeDataObjectsByUserIdMethodCache.put_cache(
            Gs2DatastoreDescribeDataObjectsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDescribeDataObjectsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareUpload":
        Gs2DatastorePrepareUploadMethodCache.put_cache(
            Gs2DatastorePrepareUploadResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareUploadRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareUploadByUserId":
        Gs2DatastorePrepareUploadByUserIdMethodCache.put_cache(
            Gs2DatastorePrepareUploadByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareUploadByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateDataObject":
        Gs2DatastoreUpdateDataObjectMethodCache.put_cache(
            Gs2DatastoreUpdateDataObjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreUpdateDataObjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateDataObjectByUserId":
        Gs2DatastoreUpdateDataObjectByUserIdMethodCache.put_cache(
            Gs2DatastoreUpdateDataObjectByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreUpdateDataObjectByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareReUpload":
        Gs2DatastorePrepareReUploadMethodCache.put_cache(
            Gs2DatastorePrepareReUploadResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareReUploadRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareReUploadByUserId":
        Gs2DatastorePrepareReUploadByUserIdMethodCache.put_cache(
            Gs2DatastorePrepareReUploadByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareReUploadByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doneUpload":
        Gs2DatastoreDoneUploadMethodCache.put_cache(
            Gs2DatastoreDoneUploadResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDoneUploadRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "doneUploadByUserId":
        Gs2DatastoreDoneUploadByUserIdMethodCache.put_cache(
            Gs2DatastoreDoneUploadByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDoneUploadByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteDataObject":
        Gs2DatastoreDeleteDataObjectMethodCache.put_cache(
            Gs2DatastoreDeleteDataObjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDeleteDataObjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteDataObjectByUserId":
        Gs2DatastoreDeleteDataObjectByUserIdMethodCache.put_cache(
            Gs2DatastoreDeleteDataObjectByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDeleteDataObjectByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownload":
        Gs2DatastorePrepareDownloadMethodCache.put_cache(
            Gs2DatastorePrepareDownloadResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadByUserId":
        Gs2DatastorePrepareDownloadByUserIdMethodCache.put_cache(
            Gs2DatastorePrepareDownloadByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadByGeneration":
        Gs2DatastorePrepareDownloadByGenerationMethodCache.put_cache(
            Gs2DatastorePrepareDownloadByGenerationResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadByGenerationRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadByGenerationAndUserId":
        Gs2DatastorePrepareDownloadByGenerationAndUserIdMethodCache.put_cache(
            Gs2DatastorePrepareDownloadByGenerationAndUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadByGenerationAndUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadOwnData":
        Gs2DatastorePrepareDownloadOwnDataMethodCache.put_cache(
            Gs2DatastorePrepareDownloadOwnDataResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadOwnDataRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadByUserIdAndDataObjectName":
        Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameMethodCache.put_cache(
            Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadOwnDataByGeneration":
        Gs2DatastorePrepareDownloadOwnDataByGenerationMethodCache.put_cache(
            Gs2DatastorePrepareDownloadOwnDataByGenerationResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadOwnDataByGenerationRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareDownloadByUserIdAndDataObjectNameAndGeneration":
        Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationMethodCache.put_cache(
            Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastorePrepareDownloadByUserIdAndDataObjectNameAndGenerationRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "restoreDataObject":
        Gs2DatastoreRestoreDataObjectMethodCache.put_cache(
            Gs2DatastoreRestoreDataObjectResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreRestoreDataObjectRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDataObjectHistories":
        Gs2DatastoreDescribeDataObjectHistoriesMethodCache.put_cache(
            Gs2DatastoreDescribeDataObjectHistoriesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDescribeDataObjectHistoriesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeDataObjectHistoriesByUserId":
        Gs2DatastoreDescribeDataObjectHistoriesByUserIdMethodCache.put_cache(
            Gs2DatastoreDescribeDataObjectHistoriesByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreDescribeDataObjectHistoriesByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDataObjectHistory":
        Gs2DatastoreGetDataObjectHistoryMethodCache.put_cache(
            Gs2DatastoreGetDataObjectHistoryResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreGetDataObjectHistoryRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getDataObjectHistoryByUserId":
        Gs2DatastoreGetDataObjectHistoryByUserIdMethodCache.put_cache(
            Gs2DatastoreGetDataObjectHistoryByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2DatastoreGetDataObjectHistoryByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass