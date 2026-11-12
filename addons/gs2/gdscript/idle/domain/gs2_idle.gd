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
class_name Gs2Idle
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2IdleRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2IdleRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2IdleCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2IdleNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2IdleDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2IdleCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2IdleCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2IdleCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2IdlePrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdlePrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2IdleImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2IdleCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2IdleCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2IdleDescribeNamespacesIterator:
    return Gs2IdleDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2IdleNamespace",
        Gs2IdleNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2IdleNamespace",
        Gs2IdleNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2IdleNamespace",
        Gs2IdleNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2IdleNamespaceDomain:
    return Gs2IdleNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var increase_maximum_idle_minutes_by_user_id_complete_callbacks: Array = []


static var set_maximum_idle_minutes_by_user_id_complete_callbacks: Array = []


static var receive_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "IncreaseMaximumIdleMinutesByUserId":
        var request_model = Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2IdleIncreaseMaximumIdleMinutesByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2IdleIncreaseMaximumIdleMinutesByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in increase_maximum_idle_minutes_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetMaximumIdleMinutesByUserId":
        var request_model = Gs2IdleSetMaximumIdleMinutesByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2IdleSetMaximumIdleMinutesByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2IdleSetMaximumIdleMinutesByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_maximum_idle_minutes_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "ReceiveByUserId":
        var request_model = Gs2IdleReceiveByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2IdleReceiveByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2IdleReceiveByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in receive_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var decrease_maximum_idle_minutes_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DecreaseMaximumIdleMinutesByUserId":
        var request_model = Gs2IdleDecreaseMaximumIdleMinutesByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2IdleDecreaseMaximumIdleMinutesByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2IdleDecreaseMaximumIdleMinutesByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in decrease_maximum_idle_minutes_by_user_id_complete_callbacks:
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
    if method == "increase_maximum_idle_minutes_by_user_id":
        var request_model = Gs2IdleIncreaseMaximumIdleMinutesByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2IdleIncreaseMaximumIdleMinutesByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2IdleIncreaseMaximumIdleMinutesByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in increase_maximum_idle_minutes_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_maximum_idle_minutes_by_user_id":
        var request_model = Gs2IdleSetMaximumIdleMinutesByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2IdleSetMaximumIdleMinutesByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2IdleSetMaximumIdleMinutesByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_maximum_idle_minutes_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "receive_by_user_id":
        var request_model = Gs2IdleReceiveByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2IdleReceiveByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2IdleReceiveByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in receive_by_user_id_complete_callbacks:
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