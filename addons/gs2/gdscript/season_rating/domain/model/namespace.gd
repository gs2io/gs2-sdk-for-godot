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
class_name Gs2SeasonRatingNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2SeasonRatingRestClient
var namespace_name: Variant = null
var status: Variant = null
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2SeasonRatingRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2SeasonRatingGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2SeasonRatingGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingGetNamespaceMethodCache.invoke(
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
    request: Gs2SeasonRatingUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingUpdateNamespaceMethodCache.invoke(
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
    request: Gs2SeasonRatingDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingDeleteNamespaceMethodCache.invoke(
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


func create_season_model_master(
    request: Gs2SeasonRatingCreateSeasonModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingCreateSeasonModelMasterMethodCache.invoke(
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
    var domain = Gs2SeasonRatingSeasonModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_match_session(
    request: Gs2SeasonRatingCreateMatchSessionRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingCreateMatchSessionMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_match_session(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2SeasonRatingMatchSessionDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func vote_(
    request: Gs2SeasonRatingVoteRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingVoteMethodCache.invoke(
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
    var domain = Gs2SeasonRatingBallotDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.season_name),
        (null if ref == null else ref.session_name),
        (null if ref == null else ref.number_of_player),
        request.key_id
    )
    return Gs2AsyncResult.new(domain, null)


func vote_multiple(
    request: Gs2SeasonRatingVoteMultipleRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2SeasonRatingVoteMultipleMethodCache.invoke(
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
    var domain = Gs2SeasonRatingBallotDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.user_id),
        (null if ref == null else ref.season_name),
        (null if ref == null else ref.session_name),
        (null if ref == null else ref.number_of_player),
        request.key_id
    )
    return Gs2AsyncResult.new(domain, null)
func current_season_model_master(
) -> Gs2SeasonRatingCurrentSeasonModelMasterDomain:
    return Gs2SeasonRatingCurrentSeasonModelMasterDomain.new(
        _gs2,
        namespace_name
    )


func season_models(
) -> Gs2SeasonRatingDescribeSeasonModelsIterator:
    return Gs2SeasonRatingDescribeSeasonModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_season_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2SeasonRatingSeasonModel",
        Gs2SeasonRatingSeasonModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_season_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2SeasonRatingSeasonModel",
        Gs2SeasonRatingSeasonModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_season_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2SeasonRatingSeasonModel",
        Gs2SeasonRatingSeasonModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func season_model(
    season_name
) -> Gs2SeasonRatingSeasonModelDomain:
    return Gs2SeasonRatingSeasonModelDomain.new(
        _gs2,
        namespace_name,
        season_name
    )


func season_model_masters(
    name_prefix = null
) -> Gs2SeasonRatingDescribeSeasonModelMastersIterator:
    return Gs2SeasonRatingDescribeSeasonModelMastersIterator.new(
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
        "Gs2SeasonRatingSeasonModelMaster",
        Gs2SeasonRatingSeasonModelMasterCache.cache_parent_key(
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
        "Gs2SeasonRatingSeasonModelMaster",
        Gs2SeasonRatingSeasonModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_season_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2SeasonRatingSeasonModelMaster",
        Gs2SeasonRatingSeasonModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func season_model_master(
    season_name
) -> Gs2SeasonRatingSeasonModelMasterDomain:
    return Gs2SeasonRatingSeasonModelMasterDomain.new(
        _gs2,
        namespace_name,
        season_name
    )
func user(
    user_id
) -> Gs2SeasonRatingUserDomain:
    return Gs2SeasonRatingUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2SeasonRatingUserAccessTokenDomain:
    return Gs2SeasonRatingUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func match_sessions(
) -> Gs2SeasonRatingDescribeMatchSessionsIterator:
    return Gs2SeasonRatingDescribeMatchSessionsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_match_sessions(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2SeasonRatingMatchSession",
        Gs2SeasonRatingMatchSessionCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_match_sessions(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2SeasonRatingMatchSession",
        Gs2SeasonRatingMatchSessionCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_match_sessions(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2SeasonRatingMatchSession",
        Gs2SeasonRatingMatchSessionCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func match_session(
    session_name
) -> Gs2SeasonRatingMatchSessionDomain:
    return Gs2SeasonRatingMatchSessionDomain.new(
        _gs2,
        namespace_name,
        session_name
    )
func vote(
    season_name,
    session_name
) -> Gs2SeasonRatingVoteDomain:
    return Gs2SeasonRatingVoteDomain.new(
        _gs2,
        namespace_name,
        season_name,
        session_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2SeasonRatingNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2SeasonRatingNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2SeasonRatingGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2SeasonRatingNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2SeasonRatingNamespace",
        Gs2SeasonRatingNamespaceCache.cache_parent_key(
            null
        ),
        Gs2SeasonRatingNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2SeasonRatingNamespace",
        Gs2SeasonRatingNamespaceCache.cache_parent_key(
            null
        ),
        Gs2SeasonRatingNamespaceCache.cache_key(
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