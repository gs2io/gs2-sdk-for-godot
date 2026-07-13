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
class_name Gs2RankingUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2RankingRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2RankingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
func ranking_category(
    category_name,
    additional_scope_name = null
) -> Gs2RankingRankingCategoryAccessTokenDomain:
    return Gs2RankingRankingCategoryAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        category_name,
        additional_scope_name
    )


func scores(
    category_name,
    scorer_user_id
) -> Gs2RankingDescribeScoresIterator:
    return Gs2RankingDescribeScoresIterator.new(
        _gs2,
        _client,
        namespace_name,
        category_name,
        access_token,
        scorer_user_id
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
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
            null if access_token == null else access_token.time_offset
        )
    )
func score(
    category_name,
    scorer_user_id,
    unique_id
) -> Gs2RankingScoreAccessTokenDomain:
    return Gs2RankingScoreAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        category_name,
        scorer_user_id,
        unique_id
    )