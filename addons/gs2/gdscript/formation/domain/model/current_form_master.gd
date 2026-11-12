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
class_name Gs2FormationCurrentFormMasterDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2FormationRestClient
var namespace_name: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2FormationRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func export_master(
    request: Gs2FormationExportMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationExportMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.export_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func get_(
    request: Gs2FormationGetCurrentFormMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationGetCurrentFormMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.get_current_form_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    return Gs2AsyncResult.new(null if result == null else result.item, null)


func pre_update(
    request: Gs2FormationPreUpdateCurrentFormMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationPreUpdateCurrentFormMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.pre_update_current_form_master(request)
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
    request: Gs2FormationUpdateCurrentFormMasterRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationUpdateCurrentFormMasterMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_current_form_master(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func update_from_git_hub(
    request: Gs2FormationUpdateCurrentFormMasterFromGitHubRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2FormationUpdateCurrentFormMasterFromGitHubMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.update_current_form_master_from_git_hub(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func model() -> Gs2AsyncResult:
    var pair = Gs2FormationCurrentFormMasterCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2FormationCurrentFormMasterCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2FormationGetCurrentFormMasterRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2FormationCurrentFormMasterCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2FormationCurrentFormMaster",
        Gs2FormationCurrentFormMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2FormationCurrentFormMasterCache.cache_key(
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2FormationCurrentFormMaster",
        Gs2FormationCurrentFormMasterCache.cache_parent_key(
            namespace_name,
            null
        ),
        Gs2FormationCurrentFormMasterCache.cache_key(
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