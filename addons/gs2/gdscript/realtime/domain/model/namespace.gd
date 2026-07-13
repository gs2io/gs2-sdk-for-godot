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
class_name Gs2RealtimeNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2RealtimeRestClient
var namespace_name: Variant = null
var status: Variant = null
var timestamp: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2Domain,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2RealtimeRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2RealtimeGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2RealtimeGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2RealtimeGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2RealtimeGetNamespaceMethodCache.invoke(
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
    request: Gs2RealtimeUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2RealtimeUpdateNamespaceMethodCache.invoke(
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
    request: Gs2RealtimeDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2RealtimeDeleteNamespaceMethodCache.invoke(
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


func want_room(
    request: Gs2RealtimeWantRoomRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2RealtimeWantRoomMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.want_room(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2RealtimeRoomDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func rooms(
) -> Gs2RealtimeDescribeRoomsIterator:
    return Gs2RealtimeDescribeRoomsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_rooms(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2RealtimeRoom",
        Gs2RealtimeRoomCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_rooms(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2RealtimeRoom",
        Gs2RealtimeRoomCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_rooms(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2RealtimeRoom",
        Gs2RealtimeRoomCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func room(
    room_name
) -> Gs2RealtimeRoomDomain:
    return Gs2RealtimeRoomDomain.new(
        _gs2,
        namespace_name,
        room_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2RealtimeNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2RealtimeNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2RealtimeGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2RealtimeNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2RealtimeNamespace",
        Gs2RealtimeNamespaceCache.cache_parent_key(
            null
        ),
        Gs2RealtimeNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2RealtimeNamespace",
        Gs2RealtimeNamespaceCache.cache_parent_key(
            null
        ),
        Gs2RealtimeNamespaceCache.cache_key(
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