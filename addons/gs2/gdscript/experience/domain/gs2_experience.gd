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
class_name Gs2Experience
extends RefCounted



var _gs2: Gs2DomainCore
var _client: Gs2ExperienceRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2DomainCore
):
    _gs2 = gs2
    _client = Gs2ExperienceRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2ExperienceCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2ExperienceNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2ExperienceDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExperienceCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExperienceCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExperienceCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExperiencePrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperiencePrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExperienceImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2ExperienceCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2ExperienceCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2ExperienceDescribeNamespacesIterator:
    return Gs2ExperienceDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2ExperienceNamespace",
        Gs2ExperienceNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2ExperienceNamespace",
        Gs2ExperienceNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2ExperienceNamespace",
        Gs2ExperienceNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2ExperienceNamespaceDomain:
    return Gs2ExperienceNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var add_experience_by_user_id_complete_callbacks: Array = []


static var set_experience_by_user_id_complete_callbacks: Array = []


static var add_rank_cap_by_user_id_complete_callbacks: Array = []


static var set_rank_cap_by_user_id_complete_callbacks: Array = []


static var multiply_acquire_actions_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "AddExperienceByUserId":
        var request_model = Gs2ExperienceAddExperienceByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceAddExperienceByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceAddExperienceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_experience_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetExperienceByUserId":
        var request_model = Gs2ExperienceSetExperienceByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceSetExperienceByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceSetExperienceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_experience_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AddRankCapByUserId":
        var request_model = Gs2ExperienceAddRankCapByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceAddRankCapByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceAddRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetRankCapByUserId":
        var request_model = Gs2ExperienceSetRankCapByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceSetRankCapByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceSetRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "MultiplyAcquireActionsByUserId":
        var request_model = Gs2ExperienceMultiplyAcquireActionsByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceMultiplyAcquireActionsByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceMultiplyAcquireActionsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in multiply_acquire_actions_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    pass


static var sub_experience_by_user_id_complete_callbacks: Array = []


static var sub_rank_cap_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "SubExperienceByUserId":
        var request_model = Gs2ExperienceSubExperienceByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceSubExperienceByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceSubExperienceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in sub_experience_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "SubRankCapByUserId":
        var request_model = Gs2ExperienceSubRankCapByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceSubRankCapByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceSubRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in sub_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "VerifyRankByUserId":
        if result == null:
            return
        var request_model = Gs2ExperienceVerifyRankByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceVerifyRankByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceVerifyRankByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    if method == "VerifyRankCapByUserId":
        if result == null:
            return
        var request_model = Gs2ExperienceVerifyRankCapByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2ExperienceVerifyRankCapByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2ExperienceVerifyRankCapByUserIdMethodCache.put_cache(
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
    if method == "add_experience_by_user_id":
        var request_model = Gs2ExperienceAddExperienceByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExperienceAddExperienceByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExperienceAddExperienceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_experience_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_experience_by_user_id":
        var request_model = Gs2ExperienceSetExperienceByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExperienceSetExperienceByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExperienceSetExperienceByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_experience_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "add_rank_cap_by_user_id":
        var request_model = Gs2ExperienceAddRankCapByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExperienceAddRankCapByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExperienceAddRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_rank_cap_by_user_id":
        var request_model = Gs2ExperienceSetRankCapByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExperienceSetRankCapByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExperienceSetRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "multiply_acquire_actions_by_user_id":
        var request_model = Gs2ExperienceMultiplyAcquireActionsByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2ExperienceMultiplyAcquireActionsByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2ExperienceMultiplyAcquireActionsByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in multiply_acquire_actions_by_user_id_complete_callbacks:
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