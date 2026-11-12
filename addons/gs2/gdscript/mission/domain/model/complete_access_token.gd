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
class_name Gs2MissionCompleteAccessTokenDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2MissionRestClient
var namespace_name: Variant = null
var access_token: Gs2AuthAccessToken
var user_id: Variant:
    get:
        return null if access_token == null else access_token.user_id
var mission_group_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_,
    access_token_,
    mission_group_name_
):
    _gs2 = gs2
    _client = Gs2MissionRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    access_token = access_token_
    mission_group_name = mission_group_name_


func complete(
    request: Gs2MissionCompleteRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_mission_group_name(mission_group_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    if speculative_execute:
        var speculative_result = await Gs2MissionCompleteByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2MissionCompleteByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2MissionCompleteMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.complete(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction(
        _gs2,
        access_token,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)


func batch(
    request: Gs2MissionBatchCompleteRequest,
    speculative_execute: bool = true
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_mission_group_name(mission_group_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    if speculative_execute:
        var speculative_result = await Gs2MissionBatchCompleteByUserIdTransactionSpeculativeExecutor.execute(
            _gs2,
            access_token,
            Gs2MissionBatchCompleteByUserIdRequest.from_dict(request.to_dict())
        )
        if speculative_result.error != null:
            return speculative_result
        if speculative_result.result is Callable:
            speculative_result.result.call()
    var async_result = await Gs2MissionBatchCompleteMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.batch_complete(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var transaction = Gs2TransactionDomainFactory.to_transaction(
        _gs2,
        access_token,
        false if result.auto_run_stamp_sheet == null else result.auto_run_stamp_sheet,
        result.transaction_id,
        result.stamp_sheet,
        result.stamp_sheet_encryption_key_id,
        result.atomic_commit,
        result.transaction_result,
        result.metadata
    )
    if result.stamp_sheet != null:
        var wait_result = await transaction.wait(true)
        if wait_result.error != null:
            return wait_result
    return Gs2AsyncResult.new(transaction, null)


func get_(
    request: Gs2MissionGetCompleteRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_mission_group_name(mission_group_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2MissionGetCompleteMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.get_complete(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func evaluate(
    request: Gs2MissionEvaluateCompleteRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    request = request.with_mission_group_name(mission_group_name)
    var async_result = await Gs2MissionEvaluateCompleteMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.evaluate_complete(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func verify(
    request: Gs2MissionVerifyCompleteRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_mission_group_name(mission_group_name)
    request = request.with_access_token(null if access_token == null else access_token.token)
    var async_result = await Gs2MissionVerifyCompleteMethodCache.invoke(
        _gs2.cache,
        user_id,
        (null if access_token == null else access_token.time_offset),
        request,
        func(): return await _client.verify_complete(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2MissionCompleteCache.get_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        mission_group_name,
        (null if access_token == null else access_token.time_offset)
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MissionCompleteCache.fetch(
        _gs2.cache,
        namespace_name,
        user_id,
        mission_group_name,
        (null if access_token == null else access_token.time_offset),
        func():
            var get_result = await get_(Gs2MissionGetCompleteRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MissionCompleteCache.delete_cache(
        _gs2.cache,
        namespace_name,
        user_id,
        mission_group_name,
        (null if access_token == null else access_token.time_offset)
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MissionComplete",
        Gs2MissionCompleteCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2MissionCompleteCache.cache_key(
            mission_group_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MissionComplete",
        Gs2MissionCompleteCache.cache_parent_key(
            namespace_name,
            user_id,
            (null if access_token == null else access_token.time_offset)
        ),
        Gs2MissionCompleteCache.cache_key(
            mission_group_name
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