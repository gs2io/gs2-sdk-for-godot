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
class_name Gs2Exchange
extends RefCounted



var _gs2: Gs2Domain
var _client: Gs2ExchangeRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2ExchangeRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2ExchangeCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2ExchangeNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2ExchangeDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExchangeCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExchangeCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExchangeCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExchangePrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangePrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExchangeImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExchangeCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExchangeCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2ExchangeDescribeNamespacesIterator:
    return Gs2ExchangeDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExchangeNamespace",
        Gs2ExchangeNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExchangeNamespace",
        Gs2ExchangeNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExchangeNamespace",
        Gs2ExchangeNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2ExchangeNamespaceDomain:
    return Gs2ExchangeNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var exchange_by_user_id_complete_callbacks: Array = []


static var incremental_exchange_by_user_id_complete_callbacks: Array = []


static var create_await_by_user_id_complete_callbacks: Array = []


static var acquire_force_by_user_id_complete_callbacks: Array = []


static var skip_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "ExchangeByUserId":
        var request_model = Gs2ExchangeExchangeByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExchangeExchangeByUserIdResult.from_dict(JSON.parse_string(result))
        for callback in exchange_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "IncrementalExchangeByUserId":
        var request_model = Gs2ExchangeIncrementalExchangeByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExchangeIncrementalExchangeByUserIdResult.from_dict(JSON.parse_string(result))
        for callback in incremental_exchange_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "CreateAwaitByUserId":
        var request_model = Gs2ExchangeCreateAwaitByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExchangeCreateAwaitByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExchangeCreateAwaitByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in create_await_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireForceByUserId":
        var request_model = Gs2ExchangeAcquireForceByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExchangeAcquireForceByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExchangeAcquireForceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_force_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SkipByUserId":
        var request_model = Gs2ExchangeSkipByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExchangeSkipByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExchangeSkipByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in skip_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var delete_await_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DeleteAwaitByUserId":
        var request_model = Gs2ExchangeDeleteAwaitByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExchangeDeleteAwaitByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExchangeDeleteAwaitByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in delete_await_by_user_id_complete_callbacks:
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
    if method == "exchange_by_user_id":
        var request_model = Gs2ExchangeExchangeByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExchangeExchangeByUserIdResult.from_dict(JSON.parse_string(result.result))
        for callback in exchange_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "incremental_exchange_by_user_id":
        var request_model = Gs2ExchangeIncrementalExchangeByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExchangeIncrementalExchangeByUserIdResult.from_dict(JSON.parse_string(result.result))
        for callback in incremental_exchange_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "create_await_by_user_id":
        var request_model = Gs2ExchangeCreateAwaitByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExchangeCreateAwaitByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExchangeCreateAwaitByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in create_await_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_force_by_user_id":
        var request_model = Gs2ExchangeAcquireForceByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExchangeAcquireForceByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExchangeAcquireForceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_force_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "skip_by_user_id":
        var request_model = Gs2ExchangeSkipByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExchangeSkipByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExchangeSkipByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in skip_by_user_id_complete_callbacks:
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