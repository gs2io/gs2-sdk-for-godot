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
# diff +++ start
class_name Gs2ScheduleRepeatScheduleCache
extends RefCounted


static func cache_parent_key(
    namespace_name,
    user_id,
    is_in_schedule
) -> String:
    return ":".join([
        "schedule",
        Gs2CacheDatabase.stringify(namespace_name),
        Gs2CacheDatabase.stringify(user_id),
        Gs2CacheDatabase.stringify(is_in_schedule),
        "RepeatSchedule",
    ])


static func cache_key(
    event_name
) -> String:
    return ":".join([
        Gs2CacheDatabase.stringify(event_name),
    ])


static func fetch(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    event_name,
    is_in_schedule,
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
                event_name,
                is_in_schedule
            )
            if async_result.error.errors.size() != 0 and async_result.error.errors[0].component == "event":
                return Gs2AsyncResult.new(null, null)
        return async_result
    put_cache(
        async_result.result,
        cache,
        namespace_name,
        user_id,
        event_name,
        is_in_schedule
    )
    return Gs2AsyncResult.new(async_result.result, null)


static func get_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    event_name,
    is_in_schedule
) -> Array:
    assert(user_id != null)
    return cache.get_cache(
        "Gs2ScheduleRepeatSchedule",
        cache_parent_key(
            namespace_name,
            user_id,
            is_in_schedule
        ),
        cache_key(
            event_name
        )
    )


static func put_cache(
    item,
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    event_name,
    is_in_schedule
) -> void:
    assert(user_id != null)
    var ttl = 0
    cache.put(
        "Gs2ScheduleRepeatSchedule",
        cache_parent_key(
            namespace_name,
            user_id,
            is_in_schedule
        ),
        cache_key(
            event_name
        ),
        item,
        ttl
    )


static func delete_cache(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    event_name
) -> void:
    assert(user_id != null)
    for is_in_schedule in [false, true]:
        cache.delete(
            "Gs2ScheduleRepeatSchedule",
            cache_parent_key(
                namespace_name,
                user_id,
                is_in_schedule
            ),
            cache_key(
                event_name
            )
        )


static func list_subscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    is_in_schedule,
    callback: Callable
) -> int:
    return cache.list_subscribe(
        "Gs2ScheduleRepeatSchedule",
        cache_parent_key(
            namespace_name,
            user_id,
            is_in_schedule
        ),
        callback
    )


static func list_unsubscribe(
    cache: Gs2CacheDatabase,
    namespace_name,
    user_id,
    is_in_schedule,
    callback_id: int
) -> void:
    cache.list_unsubscribe(
        "Gs2ScheduleRepeatSchedule",
        cache_parent_key(
            namespace_name,
            user_id,
            is_in_schedule
        ),
        callback_id
    )
# diff +++ end
