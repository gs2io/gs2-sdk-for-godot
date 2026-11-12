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
class_name Gs2RankingRankingCategoryAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2RankingRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var category_name: Variant = null
var additional_scope_name: Variant = null
var next_page_token: Variant = null
var processing: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    category_name_,
    additional_scope_name_
):
    _gs2 = gs2
    _client = Gs2RankingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    category_name = category_name_
    additional_scope_name = additional_scope_name_


func subscribe_(
    request: Gs2RankingSubscribeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_category_name(category_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2RankingSubscribeMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.subscribe(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2RankingSubscribeUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.category_name),
        additional_scope_name,
        (null if ref == null else ref.target_user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func put_score(
    request: Gs2RankingPutScoreRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_category_name(category_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2RankingPutScoreMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.put_score(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2RankingScoreAccessTokenDomain.new(
        _gs2,
        request.namespace_name,
        access_token,
        (null if ref == null else ref.category_name),
        (null if ref == null else ref.scorer_user_id),
        (null if ref == null else ref.unique_id)
    )
    return Gs2AsyncResult.new(domain, null)
func subscribe(
) -> Gs2RankingSubscribeAccessTokenDomain:
    return Gs2RankingSubscribeAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        category_name,
        additional_scope_name
    )


func subscribe_users(
) -> Gs2RankingDescribeSubscribesByCategoryNameIterator:
    return Gs2RankingDescribeSubscribesByCategoryNameIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        access_token
    )


func subscribe_subscribe_users(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2RankingSubscribeUser",
        Gs2RankingSubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_subscribe_users(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2RankingSubscribeUser",
        Gs2RankingSubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_subscribe_users(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2RankingSubscribeUser",
        Gs2RankingSubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null if access_token == null else access_token.time_offset
        )
    )
func subscribe_user(
    target_user_id
) -> Gs2RankingSubscribeUserAccessTokenDomain:
    return Gs2RankingSubscribeUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        category_name,
        additional_scope_name,
        target_user_id
    )


func rankings(
) -> Gs2RankingDescribeRankingsIterator:
    return Gs2RankingDescribeRankingsIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        access_token,
        additional_scope_name
    )


func subscribe_rankings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2RankingRanking",
        Gs2RankingRankingCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_rankings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2RankingRanking",
        Gs2RankingRankingCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_rankings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2RankingRanking",
        Gs2RankingRankingCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null if access_token == null else access_token.time_offset
        )
    )
func ranking(
    scorer_user_id = null,
    index = null
) -> Gs2RankingRankingAccessTokenDomain:
    return Gs2RankingRankingAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        category_name,
        additional_scope_name,
        scorer_user_id,
        index
    )