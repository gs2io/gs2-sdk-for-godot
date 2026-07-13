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
class_name Gs2ProjectCleanProgressCache
extends RefCounted


static func cache_parent_key(
    account_name,
    project_name,
    time_offset
) -> String:
    return ":".join([
        "project",
        Gs2CacheDatabase.stringify(account_name),
        Gs2CacheDatabase.stringify(project_name),
        "0" if time_offset == null else str(time_offset),
        "CleanProgress",
    ])


static func cache_key(
    transaction_id
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(transaction_id),
    ])


static func fetch(
    cache: Gs2CacheDatabase,
    account_name,
    project_name,
    transaction_id,
    time_offset,
    fetch_impl: Callable
) -> Gs2AsyncResult:
    var async_result = await fetch_impl.call()
    if async_result.error != null:
        if async_result.error is Gs2NotFoundException:
            put_cache(
                null,
                cache,
                account_name,
                project_name,
                transaction_id,
                time_offset
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "cleanProgress":
                return Gs2AsyncResult.new(null, null)
        return async_result
    put_cache(
        async_result.result,
        cache,
        account_name,
        project_name,
        transaction_id,
        time_offset
    )
    return Gs2AsyncResult.new(async_result.result, null)


# 戻り値: [value, find]
static func get_cache(
    cache: Gs2CacheDatabase,
    account_name,
    project_name,
    transaction_id,
    time_offset
) -> Array:
    return cache.get_cache(
        "Gs2ProjectCleanProgress",
        cache_parent_key(
            account_name,
            project_name,
            time_offset
        ),
        cache_key(
            transaction_id
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    account_name,
    project_name,
    transaction_id,
    time_offset
) -> void:
    var pair = get_cache(
        cache,
        account_name,
        project_name,
        transaction_id,
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
        "Gs2ProjectCleanProgress",
        cache_parent_key(
            account_name,
            project_name,
            time_offset
        ),
        cache_key(
            transaction_id
        ),
        item,
        ttl
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    account_name,
    project_name,
    transaction_id,
    time_offset
) -> void:
    cache.delete(
        "Gs2ProjectCleanProgress",
        cache_parent_key(
            account_name,
            project_name,
            time_offset
        ),
        cache_key(
            transaction_id
        )
    )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    account_name,
    project_name,
    time_offset,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2ProjectCleanProgress",
        cache_parent_key(
            account_name,
            project_name,
            time_offset
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    account_name,
    project_name,
    time_offset,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2ProjectCleanProgress",
        cache_parent_key(
            account_name,
            project_name,
            time_offset
        ),
        callback_id
    )