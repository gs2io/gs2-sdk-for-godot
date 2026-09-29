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
class_name Gs2Money2CurrentModelMasterCache
extends RefCounted


static func cache_parent_key(
    namespace_name,
    time_offset
) -> String:
    return ":".join([
        "money2",
        Gs2CacheDatabase.stringify(namespace_name),
        "0" if time_offset == null else str(time_offset),
        "CurrentModelMaster",
    ])


static func cache_key(
) -> String:
    return "Singleton"


static func fetch(
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset,
    fetch_impl: Callable
) -> Gs2AsyncResult:
    var async_result = await fetch_impl.call()
    if async_result.error != null:
        if async_result.error is Gs2NotFoundException:
            put_cache(
                null,
                cache,
                namespace_name,
                time_offset
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "currentModelMaster":
                return Gs2AsyncResult.new(null, null)
        return async_result
    put_cache(
        async_result.result,
        cache,
        namespace_name,
        time_offset
    )
    return Gs2AsyncResult.new(async_result.result, null)


static func get_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset
) -> Array:
    return cache.get_cache(
        "Gs2Money2CurrentModelMaster",
        cache_parent_key(
            namespace_name,
            time_offset
        ),
        cache_key(
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset
) -> void:
    var ttl = 0
    cache.put(
        "Gs2Money2CurrentModelMaster",
        cache_parent_key(
            namespace_name,
            time_offset
        ),
        cache_key(
        ),
        item,
        ttl
    )


static func put_user_data(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset
) -> String:
    put_cache(
        item,
        cache,
        namespace_name,
        time_offset
    )
    return cache_parent_key(
        namespace_name,
        time_offset
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset
) -> void:
    cache.delete(
        "Gs2Money2CurrentModelMaster",
        cache_parent_key(
            namespace_name,
            time_offset
        ),
        cache_key(
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2Money2CurrentModelMaster",
        cache_parent_key(
            namespace_name,
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2Money2CurrentModelMaster",
        cache_parent_key(
            namespace_name,
            time_offset
        ),
        callback_id
    )