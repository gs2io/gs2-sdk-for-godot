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
class_name Gs2Formation
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2FormationRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2FormationRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2FormationCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2FormationNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2FormationDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FormationCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FormationCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FormationCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FormationPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FormationImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2FormationCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2FormationCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2FormationDescribeNamespacesIterator:
    return Gs2FormationDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2FormationNamespace",
        Gs2FormationNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2FormationNamespace",
        Gs2FormationNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2FormationNamespace",
        Gs2FormationNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2FormationNamespaceDomain:
    return Gs2FormationNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var add_mold_capacity_by_user_id_complete_callbacks: Array = []


static var set_mold_capacity_by_user_id_complete_callbacks: Array = []


static var acquire_actions_to_form_properties_complete_callbacks: Array = []


static var set_form_by_user_id_complete_callbacks: Array = []


static var acquire_actions_to_property_form_properties_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "AddMoldCapacityByUserId":
        var request_model = Gs2FormationAddMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FormationAddMoldCapacityByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2FormationAddMoldCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_mold_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetMoldCapacityByUserId":
        var request_model = Gs2FormationSetMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FormationSetMoldCapacityByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2FormationSetMoldCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_mold_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireActionsToFormProperties":
        var request_model = Gs2FormationAcquireActionsToFormPropertiesRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FormationAcquireActionsToFormPropertiesResult.from_dict(JSON.parse_string(result))
        Gs2FormationAcquireActionsToFormPropertiesMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_actions_to_form_properties_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetFormByUserId":
        var request_model = Gs2FormationSetFormByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FormationSetFormByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2FormationSetFormByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_form_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AcquireActionsToPropertyFormProperties":
        var request_model = Gs2FormationAcquireActionsToPropertyFormPropertiesRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FormationAcquireActionsToPropertyFormPropertiesResult.from_dict(JSON.parse_string(result))
        Gs2FormationAcquireActionsToPropertyFormPropertiesMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_actions_to_property_form_properties_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var sub_mold_capacity_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "SubMoldCapacityByUserId":
        var request_model = Gs2FormationSubMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2FormationSubMoldCapacityByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2FormationSubMoldCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in sub_mold_capacity_by_user_id_complete_callbacks:
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
    if method == "add_mold_capacity_by_user_id":
        var request_model = Gs2FormationAddMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2FormationAddMoldCapacityByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2FormationAddMoldCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_mold_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_mold_capacity_by_user_id":
        var request_model = Gs2FormationSetMoldCapacityByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2FormationSetMoldCapacityByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2FormationSetMoldCapacityByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_mold_capacity_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_actions_to_form_properties":
        var request_model = Gs2FormationAcquireActionsToFormPropertiesRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2FormationAcquireActionsToFormPropertiesResult.from_dict(JSON.parse_string(result.result))
        Gs2FormationAcquireActionsToFormPropertiesMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_actions_to_form_properties_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_form_by_user_id":
        var request_model = Gs2FormationSetFormByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2FormationSetFormByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2FormationSetFormByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_form_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "acquire_actions_to_property_form_properties":
        var request_model = Gs2FormationAcquireActionsToPropertyFormPropertiesRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2FormationAcquireActionsToPropertyFormPropertiesResult.from_dict(JSON.parse_string(result.result))
        Gs2FormationAcquireActionsToPropertyFormPropertiesMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in acquire_actions_to_property_form_properties_complete_callbacks:
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