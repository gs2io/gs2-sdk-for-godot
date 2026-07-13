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
class_name Gs2DeployStackDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2DeployRestClient
var stack_name: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null
var status: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    stack_name_
):
    _gs2 = gs2
    _client = Gs2DeployRestClient.new(gs2.rest_session)
    stack_name = stack_name_


func get_status(
    request: Gs2DeployGetStackStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployGetStackStatusMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_stack_status(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.status = null if result == null else result.status
    domain.status = self.status
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2DeployGetStackRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployGetStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_stack(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func pre_update(
    request: Gs2DeployPreUpdateStackRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployPreUpdateStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.pre_update_stack(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.upload_token = null if result == null else result.upload_token
    domain.upload_token = self.upload_token
    self.upload_url = null if result == null else result.upload_url
    domain.upload_url = self.upload_url
    return Gs2AsyncResult.new(domain, null)


func update(
    request: Gs2DeployUpdateStackRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployUpdateStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_stack(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func pre_change_set(
    request: Gs2DeployPreChangeSetRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployPreChangeSetMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.pre_change_set(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.upload_token = null if result == null else result.upload_token
    domain.upload_token = self.upload_token
    self.upload_url = null if result == null else result.upload_url
    domain.upload_url = self.upload_url
    return Gs2AsyncResult.new(domain, null)


func change_set(
    request: Gs2DeployChangeSetRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployChangeSetMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.change_set(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.items, null)


func update_from_git_hub(
    request: Gs2DeployUpdateStackFromGitHubRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployUpdateStackFromGitHubMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_stack_from_git_hub(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2DeployDeleteStackRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployDeleteStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_stack(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func force_delete(
    request: Gs2DeployForceDeleteStackRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployForceDeleteStackMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.force_delete_stack(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_resources(
    request: Gs2DeployDeleteStackResourcesRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployDeleteStackResourcesMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_stack_resources(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete_entity(
    request: Gs2DeployDeleteStackEntityRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_stack_name(stack_name)
    var async_result = await Gs2DeployDeleteStackEntityMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_stack_entity(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func resources(
) -> Gs2DeployDescribeResourcesIterator:
    return Gs2DeployDescribeResourcesIterator.new(
        _gs2,
        _client,
        stack_name
    )


func subscribe_resources(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DeployResource",
        Gs2DeployResourceCache.cache_parent_key(
            stack_name,
            null
        ),
        callback
    )


func unsubscribe_resources(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DeployResource",
        Gs2DeployResourceCache.cache_parent_key(
            stack_name,
            null
        ),
        callback_id
    )


func invalidate_resources(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DeployResource",
        Gs2DeployResourceCache.cache_parent_key(
            stack_name,
            null
        )
    )
func resource(
    resource_name
) -> Gs2DeployResourceDomain:
    return Gs2DeployResourceDomain.new(
        _gs2,
        stack_name,
        resource_name
    )


func events(
) -> Gs2DeployDescribeEventsIterator:
    return Gs2DeployDescribeEventsIterator.new(
        _gs2,
        _client,
        stack_name
    )


func subscribe_events(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DeployEvent",
        Gs2DeployEventCache.cache_parent_key(
            stack_name,
            null
        ),
        callback
    )


func unsubscribe_events(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DeployEvent",
        Gs2DeployEventCache.cache_parent_key(
            stack_name,
            null
        ),
        callback_id
    )


func invalidate_events(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DeployEvent",
        Gs2DeployEventCache.cache_parent_key(
            stack_name,
            null
        )
    )
func event(
    event_name
) -> Gs2DeployEventDomain:
    return Gs2DeployEventDomain.new(
        _gs2,
        stack_name,
        event_name
    )


func outputs(
) -> Gs2DeployDescribeOutputsIterator:
    return Gs2DeployDescribeOutputsIterator.new(
        _gs2,
        _client,
        stack_name
    )


func subscribe_outputs(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2DeployOutput",
        Gs2DeployOutputCache.cache_parent_key(
            stack_name,
            null
        ),
        callback
    )


func unsubscribe_outputs(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2DeployOutput",
        Gs2DeployOutputCache.cache_parent_key(
            stack_name,
            null
        ),
        callback_id
    )


func invalidate_outputs(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2DeployOutput",
        Gs2DeployOutputCache.cache_parent_key(
            stack_name,
            null
        )
    )
func output(
    output_name
) -> Gs2DeployOutputDomain:
    return Gs2DeployOutputDomain.new(
        _gs2,
        stack_name,
        output_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2DeployStackCache.get_cache(
        _gs2.cache,
        stack_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2DeployStackCache.fetch(
        _gs2.cache,
        stack_name,
        null,
        func():
            var get_result = await get_(Gs2DeployGetStackRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2DeployStackCache.delete_cache(
        _gs2.cache,
        stack_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2DeployStack",
        Gs2DeployStackCache.cache_parent_key(
            null
        ),
        Gs2DeployStackCache.cache_key(
            stack_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2DeployStack",
        Gs2DeployStackCache.cache_parent_key(
            null
        ),
        Gs2DeployStackCache.cache_key(
            stack_name
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