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
class_name Gs2RealtimeServiceCache
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
        Gs2RealtimeDescribeNamespacesMethodCache.put_cache(
            Gs2RealtimeDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2RealtimeCreateNamespaceMethodCache.put_cache(
            Gs2RealtimeCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2RealtimeGetNamespaceStatusMethodCache.put_cache(
            Gs2RealtimeGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2RealtimeGetNamespaceMethodCache.put_cache(
            Gs2RealtimeGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2RealtimeUpdateNamespaceMethodCache.put_cache(
            Gs2RealtimeUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2RealtimeDeleteNamespaceMethodCache.put_cache(
            Gs2RealtimeDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "now":
        Gs2RealtimeNowMethodCache.put_cache(
            Gs2RealtimeNowResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeNowRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2RealtimeGetServiceVersionMethodCache.put_cache(
            Gs2RealtimeGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeRooms":
        Gs2RealtimeDescribeRoomsMethodCache.put_cache(
            Gs2RealtimeDescribeRoomsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeDescribeRoomsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "wantRoom":
        Gs2RealtimeWantRoomMethodCache.put_cache(
            Gs2RealtimeWantRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeWantRoomRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getRoom":
        Gs2RealtimeGetRoomMethodCache.put_cache(
            Gs2RealtimeGetRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeGetRoomRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteRoom":
        Gs2RealtimeDeleteRoomMethodCache.put_cache(
            Gs2RealtimeDeleteRoomResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2RealtimeDeleteRoomRequest.from_dict(_parse(request_payload))
        )
        return
    pass