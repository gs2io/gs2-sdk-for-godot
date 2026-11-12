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
class_name Gs2FreezeStageDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2FreezeRestClient
var stage_name: Variant = null
var source: Variant = null
var current: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    stage_name_
):
    _gs2 = gs2
    _client = Gs2FreezeRestClient.new(gs2.rest_session)
    stage_name = stage_name_


func get_(
    request: Gs2FreezeGetStageRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stage_name(stage_name)
    var async_result = await Gs2FreezeGetStageMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_stage(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func promote(
    request: Gs2FreezePromoteStageRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stage_name(stage_name)
    var async_result = await Gs2FreezePromoteStageMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.promote_stage(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func rollback(
    request: Gs2FreezeRollbackStageRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stage_name(stage_name)
    var async_result = await Gs2FreezeRollbackStageMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.rollback_stage(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func outputs(
) -> Gs2FreezeDescribeOutputsIterator:
    return Gs2FreezeDescribeOutputsIterator.new(
        _gs2,
        _client,
        stage_name
    )


func subscribe_outputs(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FreezeOutput",
        Gs2FreezeOutputCache.cache_parent_key(
            stage_name,
            null
        ),
        callback
    )


func unsubscribe_outputs(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FreezeOutput",
        Gs2FreezeOutputCache.cache_parent_key(
            stage_name,
            null
        ),
        callback_id
    )


func invalidate_outputs(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FreezeOutput",
        Gs2FreezeOutputCache.cache_parent_key(
            stage_name,
            null
        )
    )
func output(
    output_name
) -> Gs2FreezeOutputDomain:
    return Gs2FreezeOutputDomain.new(
        _gs2,
        stage_name,
        output_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2FreezeStageCache.get_cache(
        _gs2.cache,
        stage_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2FreezeStageCache.fetch(
        _gs2.cache,
        stage_name,
        null,
        func():
            var get_result = await get_(Gs2FreezeGetStageRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2FreezeStageCache.delete_cache(
        _gs2.cache,
        stage_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FreezeStage",
        Gs2FreezeStageCache.cache_parent_key(
            null
        ),
        Gs2FreezeStageCache.cache_key(
            stage_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FreezeStage",
        Gs2FreezeStageCache.cache_parent_key(
            null
        ),
        Gs2FreezeStageCache.cache_key(
            stage_name
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