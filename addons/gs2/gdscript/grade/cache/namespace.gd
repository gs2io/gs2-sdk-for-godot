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
class_name Gs2GradeNamespaceCache
extends RefCounted


static func cache_parent_key(
    time_offset
) -> String:
    return ":".join([
        "grade",
        "0" if time_offset == null else str(time_offset),
        "Namespace",
    ])


static func cache_key(
    namespace_name
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(namespace_name),
    ])


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
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "namespace":
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
        "Gs2GradeNamespace",
        cache_parent_key(
            time_offset
        ),
        cache_key(
            namespace_name
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset
) -> void:
    var pair = get_cache(
        cache,
        namespace_name,
        time_offset
    )
    var value = pair[0]
    var find = pair[1]
    if find and value != null and item != null and value.created_at != null and item.created_at != null and value.revision != null and item.revision != null and value.created_at != item.created_at:
        if value.created_at > item.created_at:
            return
        # A recreated model starts a separate revision sequence.
        find = false
    var value_revision = value.revision if value != null and value.revision != null else -1
    var item_revision = item.revision if item != null and item.revision != null else -1
    if find and value_revision > item_revision and item_revision > 1:
        return
    if find and value_revision == item_revision:
        return
    var ttl = 0
    cache.put(
        "Gs2GradeNamespace",
        cache_parent_key(
            time_offset
        ),
        cache_key(
            namespace_name
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
        time_offset
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    time_offset
) -> void:
    cache.delete(
        "Gs2GradeNamespace",
        cache_parent_key(
            time_offset
        ),
        cache_key(
            namespace_name
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2GradeNamespace",
        cache_parent_key(
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2GradeNamespace",
        cache_parent_key(
            time_offset
        ),
        callback_id
    )