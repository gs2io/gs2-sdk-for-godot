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
class_name Gs2MatchmakingUserAccessTokenDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var next_page_token: Variant = null
var matchmaking_context_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    access_token_
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_


func create_gathering(
    request: Gs2MatchmakingCreateGatheringRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2MatchmakingCreateGatheringMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.create_gathering(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingGatheringAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func do_matchmaking(
    player
) -> Gs2MatchmakingDoMatchmakingIterator:
    return Gs2MatchmakingDoMatchmakingIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token,
        player
    )


func subscribe_do_matchmaking(
    callback: Callable,
    player
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_do_matchmaking(
    callback_id: int,
    player
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_do_matchmaking(
    player
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func gathering(
    gathering_name
) -> Gs2MatchmakingGatheringAccessTokenDomain:
    return Gs2MatchmakingGatheringAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        gathering_name
    )


func ratings(
) -> Gs2MatchmakingDescribeRatingsIterator:
    return Gs2MatchmakingDescribeRatingsIterator.new(
        _gs2,
        _client,
        namespace_name,
        access_token
    )


func subscribe_ratings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingRating",
        Gs2MatchmakingRatingCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback
    )


func unsubscribe_ratings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingRating",
        Gs2MatchmakingRatingCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        ),
        callback_id
    )


func invalidate_ratings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingRating",
        Gs2MatchmakingRatingCache.cache_parent_key(
            namespace_name,
            user_id,
            null if access_token == null else access_token.time_offset
        )
    )
func rating(
    rating_name
) -> Gs2MatchmakingRatingAccessTokenDomain:
    return Gs2MatchmakingRatingAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        rating_name
    )
func ballot(
    rating_name,
    gathering_name,
    number_of_player,
    key_id
) -> Gs2MatchmakingBallotAccessTokenDomain:
    return Gs2MatchmakingBallotAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        rating_name,
        gathering_name,
        number_of_player,
        key_id
    )
func season(
    season_name,
    season
) -> Gs2MatchmakingSeasonAccessTokenDomain:
    return Gs2MatchmakingSeasonAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token,
        season_name,
        season
    )