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
# deny overwrite
class_name Gs2SerialKeySerialKeyCache
extends RefCounted


static func cache_parent_key(
    namespace_name,
    user_id,
    time_offset
) -> String:
    return ":".join([
        "serialKey",
        Gs2CacheDatabase.stringify(namespace_name),
# diff --- start
#        Gs2CacheDatabase.stringify(user_id),
#        "0" if time_offset == null else str(time_offset),
# diff --- end
        "Singleton", # diff +++
        "SerialKey",
    ])


static func cache_key(
    serial_key_code
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(serial_key_code),
    ])


static func fetch(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    serial_key_code,
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
                serial_key_code,
                time_offset
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "serialKey":
                return Gs2AsyncResult.new(null, null)
        return async_result
    put_cache(
        async_result.result,
        cache,
        namespace_name,
        user_id,
        serial_key_code,
        time_offset
    )
    return Gs2AsyncResult.new(async_result.result, null)


# 戻り値: [value, find]
static func get_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    serial_key_code,
    time_offset
) -> Array:
# diff --- start
#    assert(user_id != null)
# diff --- end
    return cache.get_cache(
        "Gs2SerialKeySerialKey",
        cache_parent_key(
            namespace_name,
            user_id,
            time_offset
        ),
        cache_key(
            serial_key_code
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    serial_key_code,
    time_offset
) -> void:
# diff --- start
#    assert(user_id != null)
# diff --- end
    var pair = get_cache(
        cache,
        namespace_name,
        user_id,
        serial_key_code,
        time_offset
    )
    var value = pair[0]
    var find = pair[1]
    var value_revision = value.revision if value != null and value.revision != null else 0
    var item_revision = item.revision if item != null and item.revision != null else 0
    if find and value_revision > item_revision and item_revision > 1:
        return
    var ttl = 0
    cache.put(
        "Gs2SerialKeySerialKey",
        cache_parent_key(
            namespace_name,
            user_id,
            time_offset
        ),
        cache_key(
            serial_key_code
        ),
        item,
        ttl
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    serial_key_code,
    time_offset
) -> void:
    assert(user_id != null)
    cache.delete(
        "Gs2SerialKeySerialKey",
        cache_parent_key(
            namespace_name,
            user_id,
            time_offset
        ),
        cache_key(
            serial_key_code
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2SerialKeySerialKey",
        cache_parent_key(
            namespace_name,
            user_id,
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2SerialKeySerialKey",
        cache_parent_key(
            namespace_name,
            user_id,
            time_offset
        ),
        callback_id
    )