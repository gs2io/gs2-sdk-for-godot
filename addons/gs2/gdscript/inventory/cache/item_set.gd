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
class_name Gs2InventoryItemSetCache
extends RefCounted


static func cache_parent_key(
    namespace_name,
    user_id,
    inventory_name,
    time_offset
) -> String:
    return ":".join([
        "inventory",
        Gs2CacheDatabase.stringify(namespace_name),
        Gs2CacheDatabase.stringify(user_id),
        Gs2CacheDatabase.stringify(inventory_name),
        "0" if time_offset == null else str(time_offset),
        "ItemSet",
    ])


static func cache_key(
    item_name,
    item_set_name
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(item_name),
        Gs2CacheDatabase.stringify(item_set_name),
    ])


static func fetch(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
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
                inventory_name,
                item_name,
                item_set_name,
                time_offset
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "itemSet":
                return Gs2AsyncResult.new(null, null)
        return async_result
    put_cache(
        async_result.result,
        cache,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        item_set_name,
        time_offset
    )
    return Gs2AsyncResult.new(async_result.result, null)


# 戻り値: [value, find]
static func get_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    time_offset
) -> Array:
    assert(user_id != null)
    return cache.get_cache(
        "Gs2InventoryItemSet",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        cache_key(
            item_name,
            item_set_name
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    time_offset
) -> void:
    assert(user_id != null)
    if item != null and item.count == 0:
        item = null
    var ttl = 0
    if item != null and item.expires_at != null and item.expires_at != 0:
        ttl = item.expires_at
    cache.put(
        "Gs2InventoryItemSet",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        cache_key(
            item_name,
            item_set_name
        ),
        item,
        ttl
    )


# Gs2Distributor:DescribeUserData（ユーザーの全データの一括取得）の 1 エントリ（この kind）をキャッシュへ入れる。
# 鍵はエントリの namespace_name / 読み込むユーザーの user_id / モデル自身のプロパティ / 主キー GRN から取る
# （sdk-gen の BaseModel.user_data_cache_keys）。戻り値は親キーで、呼び手が全ページを読み終えてから
# Gs2InventoryServiceCache.set_list_cached(cache, time_offset, kind, parent_key) で「リストが揃った印」を立てる。
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
        user_id,
        item.inventory_name,
        item.item_name,
        item.name,
        time_offset
    )
    return cache_parent_key(
        namespace_name,
        user_id,
        item.inventory_name,
        time_offset
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    time_offset
) -> void:
    assert(user_id != null)
    cache.delete(
        "Gs2InventoryItemSet",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        cache_key(
            item_name,
            item_set_name
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2InventoryItemSet",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2InventoryItemSet",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        callback_id
    )


static func cache_key_list(
    item_name
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(item_name),
        "any",
    ])


# 戻り値: [value, find]
static func get_cache_list(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    time_offset
) -> Array:
    assert(user_id != null)
    return cache.get_cache(
        "Gs2InventoryItemSet[]",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        cache_key_list(
            item_name
        )
    )


static func put_cache_list(
    items,
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    time_offset
) -> void:
    assert(user_id != null)
    if items == null:
        return
    var filtered = []
    var min_expires_at = null
    for v in items:
        if v.count != null and v.count > 0:
            filtered.append(v)
        if v.expires_at != null and v.expires_at != 0:
            if min_expires_at == null or v.expires_at < min_expires_at:
                min_expires_at = v.expires_at
    filtered.sort_custom(func(a, b): return a.count > b.count)
    cache.put(
        "Gs2InventoryItemSet[]",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        cache_key_list(
            item_name
        ),
        filtered,
        0 if min_expires_at == null else min_expires_at
    )


static func delete_cache_list(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    time_offset
) -> void:
    assert(user_id != null)
    cache.delete(
        "Gs2InventoryItemSet[]",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            time_offset
        ),
        cache_key_list(
            item_name
        )
    )


static func fetch_list(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    time_offset,
    fetch_impl: Callable
) -> Gs2AsyncResult:
    var async_result = await fetch_impl.call()
    if async_result.error != null:
        if async_result.error is Gs2NotFoundException:
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "itemSet":
                return Gs2AsyncResult.new([], null)
        return async_result
    put_cache_list(
        async_result.result,
        cache,
        namespace_name,
        user_id,
        inventory_name,
        item_name,
        time_offset
    )
    return Gs2AsyncResult.new(async_result.result, null)