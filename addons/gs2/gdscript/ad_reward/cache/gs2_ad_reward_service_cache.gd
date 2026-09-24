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
class_name Gs2AdRewardServiceCache
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
    if kind == "point":
        var item = Gs2AdRewardPoint.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2AdRewardPointCache.put_user_data(
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
    if kind == "point":
        cache.set_list_cached("Gs2AdRewardPoint", parent_key)
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
        Gs2AdRewardDescribeNamespacesMethodCache.put_cache(
            Gs2AdRewardDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2AdRewardCreateNamespaceMethodCache.put_cache(
            Gs2AdRewardCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2AdRewardGetNamespaceStatusMethodCache.put_cache(
            Gs2AdRewardGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2AdRewardGetNamespaceMethodCache.put_cache(
            Gs2AdRewardGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2AdRewardUpdateNamespaceMethodCache.put_cache(
            Gs2AdRewardUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2AdRewardDeleteNamespaceMethodCache.put_cache(
            Gs2AdRewardDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2AdRewardGetServiceVersionMethodCache.put_cache(
            Gs2AdRewardGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2AdRewardDumpUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2AdRewardCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2AdRewardCleanUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2AdRewardCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2AdRewardPrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardPrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardPrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2AdRewardImportUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2AdRewardCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2AdRewardCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPoint":
        Gs2AdRewardGetPointMethodCache.put_cache(
            Gs2AdRewardGetPointResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardGetPointRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getPointByUserId":
        Gs2AdRewardGetPointByUserIdMethodCache.put_cache(
            Gs2AdRewardGetPointByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardGetPointByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "acquirePointByUserId":
        Gs2AdRewardAcquirePointByUserIdMethodCache.put_cache(
            Gs2AdRewardAcquirePointByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardAcquirePointByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumePoint":
        Gs2AdRewardConsumePointMethodCache.put_cache(
            Gs2AdRewardConsumePointResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardConsumePointRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "consumePointByUserId":
        Gs2AdRewardConsumePointByUserIdMethodCache.put_cache(
            Gs2AdRewardConsumePointByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardConsumePointByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deletePointByUserId":
        Gs2AdRewardDeletePointByUserIdMethodCache.put_cache(
            Gs2AdRewardDeletePointByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2AdRewardDeletePointByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass