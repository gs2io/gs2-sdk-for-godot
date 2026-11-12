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
class_name Gs2MissionNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2MissionRestClient
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
    _client = Gs2MissionRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2MissionGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MissionGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2MissionGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MissionGetNamespaceMethodCache.invoke(
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
    request: Gs2MissionUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MissionUpdateNamespaceMethodCache.invoke(
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
    request: Gs2MissionDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MissionDeleteNamespaceMethodCache.invoke(
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


func create_counter_model_master(
    request: Gs2MissionCreateCounterModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MissionCreateCounterModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_counter_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MissionCounterModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_mission_group_model_master(
    request: Gs2MissionCreateMissionGroupModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2MissionCreateMissionGroupModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_mission_group_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2MissionMissionGroupModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_mission_master(
) -> Gs2MissionCurrentMissionMasterDomain:
    return Gs2MissionCurrentMissionMasterDomain.new(
        _gs2,
        namespace_name
    )


func mission_group_models(
) -> Gs2MissionDescribeMissionGroupModelsIterator:
    return Gs2MissionDescribeMissionGroupModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_mission_group_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionMissionGroupModel",
        Gs2MissionMissionGroupModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_mission_group_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionMissionGroupModel",
        Gs2MissionMissionGroupModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_mission_group_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionMissionGroupModel",
        Gs2MissionMissionGroupModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func mission_group_model(
    mission_group_name
) -> Gs2MissionMissionGroupModelDomain:
    return Gs2MissionMissionGroupModelDomain.new(
        _gs2,
        namespace_name,
        mission_group_name
    )


func counter_models(
) -> Gs2MissionDescribeCounterModelsIterator:
    return Gs2MissionDescribeCounterModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_counter_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionCounterModel",
        Gs2MissionCounterModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_counter_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionCounterModel",
        Gs2MissionCounterModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_counter_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionCounterModel",
        Gs2MissionCounterModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func counter_model(
    counter_name
) -> Gs2MissionCounterModelDomain:
    return Gs2MissionCounterModelDomain.new(
        _gs2,
        namespace_name,
        counter_name
    )
func user(
    user_id
) -> Gs2MissionUserDomain:
    return Gs2MissionUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2MissionUserAccessTokenDomain:
    return Gs2MissionUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func counter_model_masters(
    name_prefix = null
) -> Gs2MissionDescribeCounterModelMastersIterator:
    return Gs2MissionDescribeCounterModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_counter_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionCounterModelMaster",
        Gs2MissionCounterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_counter_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionCounterModelMaster",
        Gs2MissionCounterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_counter_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionCounterModelMaster",
        Gs2MissionCounterModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func counter_model_master(
    counter_name
) -> Gs2MissionCounterModelMasterDomain:
    return Gs2MissionCounterModelMasterDomain.new(
        _gs2,
        namespace_name,
        counter_name
    )


func mission_group_model_masters(
    name_prefix = null
) -> Gs2MissionDescribeMissionGroupModelMastersIterator:
    return Gs2MissionDescribeMissionGroupModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_mission_group_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionMissionGroupModelMaster",
        Gs2MissionMissionGroupModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_mission_group_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionMissionGroupModelMaster",
        Gs2MissionMissionGroupModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_mission_group_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionMissionGroupModelMaster",
        Gs2MissionMissionGroupModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func mission_group_model_master(
    mission_group_name
) -> Gs2MissionMissionGroupModelMasterDomain:
    return Gs2MissionMissionGroupModelMasterDomain.new(
        _gs2,
        namespace_name,
        mission_group_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2MissionNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2MissionNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2MissionGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2MissionNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2MissionNamespace",
        Gs2MissionNamespaceCache.cache_parent_key(
            null
        ),
        Gs2MissionNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2MissionNamespace",
        Gs2MissionNamespaceCache.cache_parent_key(
            null
        ),
        Gs2MissionNamespaceCache.cache_key(
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