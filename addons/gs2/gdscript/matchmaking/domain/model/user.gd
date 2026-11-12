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
# deny overwrite
class_name Gs2MatchmakingUserDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var next_page_token: Variant = null
var matchmaking_context_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_


func create_gathering(
    request: Gs2MatchmakingCreateGatheringByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2MatchmakingCreateGatheringByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.create_gathering_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingGatheringDomain.new(
        _gs2,
        namespace_name,
        request.user_id,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func delete_gathering(
    request: Gs2MatchmakingDeleteGatheringRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingDeleteGatheringMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_gathering(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingGatheringDomain.new(
        _gs2,
        namespace_name,
        user_id,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func put_result(
    request: Gs2MatchmakingPutResultRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingPutResultMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.put_result(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2MatchmakingRatingDomain.new(
                _gs2,
                namespace_name,
                (null if v == null else v.user_id),
                (null if v == null else v.name)
            ))
    return Gs2AsyncResult.new(domain, null)


func gatherings(
) -> Gs2MatchmakingDescribeGatheringsIterator:
    return Gs2MatchmakingDescribeGatheringsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_gatherings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_gatherings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_gatherings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )


func do_matchmaking_by_player(
    player
) -> Gs2MatchmakingDoMatchmakingByPlayerIterator:
    return Gs2MatchmakingDoMatchmakingByPlayerIterator.new(
        _gs2,
        _client,
        namespace_name,
        player
    )


func subscribe_do_matchmaking_by_player(
    callback: Callable,
    player
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback
    )


func unsubscribe_do_matchmaking_by_player(
    callback_id: int,
    player
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        ),
        callback_id
    )


func invalidate_do_matchmaking_by_player(
    player
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingGathering",
        Gs2MatchmakingGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            null
        )
    )


func do_matchmaking(
    player,
    time_offset_token = null
) -> Gs2MatchmakingDoMatchmakingByUserIdIterator:
    return Gs2MatchmakingDoMatchmakingByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        player,
        time_offset_token
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
            null
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
            null
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
            null
        )
    )
func gathering(
    gathering_name
) -> Gs2MatchmakingGatheringDomain:
    return Gs2MatchmakingGatheringDomain.new(
        _gs2,
        namespace_name,
        user_id,
        gathering_name
    )


func ratings(
    time_offset_token = null
) -> Gs2MatchmakingDescribeRatingsByUserIdIterator:
    return Gs2MatchmakingDescribeRatingsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        time_offset_token
    )


func subscribe_ratings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingRating",
        Gs2MatchmakingRatingCache.cache_parent_key(
            namespace_name,
            user_id,
            null
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
            null
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
            null
        )
    )
func rating(
    rating_name
) -> Gs2MatchmakingRatingDomain:
    return Gs2MatchmakingRatingDomain.new(
        _gs2,
        namespace_name,
        user_id,
        rating_name
    )
func ballot(
    rating_name,
    gathering_name,
    number_of_player,
    key_id
) -> Gs2MatchmakingBallotDomain:
    return Gs2MatchmakingBallotDomain.new(
        _gs2,
        namespace_name,
        user_id,
        rating_name,
        gathering_name,
        number_of_player,
        key_id
    )
func season(
    season_name,
    season
) -> Gs2MatchmakingSeasonDomain:
    return Gs2MatchmakingSeasonDomain.new(
        _gs2,
        namespace_name,
        user_id,
        season_name,
        season
    )