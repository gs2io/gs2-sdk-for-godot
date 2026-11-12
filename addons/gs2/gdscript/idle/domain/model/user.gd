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
class_name Gs2IdleUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2IdleRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2IdleRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func statuses(
    time_offset_token = null
) -> Gs2IdleDescribeStatusesByUserIdIterator:
    return Gs2IdleDescribeStatusesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_statuses(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2IdleStatus",
        Gs2IdleStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_statuses(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2IdleStatus",
        Gs2IdleStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_statuses(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2IdleStatus",
        Gs2IdleStatusCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func status(
    category_name
) -> Gs2IdleStatusDomain:
    return Gs2IdleStatusDomain.new(
        _gs2,
        namespace_name,
        user_id,
        category_name
    )