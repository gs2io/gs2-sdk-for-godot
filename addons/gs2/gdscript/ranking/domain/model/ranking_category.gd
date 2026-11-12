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
class_name Gs2RankingRankingCategoryDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2RankingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var category_name: Variant = null
var additional_scope_name: Variant = null
var next_page_token: Variant = null
var processing: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    category_name_,
    additional_scope_name_
):
    _gs2 = gs2
    _client = Gs2RankingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    category_name = category_name_
    additional_scope_name = additional_scope_name_


func subscribe_by_user_id(
    request: Gs2RankingSubscribeByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_category_name(category_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2RankingSubscribeByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.subscribe_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2RankingSubscribeUserDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.category_name),
        additional_scope_name,
        (null if ref == null else ref.target_user_id)
    )
    return Gs2AsyncResult.new(domain, null)


func put_score(
    request: Gs2RankingPutScoreByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_category_name(category_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2RankingPutScoreByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.put_score_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2RankingScoreDomain.new(
        _gs2,
        request.namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.category_name),
        (null if ref == null else ref.scorer_user_id),
        (null if ref == null else ref.unique_id)
    )
    return Gs2AsyncResult.new(domain, null)
func subscribe(
) -> Gs2RankingSubscribeDomain:
    return Gs2RankingSubscribeDomain.new(
        _gs2,
        namespace_name,
        user_id,
        category_name,
        additional_scope_name
    )


func subscribes_by_category_name(
    time_offset_token = null
) -> Gs2RankingDescribeSubscribesByCategoryNameAndUserIdIterator:
    return Gs2RankingDescribeSubscribesByCategoryNameAndUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        user_id,
        time_offset_token
    )


func subscribe_subscribes_by_category_name(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2RankingSubscribeUser",
        Gs2RankingSubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null
        ),
        callback
    )


func unsubscribe_subscribes_by_category_name(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2RankingSubscribeUser",
        Gs2RankingSubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null
        ),
        callback_id
    )


func invalidate_subscribes_by_category_name(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2RankingSubscribeUser",
        Gs2RankingSubscribeUserCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null
        )
    )
func subscribe_user(
    target_user_id
) -> Gs2RankingSubscribeUserDomain:
    return Gs2RankingSubscribeUserDomain.new(
        _gs2,
        namespace_name,
        user_id,
        category_name,
        additional_scope_name,
        target_user_id
    )


func rankings(
    time_offset_token = null
) -> Gs2RankingDescribeRankingsByUserIdIterator:
    return Gs2RankingDescribeRankingsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        user_id,
        additional_scope_name,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )


func near_rankings(
    score
) -> Gs2RankingDescribeNearRankingsIterator:
    return Gs2RankingDescribeNearRankingsIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        score,
        additional_scope_name
    )


func subscribe_near_rankings(
    callback: Callable,
    score
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2RankingRanking",
        Gs2RankingRankingCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null
        ),
        callback
    )


func unsubscribe_near_rankings(
    callback_id: int,
    score
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2RankingRanking",
        Gs2RankingRankingCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null
        ),
        callback_id
    )


func invalidate_near_rankings(
    score
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2RankingRanking",
        Gs2RankingRankingCache.cache_parent_key(
            namespace_name,
            user_id,
            category_name,
            additional_scope_name,
            null
        )
    )
func ranking(
    scorer_user_id = null,
    index = null
) -> Gs2RankingRankingDomain:
    return Gs2RankingRankingDomain.new(
        _gs2,
        namespace_name,
        user_id,
        category_name,
        additional_scope_name,
        scorer_user_id,
        index
    )