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
class_name Gs2GradeAddGradeByUserIdMethodCache
extends RefCounted


static func put_cache(
    result,
    cache: Gs2CacheDatabase,
    user_id,
    time_offset,
    request
) -> void:
    if result == null:
        return
    if result.item != null:
        Gs2GradeStatusCache.put_cache(
            result.item,
            cache,
            request.namespace_name,
            (result.item.user_id if result.item != null else null),
            # diff --- start
            # (result.item.grade_name if result.item != null else null),
            # diff --- end
            request.grade_name, # diff +++
            # diff --- start
            # (result.item.property_id if result.item != null else null),
            # diff --- end
            result.experience_status.property_id, # diff +++
            time_offset
        )
    if result.experience_status != null:
        Gs2ExperienceStatusCache.put_cache(
            result.experience_status,
            cache,
            # diff --- start
            # Gs2ExperienceStatus.get_namespace_name_from_grn(result.experience_status.status_id),
            # diff --- end
            result.experience_namespace_name, # diff +++
            (result.item.user_id if result.item != null else null),
            result.experience_status.experience_name,
            (result.item.property_id if result.item != null else null),
            time_offset
        )


static func invoke(
    cache: Gs2CacheDatabase,
    user_id,
    time_offset,
    request,
    invoke_impl: Callable
) -> Gs2AsyncResult:
    var async_result = await invoke_impl.call()
    if async_result.error != null:
        return async_result
    put_cache(
        async_result.result,
        cache,
        user_id,
        time_offset,
        request
    )
    return async_result