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
class_name Gs2RankingEzRankingCategoryDomain
extends RefCounted


var _domain: Gs2RankingRankingCategoryDomain
var _connection: Gs2Connection
var next_page_token: Variant:
    get:
        return _domain.next_page_token
var processing: Variant:
    get:
        return _domain.processing
var namespace_name: Variant:
    get:
        return null if _domain == null else _domain.namespace_name
var user_id: Variant:
    get:
        return null if _domain == null else _domain.user_id
var category_name: Variant:
    get:
        return null if _domain == null else _domain.category_name
var additional_scope_name: Variant:
    get:
        return null if _domain == null else _domain.additional_scope_name


func _init(
    domain: Gs2RankingRankingCategoryDomain,
    connection: Gs2Connection
):
    _domain = domain
    _connection = connection


func near_rankings(
    score
) -> Gs2RankingEzGetNearRankingIterator:
    return Gs2RankingEzGetNearRankingIterator.new(
        _domain,
        _connection,
        score
    )


func subscribe_near_rankings(
    callback: Callable,
    score
) -> int:
    return _domain.subscribe_near_rankings(
        func(items): callback.call([] if items == null else items.map(func(v): return Gs2RankingEzRanking.from_model(v))),
        score
    )


func unsubscribe_near_rankings(
    callback_id: int,
    score
) -> void:
    _domain.unsubscribe_near_rankings(
        callback_id,
        score
    )


func subscribe_user(
    target_user_id
) -> Gs2RankingEzSubscribeUserDomain:
    return Gs2RankingEzSubscribeUserDomain.new(
        _domain.subscribe_user(
            target_user_id
        ),
        _connection
    )


func ranking(
    scorer_user_id = null,
    index = null
) -> Gs2RankingEzRankingDomain:
    return Gs2RankingEzRankingDomain.new(
        _domain.ranking(
            scorer_user_id,
            index
        ),
        _connection
    )