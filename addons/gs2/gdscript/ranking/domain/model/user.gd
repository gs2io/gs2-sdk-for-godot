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
class_name Gs2RankingUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2RankingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2RankingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
func ranking_category(
    category_name,
    additional_scope_name = null
) -> Gs2RankingRankingCategoryDomain:
    return Gs2RankingRankingCategoryDomain.new(
        _gs2,
        namespace_name,
        user_id,
        category_name,
        additional_scope_name
    )


func scores(
    category_name,
    scorer_user_id,
    time_offset_token = null
) -> Gs2RankingDescribeScoresByUserIdIterator:
    return Gs2RankingDescribeScoresByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        user_id,
        scorer_user_id,
        time_offset_token
    )


func subscribe_scores(
    callback: Callable,
    category_name,
    scorer_user_id
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2RankingScore",
        Gs2RankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_scores(
    callback_id: int,
    category_name,
    scorer_user_id
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2RankingScore",
        Gs2RankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_scores(
    category_name,
    scorer_user_id
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2RankingScore",
        Gs2RankingScoreCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )
func score(
    category_name,
    scorer_user_id,
    unique_id
) -> Gs2RankingScoreDomain:
    return Gs2RankingScoreDomain.new(
        _gs2,
        namespace_name,
        user_id,
        category_name,
        scorer_user_id,
        unique_id
    )