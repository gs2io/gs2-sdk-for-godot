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
class_name Gs2MatchmakingNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2MatchmakingRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2MatchmakingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2MatchmakingGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingGetNamespaceStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2MatchmakingGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingGetNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2MatchmakingUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingUpdateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2MatchmakingDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingDeleteNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_namespace(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func create_rating_model_master(
    request: Gs2MatchmakingCreateRatingModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingCreateRatingModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_rating_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingRatingModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func vote_(
    request: Gs2MatchmakingVoteRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingVoteMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.vote(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingBallotDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.rating_name),
        (null if ref == null else ref.gathering_name),
        (null if ref == null else ref.number_of_player),
        request.key_id
    )
    return Gs2AsyncResult.new(domain, null)


func vote_multiple(
    request: Gs2MatchmakingVoteMultipleRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingVoteMultipleMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.vote_multiple(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingBallotDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.rating_name),
        (null if ref == null else ref.gathering_name),
        (null if ref == null else ref.number_of_player),
        request.key_id
    )
    return Gs2AsyncResult.new(domain, null)


func create_season_model_master(
    request: Gs2MatchmakingCreateSeasonModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MatchmakingCreateSeasonModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_season_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MatchmakingSeasonModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_model_master(
) -> Gs2MatchmakingCurrentModelMasterDomain:
    return Gs2MatchmakingCurrentModelMasterDomain.new(
        _gs2,
        namespace_name
    )
func user(
    user_id
) -> Gs2MatchmakingUserDomain:
    return Gs2MatchmakingUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2MatchmakingUserAccessTokenDomain:
    return Gs2MatchmakingUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func rating_models(
) -> Gs2MatchmakingDescribeRatingModelsIterator:
    return Gs2MatchmakingDescribeRatingModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_rating_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingRatingModel",
        Gs2MatchmakingRatingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rating_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingRatingModel",
        Gs2MatchmakingRatingModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rating_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingRatingModel",
        Gs2MatchmakingRatingModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rating_model(
    rating_name
) -> Gs2MatchmakingRatingModelDomain:
    return Gs2MatchmakingRatingModelDomain.new(
        _gs2,
        namespace_name,
        rating_name
    )


func rating_model_masters(
    name_prefix = null
) -> Gs2MatchmakingDescribeRatingModelMastersIterator:
    return Gs2MatchmakingDescribeRatingModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_rating_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingRatingModelMaster",
        Gs2MatchmakingRatingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rating_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingRatingModelMaster",
        Gs2MatchmakingRatingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rating_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingRatingModelMaster",
        Gs2MatchmakingRatingModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func rating_model_master(
    rating_name
) -> Gs2MatchmakingRatingModelMasterDomain:
    return Gs2MatchmakingRatingModelMasterDomain.new(
        _gs2,
        namespace_name,
        rating_name
    )
func vote(
    rating_name,
    gathering_name
) -> Gs2MatchmakingVoteDomain:
    return Gs2MatchmakingVoteDomain.new(
        _gs2,
        namespace_name,
        rating_name,
        gathering_name
    )


func season_models(
) -> Gs2MatchmakingDescribeSeasonModelsIterator:
    return Gs2MatchmakingDescribeSeasonModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_season_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingSeasonModel",
        Gs2MatchmakingSeasonModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_season_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingSeasonModel",
        Gs2MatchmakingSeasonModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_season_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingSeasonModel",
        Gs2MatchmakingSeasonModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func season_model(
    season_name
) -> Gs2MatchmakingSeasonModelDomain:
    return Gs2MatchmakingSeasonModelDomain.new(
        _gs2,
        namespace_name,
        season_name
    )


func season_model_masters(
    name_prefix = null
) -> Gs2MatchmakingDescribeSeasonModelMastersIterator:
    return Gs2MatchmakingDescribeSeasonModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_season_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MatchmakingSeasonModelMaster",
        Gs2MatchmakingSeasonModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_season_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MatchmakingSeasonModelMaster",
        Gs2MatchmakingSeasonModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_season_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MatchmakingSeasonModelMaster",
        Gs2MatchmakingSeasonModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func season_model_master(
    season_name
) -> Gs2MatchmakingSeasonModelMasterDomain:
    return Gs2MatchmakingSeasonModelMasterDomain.new(
        _gs2,
        namespace_name,
        season_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2MatchmakingNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MatchmakingNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2MatchmakingGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MatchmakingNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MatchmakingNamespace",
        Gs2MatchmakingNamespaceCache.cache_parent_key(
            null
        ),
        Gs2MatchmakingNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MatchmakingNamespace",
        Gs2MatchmakingNamespaceCache.cache_parent_key(
            null
        ),
        Gs2MatchmakingNamespaceCache.cache_key(
            namespace_name
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