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
class_name Gs2ScriptServiceCache
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
        Gs2ScriptDescribeNamespacesMethodCache.put_cache(
            Gs2ScriptDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2ScriptCreateNamespaceMethodCache.put_cache(
            Gs2ScriptCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2ScriptGetNamespaceStatusMethodCache.put_cache(
            Gs2ScriptGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2ScriptGetNamespaceMethodCache.put_cache(
            Gs2ScriptGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2ScriptUpdateNamespaceMethodCache.put_cache(
            Gs2ScriptUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2ScriptDeleteNamespaceMethodCache.put_cache(
            Gs2ScriptDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2ScriptGetServiceVersionMethodCache.put_cache(
            Gs2ScriptGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeScripts":
        Gs2ScriptDescribeScriptsMethodCache.put_cache(
            Gs2ScriptDescribeScriptsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptDescribeScriptsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createScript":
        Gs2ScriptCreateScriptMethodCache.put_cache(
            Gs2ScriptCreateScriptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptCreateScriptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createScriptFromGitHub":
        Gs2ScriptCreateScriptFromGitHubMethodCache.put_cache(
            Gs2ScriptCreateScriptFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptCreateScriptFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getScript":
        Gs2ScriptGetScriptMethodCache.put_cache(
            Gs2ScriptGetScriptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptGetScriptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateScript":
        Gs2ScriptUpdateScriptMethodCache.put_cache(
            Gs2ScriptUpdateScriptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptUpdateScriptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateScriptFromGitHub":
        Gs2ScriptUpdateScriptFromGitHubMethodCache.put_cache(
            Gs2ScriptUpdateScriptFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptUpdateScriptFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteScript":
        Gs2ScriptDeleteScriptMethodCache.put_cache(
            Gs2ScriptDeleteScriptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptDeleteScriptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "invokeScript":
        Gs2ScriptInvokeScriptMethodCache.put_cache(
            Gs2ScriptInvokeScriptResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptInvokeScriptRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "debugInvoke":
        Gs2ScriptDebugInvokeMethodCache.put_cache(
            Gs2ScriptDebugInvokeResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2ScriptDebugInvokeRequest.from_dict(_parse(request_payload))
        )
        return
    pass