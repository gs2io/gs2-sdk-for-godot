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
class_name Gs2Ranking2UserAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2Ranking2RestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2Ranking2RestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func subscribes(
    ranking_name
) -> Gs2Ranking2DescribeSubscribesIterator:
    return Gs2Ranking2DescribeSubscribesIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        ranking_name
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func subscribe(
    ranking_name
) -> Gs2Ranking2SubscribeAccessTokenDomain:
    return Gs2Ranking2SubscribeAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        ranking_name
    )