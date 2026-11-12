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
class_name Gs2Enhance
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2EnhanceRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2EnhanceRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2EnhanceCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2EnhanceNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2EnhanceDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_dump_user_data(
    request: Gs2EnhanceCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceCheckDumpUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_dump_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func clean_user_data(
    request: Gs2EnhanceCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_clean_user_data(
    request: Gs2EnhanceCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceCheckCleanUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_clean_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func prepare_import_user_data(
    request: Gs2EnhancePrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhancePrepareImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.prepare_import_user_data_by_user_id(request)
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


func import_user_data(
    request: Gs2EnhanceImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    return Gs2AsyncResult.new(domain, null)


func check_import_user_data(
    request: Gs2EnhanceCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnhanceCheckImportUserDataByUserIdMethodCache.invoke(
        _gs2.cache,
        null,
        null,
        request,
        func(): return await _client.check_import_user_data_by_user_id(request)
    )
    if async_result.error != null:
        return async_result
    var result = async_result.result
    var domain = self
    self.url = null if result == null else result.url
    domain.url = self.url
    return Gs2AsyncResult.new(domain, null)


func namespaces(
    name_prefix = null
) -> Gs2EnhanceDescribeNamespacesIterator:
    return Gs2EnhanceDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnhanceNamespace",
        Gs2EnhanceNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnhanceNamespace",
        Gs2EnhanceNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnhanceNamespace",
        Gs2EnhanceNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2EnhanceNamespaceDomain:
    return Gs2EnhanceNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var direct_enhance_by_user_id_complete_callbacks: Array = []


static var unleash_by_user_id_complete_callbacks: Array = []


static var create_progress_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DirectEnhanceByUserId":
        var request_model = Gs2EnhanceDirectEnhanceByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnhanceDirectEnhanceByUserIdResult.from_dict(JSON.parse_string(result))
        for callback in direct_enhance_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "UnleashByUserId":
        var request_model = Gs2EnhanceUnleashByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnhanceUnleashByUserIdResult.from_dict(JSON.parse_string(result))
        for callback in unleash_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "CreateProgressByUserId":
        var request_model = Gs2EnhanceCreateProgressByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnhanceCreateProgressByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnhanceCreateProgressByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in create_progress_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var delete_progress_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DeleteProgressByUserId":
        var request_model = Gs2EnhanceDeleteProgressByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnhanceDeleteProgressByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnhanceDeleteProgressByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in delete_progress_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    if method == "direct_enhance_by_user_id":
        var request_model = Gs2EnhanceDirectEnhanceByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnhanceDirectEnhanceByUserIdResult.from_dict(JSON.parse_string(result.result))
        for callback in direct_enhance_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "unleash_by_user_id":
        var request_model = Gs2EnhanceUnleashByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnhanceUnleashByUserIdResult.from_dict(JSON.parse_string(result.result))
        for callback in unleash_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "create_progress_by_user_id":
        var request_model = Gs2EnhanceCreateProgressByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnhanceCreateProgressByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2EnhanceCreateProgressByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in create_progress_by_user_id_complete_callbacks:
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