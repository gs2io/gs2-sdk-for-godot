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
class_name Gs2NewsServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_cache(
    cache: Gs2CacheDatabase,
    user_id,
    method: String,
    request_payload,
    result_payload
) -> void:
    if method == "describeNamespaces":
        Gs2NewsDescribeNamespacesMethodCache.put_cache(
            Gs2NewsDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2NewsCreateNamespaceMethodCache.put_cache(
            Gs2NewsCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2NewsGetNamespaceStatusMethodCache.put_cache(
            Gs2NewsGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2NewsGetNamespaceMethodCache.put_cache(
            Gs2NewsGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2NewsUpdateNamespaceMethodCache.put_cache(
            Gs2NewsUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2NewsDeleteNamespaceMethodCache.put_cache(
            Gs2NewsDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2NewsGetServiceVersionMethodCache.put_cache(
            Gs2NewsGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeProgresses":
        Gs2NewsDescribeProgressesMethodCache.put_cache(
            Gs2NewsDescribeProgressesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsDescribeProgressesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getProgress":
        Gs2NewsGetProgressMethodCache.put_cache(
            Gs2NewsGetProgressResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsGetProgressRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeOutputs":
        Gs2NewsDescribeOutputsMethodCache.put_cache(
            Gs2NewsDescribeOutputsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsDescribeOutputsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getOutput":
        Gs2NewsGetOutputMethodCache.put_cache(
            Gs2NewsGetOutputResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsGetOutputRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareUpdateCurrentNewsMaster":
        Gs2NewsPrepareUpdateCurrentNewsMasterMethodCache.put_cache(
            Gs2NewsPrepareUpdateCurrentNewsMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsPrepareUpdateCurrentNewsMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateCurrentNewsMaster":
        Gs2NewsUpdateCurrentNewsMasterMethodCache.put_cache(
            Gs2NewsUpdateCurrentNewsMasterResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsUpdateCurrentNewsMasterRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareUpdateCurrentNewsMasterFromGitHub":
        Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubMethodCache.put_cache(
            Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsPrepareUpdateCurrentNewsMasterFromGitHubRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeNews":
        Gs2NewsDescribeNewsMethodCache.put_cache(
            Gs2NewsDescribeNewsResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsDescribeNewsRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeNewsByUserId":
        Gs2NewsDescribeNewsByUserIdMethodCache.put_cache(
            Gs2NewsDescribeNewsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsDescribeNewsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "wantGrant":
        Gs2NewsWantGrantMethodCache.put_cache(
            Gs2NewsWantGrantResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsWantGrantRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "wantGrantByUserId":
        Gs2NewsWantGrantByUserIdMethodCache.put_cache(
            Gs2NewsWantGrantByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2NewsWantGrantByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass