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
class_name Gs2QuestNamespaceDomain
extends RefCounted

var _gs2: Gs2Domain
var _client: Gs2QuestRestClient
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
    _client = Gs2QuestRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2QuestGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2QuestGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2QuestGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2QuestGetNamespaceMethodCache.invoke(
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
    request: Gs2QuestUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2QuestUpdateNamespaceMethodCache.invoke(
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
    request: Gs2QuestDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2QuestDeleteNamespaceMethodCache.invoke(
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


func create_quest_group_model_master(
    request: Gs2QuestCreateQuestGroupModelMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2QuestCreateQuestGroupModelMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_quest_group_model_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2QuestQuestGroupModelMasterDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)
func current_quest_master(
) -> Gs2QuestCurrentQuestMasterDomain:
    return Gs2QuestCurrentQuestMasterDomain.new(
        _gs2,
        namespace_name
    )


func quest_group_models(
) -> Gs2QuestDescribeQuestGroupModelsIterator:
    return Gs2QuestDescribeQuestGroupModelsIterator.new(
        _gs2,
        _client,
        namespace_name
    )


func subscribe_quest_group_models(
    callback: Callable
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2QuestQuestGroupModel",
        Gs2QuestQuestGroupModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_quest_group_models(
    callback_id: int
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2QuestQuestGroupModel",
        Gs2QuestQuestGroupModelCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_quest_group_models(
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2QuestQuestGroupModel",
        Gs2QuestQuestGroupModelCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func quest_group_model(
    quest_group_name
) -> Gs2QuestQuestGroupModelDomain:
    return Gs2QuestQuestGroupModelDomain.new(
        _gs2,
        namespace_name,
        quest_group_name
    )
func user(
    user_id
) -> Gs2QuestUserDomain:
    return Gs2QuestUserDomain.new(
        _gs2,
        namespace_name,
        user_id
    )


func access_token(
    access_token_
) -> Gs2QuestUserAccessTokenDomain:
    return Gs2QuestUserAccessTokenDomain.new(
        _gs2,
        namespace_name,
        access_token_
    )


func quest_group_model_masters(
    name_prefix = null
) -> Gs2QuestDescribeQuestGroupModelMastersIterator:
    return Gs2QuestDescribeQuestGroupModelMastersIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_quest_group_model_masters(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2QuestQuestGroupModelMaster",
        Gs2QuestQuestGroupModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_quest_group_model_masters(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2QuestQuestGroupModelMaster",
        Gs2QuestQuestGroupModelMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_quest_group_model_masters(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2QuestQuestGroupModelMaster",
        Gs2QuestQuestGroupModelMasterCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func quest_group_model_master(
    quest_group_name
) -> Gs2QuestQuestGroupModelMasterDomain:
    return Gs2QuestQuestGroupModelMasterDomain.new(
        _gs2,
        namespace_name,
        quest_group_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2QuestNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2QuestNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2QuestGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2QuestNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2QuestNamespace",
        Gs2QuestNamespaceCache.cache_parent_key(
            null
        ),
        Gs2QuestNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2QuestNamespace",
        Gs2QuestNamespaceCache.cache_parent_key(
            null
        ),
        Gs2QuestNamespaceCache.cache_key(
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