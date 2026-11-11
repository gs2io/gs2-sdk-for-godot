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
class_name Gs2Enchant
extends RefCounted



var _gs2: Gs2Domain
var _client: Gs2EnchantRestClient
var url: Variant = null
var upload_token: Variant = null
var upload_url: Variant = null


func _init(
    gs2: Gs2Domain
):
    _gs2 = gs2
    _client = Gs2EnchantRestClient.new(gs2.rest_session)


func create_namespace(
    request: Gs2EnchantCreateNamespaceRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantCreateNamespaceMethodCache.invoke(
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
    var domain = Gs2EnchantNamespaceDomain.new(
        _gs2,
        (null if ref == null else ref.name)
    )
    return Gs2AsyncResult.new(domain, null)


func dump_user_data(
    request: Gs2EnchantDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2EnchantCheckDumpUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantCheckDumpUserDataByUserIdMethodCache.invoke(
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
    request: Gs2EnchantCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2EnchantCheckCleanUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantCheckCleanUserDataByUserIdMethodCache.invoke(
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
    request: Gs2EnchantPrepareImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantPrepareImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2EnchantImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantImportUserDataByUserIdMethodCache.invoke(
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
    request: Gs2EnchantCheckImportUserDataByUserIdRequest
) -> Gs2AsyncResult:
    var async_result = await Gs2EnchantCheckImportUserDataByUserIdMethodCache.invoke(
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
) -> Gs2EnchantDescribeNamespacesIterator:
    return Gs2EnchantDescribeNamespacesIterator.new(
        _gs2,
        _client,
        name_prefix
    )


func subscribe_namespaces(
    callback: Callable,
    name_prefix = null
) -> int:
    return _gs2.cache.list_subscribe(
        "Gs2EnchantNamespace",
        Gs2EnchantNamespaceCache.cache_parent_key(
            null
        ),
        callback
    )


func unsubscribe_namespaces(
    callback_id: int,
    name_prefix = null
) -> void:
    _gs2.cache.list_unsubscribe(
        "Gs2EnchantNamespace",
        Gs2EnchantNamespaceCache.cache_parent_key(
            null
        ),
        callback_id
    )


func invalidate_namespaces(
    name_prefix = null
) -> void:
    _gs2.cache.clear_list_cache(
        "Gs2EnchantNamespace",
        Gs2EnchantNamespaceCache.cache_parent_key(
            null
        )
    )
func namespace_(
    namespace_name
) -> Gs2EnchantNamespaceDomain:
    return Gs2EnchantNamespaceDomain.new(
        _gs2,
        namespace_name
    )


static var re_draw_balance_parameter_status_by_user_id_complete_callbacks: Array = []


static var set_balance_parameter_status_by_user_id_complete_callbacks: Array = []


static var re_draw_rarity_parameter_status_by_user_id_complete_callbacks: Array = []


static var add_rarity_parameter_status_by_user_id_complete_callbacks: Array = []


static var set_rarity_parameter_status_by_user_id_complete_callbacks: Array = []


func update_cache_from_stamp_sheet(
    transaction_id,
    time_offset,
    method: String,
    request,
    result
) -> void:
    if method == "ReDrawBalanceParameterStatusByUserId":
        var request_model = Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnchantReDrawBalanceParameterStatusByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnchantReDrawBalanceParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in re_draw_balance_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetBalanceParameterStatusByUserId":
        var request_model = Gs2EnchantSetBalanceParameterStatusByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnchantSetBalanceParameterStatusByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnchantSetBalanceParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_balance_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "ReDrawRarityParameterStatusByUserId":
        var request_model = Gs2EnchantReDrawRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnchantReDrawRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnchantReDrawRarityParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in re_draw_rarity_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "AddRarityParameterStatusByUserId":
        var request_model = Gs2EnchantAddRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnchantAddRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnchantAddRarityParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_rarity_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(transaction_id, request_model, result_model)
        return
    if method == "SetRarityParameterStatusByUserId":
        var request_model = Gs2EnchantSetRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnchantSetRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnchantSetRarityParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_rarity_parameter_status_by_user_id_complete_callbacks:
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
    if method == "VerifyRarityParameterStatusByUserId":
        if result == null:
            return
        var request_model = Gs2EnchantVerifyRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(request))
        var result_model = Gs2EnchantVerifyRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result))
        Gs2EnchantVerifyRarityParameterStatusByUserIdMethodCache.put_cache(
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
    if method == "re_draw_balance_parameter_status_by_user_id":
        var request_model = Gs2EnchantReDrawBalanceParameterStatusByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnchantReDrawBalanceParameterStatusByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2EnchantReDrawBalanceParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in re_draw_balance_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_balance_parameter_status_by_user_id":
        var request_model = Gs2EnchantSetBalanceParameterStatusByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnchantSetBalanceParameterStatusByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2EnchantSetBalanceParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_balance_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "re_draw_rarity_parameter_status_by_user_id":
        var request_model = Gs2EnchantReDrawRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnchantReDrawRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2EnchantReDrawRarityParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in re_draw_rarity_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "add_rarity_parameter_status_by_user_id":
        var request_model = Gs2EnchantAddRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnchantAddRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2EnchantAddRarityParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in add_rarity_parameter_status_by_user_id_complete_callbacks:
            if callback is Callable and callback.is_valid():
                callback.call(job.job_id, request_model, result_model)
        return
    if method == "set_rarity_parameter_status_by_user_id":
        var request_model = Gs2EnchantSetRarityParameterStatusByUserIdRequest.from_dict(JSON.parse_string(job.args))
        var result_model = Gs2EnchantSetRarityParameterStatusByUserIdResult.from_dict(JSON.parse_string(result.result))
        Gs2EnchantSetRarityParameterStatusByUserIdMethodCache.put_cache(
            result_model,
            _gs2.cache,
            request_model.user_id,
            time_offset,
            request_model
        )
        for callback in set_rarity_parameter_status_by_user_id_complete_callbacks:
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