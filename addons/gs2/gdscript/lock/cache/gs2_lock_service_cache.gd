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
class_name Gs2LockServiceCache
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
    if kind == "mutex":
        var item = Gs2LockMutex.from_dict(_parse(payload))
        if item == null:
            return null
        return Gs2LockMutexCache.put_user_data(
            item,
            cache,
            namespace_name,
            user_id,
            time_offset
        )
    return null


static func set_list_cached(
    cache: Gs2CacheDatabase,
    time_offset,
    kind: String,
    parent_key: String
) -> bool:
    if kind == "mutex":
        cache.set_list_cached("Gs2LockMutex", parent_key)
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
        Gs2LockDescribeNamespacesMethodCache.put_cache(
            Gs2LockDescribeNamespacesResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockDescribeNamespacesRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "createNamespace":
        Gs2LockCreateNamespaceMethodCache.put_cache(
            Gs2LockCreateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockCreateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespaceStatus":
        Gs2LockGetNamespaceStatusMethodCache.put_cache(
            Gs2LockGetNamespaceStatusResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockGetNamespaceStatusRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getNamespace":
        Gs2LockGetNamespaceMethodCache.put_cache(
            Gs2LockGetNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockGetNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "updateNamespace":
        Gs2LockUpdateNamespaceMethodCache.put_cache(
            Gs2LockUpdateNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockUpdateNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteNamespace":
        Gs2LockDeleteNamespaceMethodCache.put_cache(
            Gs2LockDeleteNamespaceResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockDeleteNamespaceRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getServiceVersion":
        Gs2LockGetServiceVersionMethodCache.put_cache(
            Gs2LockGetServiceVersionResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockGetServiceVersionRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "lock":
        Gs2LockLockMethodCache.put_cache(
            Gs2LockLockResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockLockRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "lockByUserId":
        Gs2LockLockByUserIdMethodCache.put_cache(
            Gs2LockLockByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockLockByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unlock":
        Gs2LockUnlockMethodCache.put_cache(
            Gs2LockUnlockResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockUnlockRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "unlockByUserId":
        Gs2LockUnlockByUserIdMethodCache.put_cache(
            Gs2LockUnlockByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockUnlockByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMutex":
        Gs2LockGetMutexMethodCache.put_cache(
            Gs2LockGetMutexResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockGetMutexRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "getMutexByUserId":
        Gs2LockGetMutexByUserIdMethodCache.put_cache(
            Gs2LockGetMutexByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockGetMutexByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    if method == "deleteMutexByUserId":
        Gs2LockDeleteMutexByUserIdMethodCache.put_cache(
            Gs2LockDeleteMutexByUserIdResult.from_dict(_parse(result_payload)),
            cache,
            user_id,
            null,
            Gs2LockDeleteMutexByUserIdRequest.from_dict(_parse(request_payload))
        )
        return
    pass