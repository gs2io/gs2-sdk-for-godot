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
class_name Gs2Mission
extends RefCounted

signal complete_notification(
    notification: Gs2MissionCompleteNotification
)



var _gs2: Gs2DomainCore
var _client: Gs2MissionRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2MissionRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2MissionCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2MissionNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2MissionDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2MissionCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2MissionCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2MissionCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2MissionPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2MissionImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2MissionCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2MissionCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2MissionDescribeNamespacesIterator:
    return Gs2MissionDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2MissionNamespace",
        Gs2MissionNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2MissionNamespace",
        Gs2MissionNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2MissionNamespace",
        Gs2MissionNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2MissionNamespaceDomain:
    return Gs2MissionNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var revert_receive_by_user_id_complete_callbacks: Array = []


static var increase_counter_by_user_id_complete_callbacks: Array = []


static var set_counter_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "RevertReceiveByUserId":
        var request_model = Gs2MissionRevertReceiveByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionRevertReceiveByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionRevertReceiveByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in revert_receive_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "IncreaseCounterByUserId":
        var request_model = Gs2MissionIncreaseCounterByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionIncreaseCounterByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionIncreaseCounterByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in increase_counter_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetCounterByUserId":
        var request_model = Gs2MissionSetCounterByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionSetCounterByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionSetCounterByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_counter_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var receive_by_user_id_complete_callbacks: Array = []


static var batch_receive_by_user_id_complete_callbacks: Array = []


static var decrease_counter_by_user_id_complete_callbacks: Array = []


static var reset_counter_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "ReceiveByUserId":
        var request_model = Gs2MissionReceiveByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionReceiveByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionReceiveByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in receive_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "BatchReceiveByUserId":
        var request_model = Gs2MissionBatchReceiveByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionBatchReceiveByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionBatchReceiveByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in batch_receive_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "DecreaseCounterByUserId":
        var request_model = Gs2MissionDecreaseCounterByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionDecreaseCounterByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionDecreaseCounterByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in decrease_counter_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "ResetCounterByUserId":
        var request_model = Gs2MissionResetCounterByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionResetCounterByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionResetCounterByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in reset_counter_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "VerifyCompleteByUserId":
        if result == null:
            return
        var request_model = Gs2MissionVerifyCompleteByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionVerifyCompleteByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionVerifyCompleteByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    if method == "VerifyCounterValueByUserId":
        if result == null:
            return
        var request_model = Gs2MissionVerifyCounterValueByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2MissionVerifyCounterValueByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2MissionVerifyCounterValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    pass


func update_cache_from_job_result(
    method: String,
    time_offset,
    job,
    result
) -> void:
    if method == "revert_receive_by_user_id":
        var request_model = Gs2MissionRevertReceiveByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2MissionRevertReceiveByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2MissionRevertReceiveByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in revert_receive_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "increase_counter_by_user_id":
        var request_model = Gs2MissionIncreaseCounterByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2MissionIncreaseCounterByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2MissionIncreaseCounterByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in increase_counter_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_counter_by_user_id":
        var request_model = Gs2MissionSetCounterByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2MissionSetCounterByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2MissionSetCounterByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_counter_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    pass


func handle_notification(
    action: String,
    payload
) -> void:
    var data = JSON.parse_string(payload) if payload is String else payload
    if action == "Complete":
        var notification: Gs2MissionCompleteNotification = Gs2MissionCompleteNotification.from_dict(data)
        if notification == null:
            return
        var n = notification
        _gs2.cache.delete(
            "Gs2MissionComplete",
            Gs2MissionCompleteCache.cache_parent_key(
                n.namespace_name,
                n.user_id,
                null
            ),
            Gs2MissionCompleteCache.cache_key(
                n.group_name
            )
        )
        complete_notification.emit(notification)
        return
    pass