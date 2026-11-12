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
class_name Gs2MatchmakingSeasonGatheringDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var user_id: Variant = null
var season_name: Variant = null
var season: Variant = null
var tier: Variant = null
var season_gathering_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    user_id_,
    season_name_,
    season_,
    tier_,
    season_gathering_name_
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    user_id = user_id_
    season_name = season_name_
    season = season_
    tier = tier_
    season_gathering_name = season_gathering_name_


func get_(
    request: Gs2MatchmakingGetSeasonGatheringRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_season_name(season_name)
    request = request.with_season(season)
    request = request.with_tier(tier)
    request = request.with_season_gathering_name(season_gathering_name)
    var async_result = await Gs2MatchmakingGetSeasonGatheringMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.get_season_gathering(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func verify_include_participant(
    request: Gs2MatchmakingVerifyIncludeParticipantByUserIdRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_season_name(season_name)
    request = request.with_season(season)
    request = request.with_tier(tier)
    request = request.with_season_gathering_name(season_gathering_name)
    request = request.with_user_id(user_id)
    var async_result = await Gs2MatchmakingVerifyIncludeParticipantByUserIdMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.verify_include_participant_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2MatchmakingDeleteSeasonGatheringRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_season_name(season_name)
    request = request.with_season(season)
    request = request.with_tier(tier)
    request = request.with_season_gathering_name(season_gathering_name)
    var async_result = await Gs2MatchmakingDeleteSeasonGatheringMethodCache.invoke(
        _gs2.cache,
        user_id,
        null,
        request,
        func(): return await _client.delete_season_gathering(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2MatchmakingSeasonGatheringCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        season_name,
        season,
        tier,
        season_gathering_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MatchmakingSeasonGatheringCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        season_name,
        season,
        tier,
        season_gathering_name,
        null,
        func():
            var get_result = await get_(Gs2MatchmakingGetSeasonGatheringRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MatchmakingSeasonGatheringCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        season_name,
        season,
        tier,
        season_gathering_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        Gs2MatchmakingSeasonGatheringCache.cache_key(
            tier,
            season_gathering_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MatchmakingSeasonGathering",
        Gs2MatchmakingSeasonGatheringCache.cache_parent_key(
            namespace_name,
            user_id,
            season_name,
            season,
            null
        ),
        Gs2MatchmakingSeasonGatheringCache.cache_key(
            tier,
            season_gathering_name
        ),
        callback_id
    )


func subscribe_model_with_initial_call(callback: Callable) -> Gs2AsyncResult:
    var model_result = await model()
    if model_result.error != null:
        return model_result
    var callback_id = subscribe_model(callback)
    callback.call(model_result.result)
    return Gs2AsyncResult.new(callback_id, null)