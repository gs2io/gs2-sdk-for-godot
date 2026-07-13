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
class_name Gs2Stamina
extends RefCounted



var _gs2: Gs2Domain
var _client: Gs2StaminaRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2StaminaRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2StaminaCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2StaminaNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2StaminaDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2StaminaCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2StaminaCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2StaminaCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2StaminaPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2StaminaImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2StaminaCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2StaminaCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2StaminaDescribeNamespacesIterator:
    return Gs2StaminaDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2StaminaNamespace",
        Gs2StaminaNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2StaminaNamespace",
        Gs2StaminaNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2StaminaNamespace",
        Gs2StaminaNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2StaminaNamespaceDomain:
    return Gs2StaminaNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var recover_stamina_by_user_id_complete_callbacks: Array = []


static var raise_max_value_by_user_id_complete_callbacks: Array = []


static var set_max_value_by_user_id_complete_callbacks: Array = []


static var set_recover_interval_by_user_id_complete_callbacks: Array = []


static var set_recover_value_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "RecoverStaminaByUserId":
        var request_model = Gs2StaminaRecoverStaminaByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaRecoverStaminaByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaRecoverStaminaByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in recover_stamina_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "RaiseMaxValueByUserId":
        var request_model = Gs2StaminaRaiseMaxValueByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaRaiseMaxValueByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaRaiseMaxValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in raise_max_value_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetMaxValueByUserId":
        var request_model = Gs2StaminaSetMaxValueByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaSetMaxValueByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaSetMaxValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_max_value_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetRecoverIntervalByUserId":
        var request_model = Gs2StaminaSetRecoverIntervalByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaSetRecoverIntervalByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaSetRecoverIntervalByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_recover_interval_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetRecoverValueByUserId":
        var request_model = Gs2StaminaSetRecoverValueByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaSetRecoverValueByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaSetRecoverValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_recover_value_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var decrease_max_value_by_user_id_complete_callbacks: Array = []


static var consume_stamina_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "DecreaseMaxValueByUserId":
        var request_model = Gs2StaminaDecreaseMaxValueByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaDecreaseMaxValueByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaDecreaseMaxValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in decrease_max_value_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "ConsumeStaminaByUserId":
        var request_model = Gs2StaminaConsumeStaminaByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2StaminaConsumeStaminaByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2StaminaConsumeStaminaByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in consume_stamina_by_user_id_complete_callbacks:
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
    if method == "recover_stamina_by_user_id":
        var request_model = Gs2StaminaRecoverStaminaByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2StaminaRecoverStaminaByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2StaminaRecoverStaminaByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in recover_stamina_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "raise_max_value_by_user_id":
        var request_model = Gs2StaminaRaiseMaxValueByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2StaminaRaiseMaxValueByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2StaminaRaiseMaxValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in raise_max_value_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_max_value_by_user_id":
        var request_model = Gs2StaminaSetMaxValueByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2StaminaSetMaxValueByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2StaminaSetMaxValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_max_value_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_recover_interval_by_user_id":
        var request_model = Gs2StaminaSetRecoverIntervalByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2StaminaSetRecoverIntervalByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2StaminaSetRecoverIntervalByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_recover_interval_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_recover_value_by_user_id":
        var request_model = Gs2StaminaSetRecoverValueByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2StaminaSetRecoverValueByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2StaminaSetRecoverValueByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_recover_value_by_user_id_complete_callbacks:
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