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
class_name Gs2LogLogEntryDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2LogRestClient
var parallels: Variant = null
var parallel_truncated: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2LogRestClient.new(gs2.rest_session)


func get_log(
    request: Gs2LogGetLogRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LogGetLogMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_log(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func facets(
    request: Gs2LogQueryFacetsRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LogQueryFacetsMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.query_facets(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = []
    if result != null and result.items != null:
        for v in result.items:
            domain.append(Gs2LogFacetDomain.new(
                _gs2
            ))
    return Gs2AsyncResult.new(domain, null)


func get_trace(
    request: Gs2LogGetTraceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2LogGetTraceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_trace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.parallels = null if result == null else result.parallels
    domain.parallels = self.parallels
    self.parallel_truncated = null if result == null else result.parallel_truncated
    domain.parallel_truncated = self.parallel_truncated
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2LogLogEntryCache.get_cache(
        _gs2.cache,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return Gs2AsyncResult.new(null, null)


func invalidate() -> void:
    Gs2LogLogEntryCache.delete_cache(
        _gs2.cache,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2LogLogEntry",
        Gs2LogLogEntryCache.cache_parent_key(
            null
        ),
        Gs2LogLogEntryCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2LogLogEntry",
        Gs2LogLogEntryCache.cache_parent_key(
            null
        ),
        Gs2LogLogEntryCache.cache_key(
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