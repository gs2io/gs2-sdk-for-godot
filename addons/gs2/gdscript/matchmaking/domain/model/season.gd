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
class_name Gs2MatchmakingSeasonDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var season_name: Variant = null
var season: Variant = null
var next_page_token: Variant = null
var matchmaking_context_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    user_id_,
    season_name_,
    season_
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    season_name = season_name_
    season = season_


func season_gatherings(
    tier = null
) -> Gs2MatchmakingDescribeSeasonGatheringsIterator:
    return Gs2MatchmakingDescribeSeasonGatheringsIterator.new(
        _gs2,
        _client,
        namespace_name,
        season_name,
        season,
        tier
    )


func subscribe_season_gatherings(
    callback: Callable,
    tier = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_season_gatherings(
    callback_id: int,
    tier = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_season_gatherings(
    tier = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        )
    )


func matchmaking_season_gatherings(
    tier = null
) -> Gs2MatchmakingDescribeMatchmakingSeasonGatheringsIterator:
    return Gs2MatchmakingDescribeMatchmakingSeasonGatheringsIterator.new(
        _gs2,
        _client,
        namespace_name,
        season_name,
        season,
        tier
    )


func subscribe_matchmaking_season_gatherings(
    callback: Callable,
    tier = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_matchmaking_season_gatherings(
    callback_id: int,
    tier = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_matchmaking_season_gatherings(
    tier = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        )
    )


func do_season_matchmaking(
    time_offset_token = null
) -> Gs2MatchmakingDoSeasonMatchmakingByUserIdIterator:
    return Gs2MatchmakingDoSeasonMatchmakingByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        season_name,
        user_id,
        time_offset_token
    )


func subscribe_do_season_matchmaking(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_do_season_matchmaking(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_do_season_matchmaking(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        )
    )
func season_gathering(
    tier,
    season_gathering_name
) -> Gs2MatchmakingSeasonGatheringDomain:
    return Gs2MatchmakingSeasonGatheringDomain.new(
        _gs2,
        namespace_name,
        user_id,
        season_name,
        season,
        tier,
        season_gathering_name
    )


func joined_season_gatherings(
    time_offset_token = null
) -> Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdIterator:
    return Gs2MatchmakingDescribeJoinedSeasonGatheringsByUserIdIterator.new(
        _gs2,
        _client,
        namespace_name,
        user_id,
        season_name,
        time_offset_token
    )


func subscribe_joined_season_gatherings(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingJoinedSeasonGathering",
        Gs2MatchmakingJoinedSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback
    )


func unsubscribe_joined_season_gatherings(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingJoinedSeasonGathering",
        Gs2MatchmakingJoinedSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        callback_id
    )


func invalidate_joined_season_gatherings(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingJoinedSeasonGathering",
        Gs2MatchmakingJoinedSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        )
    )
func joined_season_gathering(
) -> Gs2MatchmakingJoinedSeasonGatheringDomain:
    return Gs2MatchmakingJoinedSeasonGatheringDomain.new(
        _gs2,
        namespace_name,
        user_id,
        season_name,
        season
    )