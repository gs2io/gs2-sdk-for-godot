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
# deny overwrite
class_name Gs2ScriptNamespaceDomain
extends RefCounted

var _gs2: Gs2DomainCore
var _client: Gs2ScriptRestClient
var namespace_name: Variant = null
var status: Variant = null
var code: Variant = null
var result: Variant = null
var transaction = null  # diff +++
var execute_time: Variant = null
var charged: Variant = null
var output: Variant = null
var next_page_token: Variant = null


func _init(
    gs2: Gs2DomainCore,
    namespace_name_
):
    _gs2 = gs2
    _client = Gs2ScriptRestClient.new(gs2.rest_session)
    namespace_name = namespace_name_


func get_status(
    request: Gs2ScriptGetNamespaceStatusRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ScriptGetNamespaceStatusMethodCache.invoke(
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
    request: Gs2ScriptGetNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ScriptGetNamespaceMethodCache.invoke(
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
    request: Gs2ScriptUpdateNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ScriptUpdateNamespaceMethodCache.invoke(
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
    request: Gs2ScriptDeleteNamespaceRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ScriptDeleteNamespaceMethodCache.invoke(
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


func create_script(
    request: Gs2ScriptCreateScriptRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ScriptCreateScriptMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_script(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ScriptScriptDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func create_script_from_git_hub(
    request: Gs2ScriptCreateScriptFromGitHubRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    request = request.with_namespace_name(namespace_name)
    var async_result = await Gs2ScriptCreateScriptFromGitHubMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_script_from_git_hub(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ScriptScriptDomain.new(
        _gs2,
        namespace_name,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func invoke_script(
    request: Gs2ScriptInvokeScriptRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ScriptInvokeScriptMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.invoke_script(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.code = null if result == null else result.code
    domain.code = self.code
    self.result = null if result == null else result.result
    domain.result = self.result
    self.transaction = null if result == null else result.transaction  # diff +++
    domain.transaction = self.transaction  # diff +++
    self.execute_time = null if result == null else result.execute_time
    domain.execute_time = self.execute_time
    self.charged = null if result == null else result.charged
    domain.charged = self.charged
    self.output = null if result == null else result.output
    domain.output = self.output
    return Gs2AsyncResult.new(domain, null)


func debug_invoke(
    request: Gs2ScriptDebugInvokeRequest
) -> Gs2AsyncResult:
    request = request.with_context_stack(_gs2.default_context_stack if request.context_stack == null or request.context_stack == "" else request.context_stack)
    var async_result = await Gs2ScriptDebugInvokeMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.debug_invoke(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.code = null if result == null else result.code
    domain.code = self.code
    self.result = null if result == null else result.result
    domain.result = self.result
    self.transaction = null if result == null else result.transaction  # diff +++
    domain.transaction = self.transaction  # diff +++
    self.execute_time = null if result == null else result.execute_time
    domain.execute_time = self.execute_time
    self.charged = null if result == null else result.charged
    domain.charged = self.charged
    self.output = null if result == null else result.output
    domain.output = self.output
    return Gs2AsyncResult.new(domain, null)


func scripts(
    name_prefix = null
) -> Gs2ScriptDescribeScriptsIterator:
    return Gs2ScriptDescribeScriptsIterator.new(
        _gs2,
        _client,
        namespace_name,
        name_prefix
    )


func subscribe_scripts(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ScriptScript",
        Gs2ScriptScriptCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback
    )


func unsubscribe_scripts(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ScriptScript",
        Gs2ScriptScriptCache.cache_parent_key(
            namespace_name,
            null
        ),
        callback_id
    )


func invalidate_scripts(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ScriptScript",
        Gs2ScriptScriptCache.cache_parent_key(
            namespace_name,
            null
        )
    )
func script_(
    script_name
) -> Gs2ScriptScriptDomain:
    return Gs2ScriptScriptDomain.new(
        _gs2,
        namespace_name,
        script_name
    )


func model() -> Gs2AsyncResult:
    var pair = Gs2ScriptNamespaceCache.get_cache(
        _gs2.cache,
        namespace_name,
        null
    )
    if pair[1]:
        return Gs2AsyncResult.new(pair[0], null)
    return await Gs2ScriptNamespaceCache.fetch(
        _gs2.cache,
        namespace_name,
        null,
        func():
            var get_result = await get_(Gs2ScriptGetNamespaceRequest.new())
            return get_result
    )


func invalidate() -> void:
    Gs2ScriptNamespaceCache.delete_cache(
        _gs2.cache,
        namespace_name,
        null
    )


func subscribe_model(callback: Callable) -> int:
    return _gs2.cache.subscribe(
        "Gs2ScriptNamespace",
        Gs2ScriptNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ScriptNamespaceCache.cache_key(
            namespace_name
        ),
        callback,
        func(): await model()
    )


func unsubscribe_model(callback_id: int) -> void:
    _gs2.cache.unsubscribe(
        "Gs2ScriptNamespace",
        Gs2ScriptNamespaceCache.cache_parent_key(
            null
        ),
        Gs2ScriptNamespaceCache.cache_key(
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