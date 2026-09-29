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
class_name Gs2JobQueueServiceCache
extends RefCounted


static func _parse(payload):
    if payload == null:
        return null
    if payload is Dictionary:
        return payload
    if payload is String and payload != "":
        return JSON.parse_string(payload)
    return null


static func put_user_data(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    kind: String,
    payload
):
    return null


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
        Gs2JobQueueDescribeNamespacesMethodCache.put_cache(
            Gs2JobQueueDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2JobQueueCreateNamespaceMethodCache.put_cache(
            Gs2JobQueueCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2JobQueueGetNamespaceStatusMethodCache.put_cache(
            Gs2JobQueueGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2JobQueueGetNamespaceMethodCache.put_cache(
            Gs2JobQueueGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2JobQueueUpdateNamespaceMethodCache.put_cache(
            Gs2JobQueueUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2JobQueueDeleteNamespaceMethodCache.put_cache(
            Gs2JobQueueDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2JobQueueGetServiceVersionMethodCache.put_cache(
            Gs2JobQueueGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "dumpUserDataByUserId":
        Gs2JobQueueDumpUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueueDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkDumpUserDataByUserId":
        Gs2JobQueueCheckDumpUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueueCheckDumpUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueCheckDumpUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "cleanUserDataByUserId":
        Gs2JobQueueCleanUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueueCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkCleanUserDataByUserId":
        Gs2JobQueueCheckCleanUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueueCheckCleanUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueCheckCleanUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "prepareImportUserDataByUserId":
        Gs2JobQueuePrepareImportUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueuePrepareImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueuePrepareImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "importUserDataByUserId":
        Gs2JobQueueImportUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueueImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "checkImportUserDataByUserId":
        Gs2JobQueueCheckImportUserDataByUserIdMethodCache.put_cache(
            Gs2JobQueueCheckImportUserDataByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueCheckImportUserDataByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "describeJobsByUserId":
        Gs2JobQueueDescribeJobsByUserIdMethodCache.put_cache(
            Gs2JobQueueDescribeJobsByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueDescribeJobsByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJobByUserId":
        Gs2JobQueueGetJobByUserIdMethodCache.put_cache(
            Gs2JobQueueGetJobByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueGetJobByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "pushByUserId":
        Gs2JobQueuePushByUserIdMethodCache.put_cache(
            Gs2JobQueuePushByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueuePushByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "run":
        Gs2JobQueueRunMethodCache.put_cache(
            Gs2JobQueueRunResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueRunRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "runByUserId":
        Gs2JobQueueRunByUserIdMethodCache.put_cache(
            Gs2JobQueueRunByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueRunByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteJob":
        Gs2JobQueueDeleteJobMethodCache.put_cache(
            Gs2JobQueueDeleteJobResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueDeleteJobRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteJobByUserId":
        Gs2JobQueueDeleteJobByUserIdMethodCache.put_cache(
            Gs2JobQueueDeleteJobByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueDeleteJobByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJobResult":
        Gs2JobQueueGetJobResultMethodCache.put_cache(
            Gs2JobQueueGetJobResultResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueGetJobResultRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getJobResultByUserId":
        Gs2JobQueueGetJobResultByUserIdMethodCache.put_cache(
            Gs2JobQueueGetJobResultByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2JobQueueGetJobResultByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass