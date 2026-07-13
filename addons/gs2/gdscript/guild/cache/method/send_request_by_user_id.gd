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
class_name Gs2GuildSendRequestByUserIdMethodCache
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
        Gs2GuildGuildCache.put_cache(
            result.item,
            cache,
            request.namespace_name,
            (result.item.guild_model_name if result.item != null else null),
            result.item.name,
            time_offset
        )
    if result.send_member_request != null:
        Gs2GuildSendMemberRequestCache.put_cache(
            result.send_member_request,
            cache,
            request.namespace_name,
            request.user_id,
            # diff --- start
            # (result.item.guild_model_name if result.item != null else null),
            # result.send_member_request.guild_name,
            # diff --- end
            # diff +++ start
            request.guild_model_name,
            result.send_member_request.target_guild_name,
            # diff +++ end
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