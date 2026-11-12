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
class_name Gs2Script
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2ScriptRestClient


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2ScriptRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2ScriptCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ScriptCreateNamespaceMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.create_namespace(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var ref = null if result == null else result.item
    var domain = Gs2ScriptNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func namespaces(
    name_prefix = null
) -> Gs2ScriptDescribeNamespacesIterator:
    return Gs2ScriptDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ScriptNamespace",
        Gs2ScriptNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ScriptNamespace",
        Gs2ScriptNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ScriptNamespace",
        Gs2ScriptNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2ScriptNamespaceDomain:
    return Gs2ScriptNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var invoke_script_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "InvokeScript":
        var request_model = Gs2ScriptInvokeScriptRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ScriptInvokeScriptResult.from_dict(JSON.parse_string(result))
        Gs2ScriptInvokeScriptMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in invoke_script_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    if method == "invoke_script":
        var request_model = Gs2ScriptInvokeScriptRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ScriptInvokeScriptResult.from_dict(JSON.parse_string(result.result))
        Gs2ScriptInvokeScriptMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in invoke_script_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    pass