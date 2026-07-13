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
class_name Gs2Ranking2UserDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func subscribes(
    ranking_name,
    time_offset_token = null
) -> Gs2Ranking2DescribeSubscribesByUserIdIterator:
    return Gs2Ranking2DescribeSubscribesByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        ranking_name,
        time_offset_token
    )


func subscribe_subscribes(
    callback: Callable,
    ranking_name
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2Ranking2SubscribeUser",
        Gs2Ranking2SubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback
    )


func unsubscribe_subscribes(
    callback_id: int,
    ranking_name
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2Ranking2SubscribeUser",
        Gs2Ranking2SubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        ),
        callback_id
    )


func invalidate_subscribes(
    ranking_name
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2Ranking2SubscribeUser",
        Gs2Ranking2SubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            ranking_name,
            null
        )
    )
func subscribe(
    ranking_name
) -> Gs2Ranking2SubscribeDomain:
    return Gs2Ranking2SubscribeDomain.new(
        _gs2,
        namespace_name,
        user_id,
        ranking_name
    )