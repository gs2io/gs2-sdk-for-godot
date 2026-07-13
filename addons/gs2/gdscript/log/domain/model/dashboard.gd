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
class_name Gs2LogDashboardDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var namespace_name: Variant = null
var dashboard_name: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_,
    dashboard_name_
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_
    dashboard_name = dashboard_name_


func get_(
    request: Gs2LogGetDashboardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_dashboard_name(dashboard_name)
    var async_result = await Gs2LogGetDashboardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_dashboard(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func update(
    request: Gs2LogUpdateDashboardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_dashboard_name(dashboard_name)
    var async_result = await Gs2LogUpdateDashboardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_dashboard(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func duplicate(
    request: Gs2LogDuplicateDashboardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_dashboard_name(dashboard_name)
    var async_result = await Gs2LogDuplicateDashboardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.duplicate_dashboard(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func delete(
    request: Gs2LogDeleteDashboardRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    request = request.with_dashboard_name(dashboard_name)
    var async_result = await Gs2LogDeleteDashboardMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.delete_dashboard(request)
    )
    if async_result.error != null and not (async_result.error is Gs2NotFoundException):
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2LogDashboardCache.get_cache(
        _gs2.cache,
        namespace_name,
        dashboard_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2LogDashboardCache.fetch(
        _gs2.cache,
        namespace_name,
        dashboard_name,
        null,
        func():
            var get_result = await get_(Gs2LogGetDashboardRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2LogDashboardCache.delete_cache(
        _gs2.cache,
        namespace_name,
        dashboard_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LogDashboard",
        Gs2LogDashboardCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2LogDashboardCache.cache_key(
            dashboard_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LogDashboard",
        Gs2LogDashboardCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2LogDashboardCache.cache_key(
            dashboard_name
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