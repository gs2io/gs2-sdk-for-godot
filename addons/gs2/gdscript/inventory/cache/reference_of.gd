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
class_name Gs2InventoryReferenceOfCache
extends RefCounted


static func cache_parent_key(
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    time_offset
) -> String:
    return ":".join([
        "inventory",
        Gs2CacheDatabase.stringify(namespace_name),
        Gs2CacheDatabase.stringify(user_id),
        Gs2CacheDatabase.stringify(inventory_name),
        Gs2CacheDatabase.stringify(item_name),
        Gs2CacheDatabase.stringify(item_set_name),
        "0" if time_offset == null else str(time_offset),
        "ReferenceOf",
    ])


static func cache_key(
    reference_of
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(reference_of),
    ])


static func fetch(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    reference_of,
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
                reference_of,
                time_offset
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "referenceOf":
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
        reference_of,
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
    reference_of,
    time_offset
) -> Array:
    assert(user_id != null)
    return cache.get_cache(
        "Gs2InventoryReferenceOf",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            time_offset
        ),
        cache_key(
            reference_of
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
    reference_of,
    time_offset
) -> void:
    assert(user_id != null)
    var ttl = 0
    cache.put(
        "Gs2InventoryReferenceOf",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            time_offset
        ),
        cache_key(
            reference_of
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
        Gs2InventoryReferenceOf.get_inventory_name_from_grn(item.reference_of_id),
        Gs2InventoryReferenceOf.get_item_name_from_grn(item.reference_of_id),
        Gs2InventoryReferenceOf.get_item_set_name_from_grn(item.reference_of_id),
        item.name,
        time_offset
    )
    return cache_parent_key(
        namespace_name,
        user_id,
        Gs2InventoryReferenceOf.get_inventory_name_from_grn(item.reference_of_id),
        Gs2InventoryReferenceOf.get_item_name_from_grn(item.reference_of_id),
        Gs2InventoryReferenceOf.get_item_set_name_from_grn(item.reference_of_id),
        time_offset
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    reference_of,
    time_offset
) -> void:
    assert(user_id != null)
    cache.delete(
        "Gs2InventoryReferenceOf",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            time_offset
        ),
        cache_key(
            reference_of
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2InventoryReferenceOf",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    inventory_name,
    item_name,
    item_set_name,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2InventoryReferenceOf",
        cache_parent_key(
            namespace_name,
            user_id,
            inventory_name,
            item_name,
            item_set_name,
            time_offset
        ),
        callback_id
    )