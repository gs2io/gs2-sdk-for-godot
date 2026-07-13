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
class_name Gs2DatastoreDataObjectHistoryCache
extends RefCounted


static func cache_parent_key(
    namespace_name,
    user_id,
    data_object_name,
    time_offset
) -> String:
    return ":".join([
        "datastore",
        Gs2CacheDatabase.stringify(namespace_name),
        Gs2CacheDatabase.stringify(user_id),
        Gs2CacheDatabase.stringify(data_object_name),
        "0" if time_offset == null else str(time_offset),
        "DataObjectHistory",
    ])


static func cache_key(
    generation
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(generation),
    ])


static func fetch(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    data_object_name,
    generation,
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
                user_id,
                data_object_name,
                generation,
                time_offset
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "dataObjectHistory":
                return Gs2AsyncResult.new(null, null)
        return async_result
    put_cache(
        async_result.result,
        cache,
        namespace_name,
        user_id,
        data_object_name,
        generation,
        time_offset
    )
    return Gs2AsyncResult.new(async_result.result, null)


# 戻り値: [value, find]
static func get_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    data_object_name,
    generation,
    time_offset
) -> Array:
    assert(user_id != null)
    return cache.get_cache(
        "Gs2DatastoreDataObjectHistory",
        cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            time_offset
        ),
        cache_key(
            generation
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    data_object_name,
    generation,
    time_offset
) -> void:
    assert(user_id != null)
    var pair = get_cache(
        cache,
        namespace_name,
        user_id,
        data_object_name,
        generation,
        time_offset
    )
    var value = pair[0]
    var find = pair[1]
    var value_revision = value.revision if value != null and value.revision != null else -1
    var item_revision = item.revision if item != null and item.revision != null else -1
    if find and value_revision > item_revision and item_revision > 1:
        return
    if find and value_revision == item_revision:
        return
    var ttl = 0
    cache.put(
        "Gs2DatastoreDataObjectHistory",
        cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            time_offset
        ),
        cache_key(
            generation
        ),
        item,
        ttl
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    data_object_name,
    generation,
    time_offset
) -> void:
    assert(user_id != null)
    cache.delete(
        "Gs2DatastoreDataObjectHistory",
        cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            time_offset
        ),
        cache_key(
            generation
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    data_object_name,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2DatastoreDataObjectHistory",
        cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    data_object_name,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2DatastoreDataObjectHistory",
        cache_parent_key(
            namespace_name,
            user_id,
            data_object_name,
            time_offset
        ),
        callback_id
    )