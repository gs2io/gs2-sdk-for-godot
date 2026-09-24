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
class_name Gs2KeyServiceCache
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
        Gs2KeyDescribeNamespacesMethodCache.put_cache(
            Gs2KeyDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2KeyCreateNamespaceMethodCache.put_cache(
            Gs2KeyCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2KeyGetNamespaceStatusMethodCache.put_cache(
            Gs2KeyGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2KeyGetNamespaceMethodCache.put_cache(
            Gs2KeyGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2KeyUpdateNamespaceMethodCache.put_cache(
            Gs2KeyUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2KeyDeleteNamespaceMethodCache.put_cache(
            Gs2KeyDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2KeyGetServiceVersionMethodCache.put_cache(
            Gs2KeyGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeKeys":
        Gs2KeyDescribeKeysMethodCache.put_cache(
            Gs2KeyDescribeKeysResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDescribeKeysRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createKey":
        Gs2KeyCreateKeyMethodCache.put_cache(
            Gs2KeyCreateKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyCreateKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateKey":
        Gs2KeyUpdateKeyMethodCache.put_cache(
            Gs2KeyUpdateKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyUpdateKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getKey":
        Gs2KeyGetKeyMethodCache.put_cache(
            Gs2KeyGetKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyGetKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteKey":
        Gs2KeyDeleteKeyMethodCache.put_cache(
            Gs2KeyDeleteKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDeleteKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "encrypt":
        Gs2KeyEncryptMethodCache.put_cache(
            Gs2KeyEncryptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyEncryptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "decrypt":
        Gs2KeyDecryptMethodCache.put_cache(
            Gs2KeyDecryptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDecryptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeGitHubApiKeys":
        Gs2KeyDescribeGitHubApiKeysMethodCache.put_cache(
            Gs2KeyDescribeGitHubApiKeysResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDescribeGitHubApiKeysRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createGitHubApiKey":
        Gs2KeyCreateGitHubApiKeyMethodCache.put_cache(
            Gs2KeyCreateGitHubApiKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyCreateGitHubApiKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateGitHubApiKey":
        Gs2KeyUpdateGitHubApiKeyMethodCache.put_cache(
            Gs2KeyUpdateGitHubApiKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyUpdateGitHubApiKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getGitHubApiKey":
        Gs2KeyGetGitHubApiKeyMethodCache.put_cache(
            Gs2KeyGetGitHubApiKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyGetGitHubApiKeyRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteGitHubApiKey":
        Gs2KeyDeleteGitHubApiKeyMethodCache.put_cache(
            Gs2KeyDeleteGitHubApiKeyResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2KeyDeleteGitHubApiKeyRequest.from_dict(_parse(request_payload))
        )
        return
    pass