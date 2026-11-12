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
class_name Gs2DeployEventDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2DeployRestClient
var stack_name: Variant = null
var event_name: Variant = null


func _init(
    gs2: Gs2DomainCore,
    stack_name_,
    event_name_
):
    _gs2 = gs2
    _client = Gs2DeployRestClient.new(gs2.rest_session)
    stack_name = stack_name_
    event_name = event_name_


func get_(
    request: Gs2DeployGetEventRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    request = request.with_event_name(event_name)
    var async_result = await Gs2DeployGetEventMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_event(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2DeployEventCache.get_cache(
        _gs2.cache,
        stack_name,
        event_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2DeployEventCache.fetch(
        _gs2.cache,
        stack_name,
        event_name,
        null,
        func():
            var get_result = await get_(Gs2DeployGetEventRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2DeployEventCache.delete_cache(
        _gs2.cache,
        stack_name,
        event_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2DeployEvent",
        Gs2DeployEventCache.cache_parent_key(
            stack_name,
            null
        ),
        Gs2DeployEventCache.cache_key(
            event_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2DeployEvent",
        Gs2DeployEventCache.cache_parent_key(
            stack_name,
            null
        ),
        Gs2DeployEventCache.cache_key(
            event_name
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