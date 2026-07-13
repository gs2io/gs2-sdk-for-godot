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
class_name Gs2ShowcaseUserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2ShowcaseRestClient
var namespace_name: Variant = null
var user_id: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2ShowcaseRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func showcases(
    time_offset_token = null
) -> Gs2ShowcaseDescribeShowcasesByUserIdIterator:
    return Gs2ShowcaseDescribeShowcasesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_showcases(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ShowcaseShowcase",
        Gs2ShowcaseShowcaseCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_showcases(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ShowcaseShowcase",
        Gs2ShowcaseShowcaseCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_showcases(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ShowcaseShowcase",
        Gs2ShowcaseShowcaseCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func showcase(
    showcase_name
) -> Gs2ShowcaseShowcaseDomain:
    return Gs2ShowcaseShowcaseDomain.new(
        _gs2,
        namespace_name,
        user_id,
        showcase_name
    )
func random_showcase(
    showcase_name
) -> Gs2ShowcaseRandomShowcaseDomain:
    return Gs2ShowcaseRandomShowcaseDomain.new(
        _gs2,
        namespace_name,
        user_id,
        showcase_name
    )
func random_showcase_status(
    showcase_name
) -> Gs2ShowcaseRandomShowcaseStatusDomain:
    return Gs2ShowcaseRandomShowcaseStatusDomain.new(
        _gs2,
        namespace_name,
        user_id,
        showcase_name
    )