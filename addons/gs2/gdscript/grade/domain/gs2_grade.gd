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
class_name Gs2Grade
extends RefCounted



var _gs2: Gs2Domain
var _client: Gs2GradeRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2GradeRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2GradeCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2GradeNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2GradeDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GradeCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GradeCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GradeCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GradePrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradePrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GradeImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2GradeCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2GradeCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2GradeDescribeNamespacesIterator:
    return Gs2GradeDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2GradeNamespace",
        Gs2GradeNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2GradeNamespace",
        Gs2GradeNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2GradeNamespace",
        Gs2GradeNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2GradeNamespaceDomain:
    return Gs2GradeNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var add_grade_by_user_id_complete_callbacks: Array = []


static var apply_rank_cap_by_user_id_complete_callbacks: Array = []


static var multiply_acquire_actions_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "AddGradeByUserId":
        var request_model = Gs2GradeAddGradeByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GradeAddGradeByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2GradeAddGradeByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_grade_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "ApplyRankCapByUserId":
        var request_model = Gs2GradeApplyRankCapByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GradeApplyRankCapByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2GradeApplyRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in apply_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "MultiplyAcquireActionsByUserId":
        var request_model = Gs2GradeMultiplyAcquireActionsByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GradeMultiplyAcquireActionsByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2GradeMultiplyAcquireActionsByUserIdMethodCache.put_cache(
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


static var sub_grade_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_task(
    task_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "SubGradeByUserId":
        var request_model = Gs2GradeSubGradeByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GradeSubGradeByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2GradeSubGradeByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in sub_grade_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(task_id, request_model, result_model)
        return
    if method == "VerifyGradeByUserId":
        if result == null:
            return
        var request_model = Gs2GradeVerifyGradeByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GradeVerifyGradeByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2GradeVerifyGradeByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        return
    if method == "VerifyGradeUpMaterialByUserId":
        if result == null:
            return
        var request_model = Gs2GradeVerifyGradeUpMaterialByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2GradeVerifyGradeUpMaterialByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2GradeVerifyGradeUpMaterialByUserIdMethodCache.put_cache(
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
    if method == "add_grade_by_user_id":
        var request_model = Gs2GradeAddGradeByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2GradeAddGradeByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2GradeAddGradeByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_grade_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "apply_rank_cap_by_user_id":
        var request_model = Gs2GradeApplyRankCapByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2GradeApplyRankCapByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2GradeApplyRankCapByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in apply_rank_cap_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "multiply_acquire_actions_by_user_id":
        var request_model = Gs2GradeMultiplyAcquireActionsByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2GradeMultiplyAcquireActionsByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2GradeMultiplyAcquireActionsByUserIdMethodCache.put_cache(
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